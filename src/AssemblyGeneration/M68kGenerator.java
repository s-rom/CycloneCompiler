package AssemblyGeneration;

import IntermediateCode.Instruction;
import IntermediateCode.Tag;
import IntermediateCode.Variable;
import IntermediateCode.Function;
import IntermediateCode.VarType;
import SymbolTable.FuncDescription;
import cyclonecompiler.Main;

public class M68kGenerator extends AsmGenerator{
    
    private final int START_PROG_ADRESS = 0x1000;
    private final String LIB_PATH = "../68LIB/";
    private final String PRINT_LIB = "PRNTLIB.X68";
    private final String STR_LIB = "STRLIB.X68";
    
    private final String [] SIZE_MODIFIERS = {"B", "W", "L"};
    
    private final String SP = "A7";
    private final String BP = "A6";
    
    private final String OUT_PARAM_REG = "D7";
    
    private final String D_REG_1 = "D6";
    private final String D_REG_2 = "D5";
    
    private final String BEFORE_TAB = getNSpaces(12);
    private final int AFTER_TAB = 30;

    
    private String getNChars(int n, char c){
        String res ="";
        for (int i = 0; i<n; i++){
            res += c;
        }
        return res;
    }
    
    private String getNSpaces(int n){
        return getNChars(n, ' ');
    }
    
    private String getNTabs(int n){
        return getNChars(n, '\t');
    }
  
     
    public M68kGenerator(String filePath){
        super(filePath);
        writeAsm(BEFORE_TAB+"ORG $"+Integer.toHexString(START_PROG_ADRESS)+"\n");
        writeAsm(BEFORE_TAB+"INCLUDE \""+LIB_PATH+PRINT_LIB+"\"\n");
        writeAsm(BEFORE_TAB+"INCLUDE \""+LIB_PATH+STR_LIB+"\"\n");
    }
    
    public String generatePmb(Instruction instr){
        String asmInstr = "";
        Function f = (Function) instr.getDst();
        int localBytes = f.getLocalOccupation().x;
        
        asmInstr = "MOVE.L "+BP+", -("+SP+")";
        asmInstr = getCommentedLine(asmInstr, ";"+instr.toString());
        asmInstr += BEFORE_TAB + "MOVE.L "+SP+", "+BP + "\n";
        
        if (localBytes > 0)
            asmInstr += BEFORE_TAB + "SUB.L #"+localBytes+", "+SP+"\n";
        return asmInstr;
    }
    
    public String getCommentedLine(String line, String commentary){
        String tabs = getNSpaces(AFTER_TAB - line.length());
        if (commentary.charAt(0) != ';') commentary = ';'+commentary;
        return BEFORE_TAB + line + tabs + commentary + "\n";
    }   
    
    public String generateCall(Instruction instr){
        Tag funcTag = (Tag) instr.getDst();
        Function f = Main.gen.getFunctionByTag(funcTag);
        String asmInstr = "JSR "+funcTag.toString().toUpperCase();
        
        String tabs = getNSpaces(AFTER_TAB - asmInstr.length());
        asmInstr =  BEFORE_TAB + asmInstr + tabs + ";"+instr.toString()+"\n";
        asmInstr += BEFORE_TAB + "ADD.L #" + f.getLocalOccupation().y + ", "+SP+"\n";
        return asmInstr;
    }
    
    public String generateParam(Instruction instr){
        String asmInstr = BEFORE_TAB + load(instr.getDst(), D_REG_1, instr.toString());
        asmInstr += BEFORE_TAB + "MOVE.L "+D_REG_1+", -("+SP+")";
        return asmInstr;    
    }
    
    public String generateReturn(Instruction instr){
        String asmInstr;
        Function f = (Function) instr.getDst();

        //TODO: Gestionar valor devuelto
//        Object retVal = instr.getSrc1(); 
//        if (retVal != null){
//            asmInstr += BEFORE_TAB+load(retVal, OUT_PARAM_REG, instr.toString());
//        }
       
        asmInstr = "MOVE.L "+BP+", "+SP;
        asmInstr = getCommentedLine(asmInstr, instr.toString());
        asmInstr += BEFORE_TAB+"MOVE.L ("+SP+")+, A6\n";
        asmInstr += BEFORE_TAB+"RTS";
        return asmInstr;
    }
    
  
    public String generateTag(Tag t){
        return t.toString().toUpperCase()+": ";
    }
    
    public String loadConstant(String literal, String register){
        String asmInstr = "MOVE."+getSizeModifier(4);
        asmInstr += " #"+literal+", ";
        asmInstr += register;
        return asmInstr;
    }
    
    public String loadVar(Variable v, String register){
        String asmInstr = "MOVE."+getSizeModifier(4);
        asmInstr += " "+v.getOffset()+"("+BP+"), ";
        asmInstr += register;
        return asmInstr;
    }
    
    public String storeVar(String register, Variable v){
        String asmInstr = "MOVE."+getSizeModifier(4);
        asmInstr += " " + register + ", ";
        asmInstr += v.getOffset()+"("+BP+")";
        return asmInstr;
    }
    
   public String storeStringLiteral(Variable v, String str_lit) {
        String asmInstr = "";
        int bytes = v.getOccupation();
        int off = v.getOffset();
        
        // Sets null padding
        while (str_lit.length() < bytes)
            str_lit += "\0";
        
        
        while (bytes > 0){
            int dec; // 4 or 2
            String mod; // .L or .W
            
            if (bytes - 4 >= 0) { // string of 4 bytes
                dec = 4;
                mod = ".L";
            } else { // string of 2 bytes
                dec = 2;
                mod = ".W";
            }
            
            bytes -= dec;
            
            
            String subStr = str_lit.substring(0, dec);
            String hexStr = "";
            for (int i = 0 ; i < subStr.length(); i++){
                String hex = Integer.toHexString(subStr.charAt(i));
                if (hex.length() < 2){
                    hex = "0"+hex;
                }
                
                hexStr += hex;
            }
            
            str_lit = str_lit.substring(dec);
            
            
            asmInstr += BEFORE_TAB + "MOVE"+mod+" #$"+hexStr+","+off+"(A6)\n";
            off += dec;
        }
        
        return asmInstr;
    }
    
    public String getSizeModifier(int bytes){
        // log base 2 de bytes
        int idx;
        if (bytes <= 0) idx = 0;
        else idx = (int) (Math.log(bytes) / Math.log(2));
        
        return this.SIZE_MODIFIERS[idx];
    }
    
    private String store(String register, Object dst){
        return storeVar(register, (Variable)dst) + "\n";
    }
    
    private String load(Object o, String register){
        if (o instanceof Variable)
            return loadVar((Variable) o, register) + "\n";
        else 
            return loadConstant(o.toString(), D_REG_1) + "\n";
    }
    
    private String load(Object o, String register, String commentary){
        String instrAsm;
        if (o instanceof Variable)
            instrAsm = loadVar((Variable) o, register);
        else
            instrAsm = loadConstant(o.toString(), D_REG_1);
        
        
        String tabs = getNSpaces(AFTER_TAB - instrAsm.length());
        return instrAsm + tabs + ";"+commentary+"\n";
    }
    
    private String generateAdd(Instruction instr){
        String asmInstr = "";
        // a = b + c
        
        // LD b, REG
        Object src1 = instr.getSrc1();
        Object src2 = instr.getSrc2();
        Variable vDst = (Variable) instr.getDst();
        
        asmInstr += BEFORE_TAB+load(src1, D_REG_1, instr.toString());
        asmInstr += BEFORE_TAB+load(src2, D_REG_2);
        asmInstr += BEFORE_TAB+"ADD.L "+D_REG_1+", "+D_REG_2+"\n";
        asmInstr += BEFORE_TAB+store(D_REG_2, vDst);
                
        // LD c, REG2
        // ADD REG, REG2
        // ST REG2, a
        
        return asmInstr;
    }
    
    @Override
    public void generateMain(){
        writeAsm("\nSTART:");
        String tabs = getNSpaces((BEFORE_TAB.length()) - ("START:".length()));
        FuncDescription cycloneFunc = (FuncDescription) Main.ts.getForward("cyclone");
        Tag cycloneTag = cycloneFunc.getTag();
        writeAsm(tabs+"MOVE.L "+SP+", "+BP+"\n");
        writeAsm(BEFORE_TAB+"JSR "+cycloneTag.toString().toUpperCase()+"\n");
        writeAsm(BEFORE_TAB+"SIMHALT\n");
        writeAsm(BEFORE_TAB+"END START\n");
    }
    
    // TODO: test
    private String copyStrings(Variable vDst, Variable vSrc, Instruction instr){
        String asmInstr;
        int offDst = vDst.getOffset();
        int offSrc = vSrc.getOffset();
        
        asmInstr = "MOVE.L "+BP+", A1";
        String tabs = getNSpaces(AFTER_TAB - asmInstr.length());
        asmInstr = BEFORE_TAB + asmInstr + tabs + ";"+instr.toString()+"\n";
        
        asmInstr += BEFORE_TAB + "MOVE.L "+BP+", A2\n";
        asmInstr += BEFORE_TAB + "ADDA #"+offDst+", A1\n";
        asmInstr += BEFORE_TAB + "ADDA #"+offSrc+", A2\n";
        asmInstr += BEFORE_TAB + "JSR STRCPY\n";
            
        return asmInstr;
    }
    
    private String generateAssignation(Instruction instr){
        Object src = instr.getSrc1();
        Variable vDst = (Variable) instr.getDst();
        String asmInstr = "";       
        
        if (src instanceof String){
            return storeStringLiteral(vDst, (String) src);
        }
        
        if (vDst.getType() == VarType.STRING && src instanceof Variable){
            Variable vSrc = (Variable) src;
            return copyStrings(vDst, vSrc, instr);
        }
        
        asmInstr += BEFORE_TAB + load(src, D_REG_1, instr.toString());
        asmInstr += BEFORE_TAB + store(D_REG_1, vDst);
        return asmInstr;
    }
    
    private String generateGoto(Instruction instr){
        Tag t = (Tag) instr.getDst();
        String asmInstr = "JMP "+ t.toString().toUpperCase();
        String tabs = getNSpaces(AFTER_TAB - asmInstr.length());
        return BEFORE_TAB + asmInstr + tabs + ";"+instr.toString()+"\n";
    }
    
    private String generateIfGoto(Instruction instr){
        String asmInstr = "";
        asmInstr += BEFORE_TAB + load(instr.getSrc1(), D_REG_1, instr.toString());
        asmInstr += BEFORE_TAB + load(instr.getSrc2(), D_REG_2);
        asmInstr += BEFORE_TAB + "CMP.L "+D_REG_2+", "+D_REG_1 + "\n";
      
      
        // if ( a op b ) goto e
        // MOVE.L a, D_REG_1
        // MOVE.L b, D_REG_2
        // CMP.L  D_REG_2, D_REG_1
        // Bop e
        
        return asmInstr;
    }
    
    private String generateOutput(Instruction instr, boolean ln){
        String asmInstr = "";
        int trapNum = 0;
        Object dst = instr.getDst();
        
        if (! (dst instanceof Variable))
            return asmInstr;
        
        Variable vDst = (Variable) dst;
        switch(vDst.getType()){
            case INT:
                asmInstr += BEFORE_TAB + load(dst, "D1", instr.toString());
                trapNum = 3;
                asmInstr += BEFORE_TAB + "MOVE.L #"+trapNum+", D0\n";
                asmInstr += BEFORE_TAB + "TRAP #15";
                if (ln)
                    asmInstr += "\n" + BEFORE_TAB + "JSR NEWLN\n"; 
                break;
                
            case BOOL:
                String sub = ln ? "PRNTBOLN" : "PRNTBOOL";
                asmInstr += BEFORE_TAB + load(dst, "D1", instr.toString());
                asmInstr += BEFORE_TAB + "JSR "+sub+"\n";
                break;

            case STRING:
                asmInstr +=  "MOVE.L "+BP+", A1";
                String tabs = getNSpaces(AFTER_TAB - asmInstr.length());
                asmInstr += tabs+";"+instr.toString()+"\n";
                asmInstr = BEFORE_TAB+asmInstr;

                asmInstr += BEFORE_TAB + "ADDA.L #"+vDst.getOffset()+", A1\n";
                trapNum = ln ? 13 : 14;
                asmInstr += BEFORE_TAB + "MOVE.L #"+trapNum+", D0\n";
                asmInstr += BEFORE_TAB + "TRAP #15";
                break;
        }
        
       
        
        return asmInstr;
    }
    
    @Override
    protected void generateAsmEquivalent(Instruction instr) {
        System.out.println("Converting "+instr.toString());
        switch(instr.getOp())
        {
            case ADD:
                //writeAsm(generateAdd(instr));
                break;
            
            case SUB:
                break;
            
            case MULT:
                break;
            
            case DIV:
                break;
            
            case MOD:
                break;
            
            case AND:
                break;
            
            case OR:
                break;
            
            case NOT:
                break;
                
            case SKIP:
                String skipStr = generateTag((Tag) instr.getDst());
                writeAsm(skipStr + "\n");
                break;
            
            case GOTO:
                writeAsm(generateGoto(instr));
                break;
            
            case GT:
                break;
            
            case LT:
                break;
            
            case GE:
                break;
            
            case LE: 
                break;
            
            case EQ:
                break;
            
            case NE:
                break;
            
            case CALL:
                writeAsm(generateCall(instr)+"\n");
                break;
            
            case FUN:
                break;
            
            case RET:
                writeAsm(generateReturn(instr)+"\n");
                break;
                
            case PARAM:
                writeAsm(generateParam(instr)+"\n");
                break;
            
            case ASSIGN:
                writeAsm(generateAssignation(instr));
                break;
            
            case PMB:
                writeAsm(generatePmb(instr)+"\n");
                break;
                
            case OUTPUT:
                writeAsm(generateOutput(instr,false)+"\n");
                break;
                
            case OUTPUTLN:
                writeAsm(generateOutput(instr,true)+"\n");
                break;
        }
    }
}
