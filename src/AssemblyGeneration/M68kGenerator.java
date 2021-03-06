package AssemblyGeneration;

import IntermediateCode.FuncTag;
import IntermediateCode.Instruction;
import IntermediateCode.Tag;
import IntermediateCode.Variable;
import IntermediateCode.Function;
import IntermediateCode.Opcode;
import IntermediateCode.VarType;
import SymbolTable.FuncDescription;
import cyclonecompiler.Main;

public class M68kGenerator extends AsmGenerator{
    
    private final int START_PROG_ADRESS = 0x1000;
    private String LIB_PATH;
    private final String CYCLONE_LIB = "CYCLONE.X68";
    
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
    
    private String getBranchEquivalent(Opcode op){
        return "B"+op.name().toUpperCase();
    }
     
    public M68kGenerator(String filePath, String LIBPATH){
        super(filePath);
        this.LIB_PATH = LIBPATH;
        writeAsm(BEFORE_TAB+"ORG $"+Integer.toHexString(START_PROG_ADRESS)+"\n");
        writeAsm(BEFORE_TAB+"INCLUDE \""+LIB_PATH+CYCLONE_LIB+"\"\n");
    }
    
    public String generatePmb(Instruction instr){
        String asmInstr;
        Function f = (Function) instr.getDst();
        int localBytes = f.computeLocalOccupation().x;
        
        asmInstr = "MOVE.L "+BP+", -("+SP+")";
        asmInstr = getCommentedLine(asmInstr, ";"+instr.toString());
        asmInstr += BEFORE_TAB + "MOVE.L "+SP+", "+BP;
        
        if (localBytes > 0)
            asmInstr += "\n"+ BEFORE_TAB + "SUB.L #"+localBytes+", "+SP;
        return asmInstr;
    }
    
    public String getCommentedLine(String line, String commentary){
        String tabs = getNSpaces(AFTER_TAB - line.length());
        if (commentary.charAt(0) != ';') commentary = ';'+commentary;
        return BEFORE_TAB + line + tabs + commentary + "\n";
    }  
    
    public String move(Variable src, Variable dst, String comment){
        String asmInstr = getCommentedLine("MOVE.L "+src.getOffset()+"("+BP+"), "+
                                dst.getOffset()+"("+BP+")", comment);
        return asmInstr;
    }
    
    public String generateFun(Instruction instr){
        FuncTag funcTag = (FuncTag) instr.getDst();
        
        String asmInstr = "JSR " + funcTag.toString().toUpperCase();
        String tabs = getNSpaces(AFTER_TAB - asmInstr.length());
        asmInstr =  BEFORE_TAB + asmInstr + tabs + ";"+instr.toString()+"\n";
        asmInstr += BEFORE_TAB + store(OUT_PARAM_REG, instr.getSrc1());
        return asmInstr;
    }
    
    public String generateCall(Instruction instr){
        FuncTag funcTag = (FuncTag) instr.getDst();
        Function f = Main.gen.getFunctionByTag(funcTag);
        String asmInstr;
        
        if (f.isUserDefined())
            asmInstr = "JSR "+funcTag.toString().toUpperCase();
        else 
            asmInstr = "JSR "+f.getSubroutine();  
        
        
        String tabs = getNSpaces(AFTER_TAB - asmInstr.length());
        asmInstr =  BEFORE_TAB + asmInstr + tabs + ";"+instr.toString()+"\n";
        asmInstr += BEFORE_TAB + "ADD.L #" + f.computeLocalOccupation().y + ", "+SP;
        return asmInstr;
    }
    
    private String push(Variable v){
        return "MOVE.L "+v.getOffset()+"("+BP+"), -("+SP+")";
    }
    
    public String generateParam(Instruction instr){
        String asmInstr;
        
        if (instr.getDst() instanceof Integer){
            asmInstr = pushIntegerLiteral((Integer)instr.getDst());
            return this.getCommentedLine(asmInstr, instr.toString());
        }
//        
//        asmInstr = BEFORE_TAB + load(instr.getDst(), D_REG_1, instr.toString());
//        asmInstr += BEFORE_TAB + "MOVE.L "+D_REG_1+", -("+SP+")";
        
        return getCommentedLine(
                push((Variable) instr.getDst()), 
                instr.toString()
        );    
    }
    
    public String generateReturn(Instruction instr){
        String asmInstr;

        if (instr.getSrc1() != null) {
            asmInstr = BEFORE_TAB + load(instr.getSrc1(), OUT_PARAM_REG, instr.toString());
            asmInstr += BEFORE_TAB + "MOVE.L "+BP+", "+SP+"\n";
        } else{
            asmInstr = "MOVE.L "+BP+", "+SP;
            asmInstr = getCommentedLine(asmInstr, instr.toString());
        }        
        
        asmInstr += BEFORE_TAB+"MOVE.L ("+SP+")+, A6\n";
        asmInstr += BEFORE_TAB+"RTS";
        return asmInstr;
    }
    
    
    public String generateRead(Instruction instr){
        String asmInstr = "";
        Variable vDst = (Variable) instr.getDst();
        int trapNum = instr.getOp() == Opcode.READ_STRING ? 2 : 4;
        asmInstr = this.getCommentedLine("MOVE.L #"+trapNum+", D0", instr.toString());
        
        if (instr.getOp() == Opcode.READ_STRING) {
            asmInstr += BEFORE_TAB + "MOVE.L  A6, A1\n";
            asmInstr += BEFORE_TAB + "ADD.L #"+vDst.getOffset()+", A1\n";
        } 
            
        asmInstr += BEFORE_TAB + "TRAP #15";
        
        if (instr.getOp() == Opcode.READ_INT){
            asmInstr += "\n"+BEFORE_TAB+store("D1",vDst);
        }
        return asmInstr;
    }
  
    public String generateTag(Object t){
        if (t instanceof Tag)
            return ((Tag)t).toString().toUpperCase()+": ";
        else if (t instanceof FuncTag)
            return ((FuncTag)t).toString().toUpperCase()+": ";
        else 
        {
            System.out.println("t: "+t);
            System.err.println("generateTag error");
            return "";
        }
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
    
   public String meminit(Instruction instr){
       String asmInstr = "";
       Variable vDst = (Variable) instr.getDst();
       int bytes = vDst.getOccupation();
       int off = vDst.getOffset();
      
       int lastDec = 0;
       
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
            
            String hexStr = "";
            for (int i = 0; i < dec; i++)
                hexStr += "FF";
            
            asmInstr += BEFORE_TAB + "MOVE"+mod+" #$"+hexStr+","+off+"(A6)\n";
            off += dec;
            lastDec = dec;
        }
        
        int lastOff = off - lastDec + 1;
        asmInstr += BEFORE_TAB + "MOVE.B #$00, "+lastOff+"(A6)\n";

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
            return loadConstant(o.toString(), register) + "\n";
    }
    
    private String load(Object o, String register, String commentary){
        String instrAsm;
        if (o instanceof Variable)
            instrAsm = loadVar((Variable) o, register);
        else
            instrAsm = loadConstant(o.toString(), register);
        
        
        String tabs = getNSpaces(AFTER_TAB - instrAsm.length());
        return instrAsm + tabs + ";"+commentary+"\n";
    }
    
    private String generateSub(Instruction instr){
        String asmInstr = "";
        Object src1 = instr.getSrc1();
        Object src2 = instr.getSrc2();
        Variable vDst = (Variable) instr.getDst();
        
        asmInstr += BEFORE_TAB+load(src1, D_REG_1, instr.toString());
        asmInstr += BEFORE_TAB+load(src2, D_REG_2);
        asmInstr += BEFORE_TAB+"SUB.L"+" "+D_REG_2+", "+D_REG_1+"\n";
        asmInstr += BEFORE_TAB+store(D_REG_1, vDst);        
        return asmInstr;
    }
    
    private String generateBinaryOpcode(Instruction instr, String opcode, String size){
        String asmInstr = "";
        Object src1 = instr.getSrc1();
        Object src2 = instr.getSrc2();
        Variable vDst = (Variable) instr.getDst();
        
        asmInstr += BEFORE_TAB+load(src1, D_REG_1, instr.toString());
        asmInstr += BEFORE_TAB+load(src2, D_REG_2);
        asmInstr += BEFORE_TAB+opcode+size+" "+D_REG_1+", "+D_REG_2+"\n";
        asmInstr += BEFORE_TAB+store(D_REG_2, vDst);        
        return asmInstr;
    }
    
    private String generateDiv(Instruction instr){
        String asmInstr = "";
        Object src1 = instr.getSrc1();
        Object src2 = instr.getSrc2();
        Variable vDst = (Variable) instr.getDst();
        asmInstr += BEFORE_TAB+load(src1, D_REG_2, instr.toString());
        asmInstr += BEFORE_TAB+load(src2, D_REG_1);
        
        asmInstr += BEFORE_TAB+"DIVS "+D_REG_1+", "+D_REG_2+"\n";
        asmInstr += BEFORE_TAB+"AND.L #$0000FFFF, "+D_REG_2+"\n";
        
        asmInstr += BEFORE_TAB+store(D_REG_2, vDst);        
        return asmInstr;
    }
    
    
      private String generateMod(Instruction instr){
        String asmInstr = "";
        Object src1 = instr.getSrc1();
        Object src2 = instr.getSrc2();
        Variable vDst = (Variable) instr.getDst();
        asmInstr += BEFORE_TAB+load(src1, D_REG_2, instr.toString());
        asmInstr += BEFORE_TAB+load(src2, D_REG_1);
        
        asmInstr += BEFORE_TAB+"DIVS "+D_REG_1+", "+D_REG_2+"\n";
        asmInstr += BEFORE_TAB+"LSR.L  #8, "+D_REG_2+"\n";
        asmInstr += BEFORE_TAB+"LSR.L  #8, "+D_REG_2+"\n";
        asmInstr += BEFORE_TAB+store(D_REG_2, vDst);        
        return asmInstr;
    }
    
    private String generateBinaryOpcode(Instruction instr, String opcode){
        return generateBinaryOpcode(instr,opcode,".L");
    }
    
    
   private String generateNot(Instruction instr){
        String asmInstr = "";
        Object src1 = instr.getSrc1();
        Variable vDst = (Variable) instr.getDst();

        asmInstr += BEFORE_TAB+load(src1, D_REG_1, instr.toString());
        asmInstr += BEFORE_TAB+"NOT.L "+D_REG_1+"\n";
        asmInstr += BEFORE_TAB+store(D_REG_2, vDst);        

        return asmInstr;
   }
    
    @Override
    public void generateMain(){
        writeAsm("\nSTART:");
        String tabs = getNSpaces((BEFORE_TAB.length()) - ("START:".length()));
        FuncDescription cycloneFunc = (FuncDescription) Main.ts.getForward("cyclone");
       
        FuncTag cycloneTag = cycloneFunc.getTag();
        writeAsm(tabs+"MOVE.L "+SP+", "+BP+"\n");
        writeAsm(BEFORE_TAB+"JSR "+cycloneTag.toString().toUpperCase()+"\n");
        writeAsm(BEFORE_TAB+"SIMHALT\n");
        writeAsm(BEFORE_TAB+"END START\n");
    }
    
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
    
    private String moveIntegerLiteral(int literal, Variable dst){
        return "MOVE.L #"+literal+", "+dst.getOffset()+"("+this.BP+")";
    }
    
    private String pushIntegerLiteral(int literal){
        return "MOVE.L #"+literal+", -("+SP+")";
    }
    
    private String generateAssignation(Instruction instr){
        Object src = instr.getSrc1();
        Variable vDst = (Variable) instr.getDst();
        
        if (src instanceof String){
            return storeStringLiteral(vDst, (String) src);
        }
        
        if (vDst.getType() == VarType.STRING && src instanceof Variable){
            Variable vSrc = (Variable) src;
            return copyStrings(vDst, vSrc, instr);
        }
        
        if (instr.getSrc1() instanceof Integer){
            String asmInstr = moveIntegerLiteral((Integer)instr.getSrc1(), vDst);
            return getCommentedLine(asmInstr, instr.toString());
        }
//        
//        asmInstr += BEFORE_TAB + load(src, D_REG_1, instr.toString());
//        asmInstr += BEFORE_TAB + store(D_REG_1, vDst);
        
        return move((Variable)instr.getSrc1(), (Variable)instr.getDst(), instr.toString())
                +"\n";
    }
    
    private String generateGoto(Instruction instr){
        Tag t = (Tag) instr.getDst();
        String asmInstr = "JMP "+ t.toString().toUpperCase();
        String tabs = getNSpaces(AFTER_TAB - asmInstr.length());
        return BEFORE_TAB + asmInstr + tabs + ";"+instr.toString()+"\n";
    }
    
    private String generateIfGoto(Instruction instr){
        String asmInstr = "";
        Tag dstTag = (Tag) instr.getDst();
        
        // if ( a op b ) goto e
        // MOVE.L a, D_REG_1
        // MOVE.L b, D_REG_2
        // CMP.L  D_REG_2, D_REG_1
        // Bcc e
        
        asmInstr += BEFORE_TAB + load(instr.getSrc1(), D_REG_1, instr.toString());
        asmInstr += BEFORE_TAB + load(instr.getSrc2(), D_REG_2);
        asmInstr += BEFORE_TAB + "CMP.L "+D_REG_2+", "+D_REG_1 + "\n";
        asmInstr += BEFORE_TAB + getBranchEquivalent(instr.getOp()) +" "+dstTag.toString().toUpperCase() + "\n";
      
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
        switch(instr.getOp())
        {
            case MEMINIT:
                writeAsm(this.meminit(instr));
                break;
                
            case ADD:
                writeAsm(generateBinaryOpcode(instr, "ADD"));
                break;
            
            case SUB:
                writeAsm(generateSub(instr));
                break;
            
            case MULT:
                writeAsm(generateBinaryOpcode(instr, "MULS", ""));
                break;
            
            case DIV:
                writeAsm(generateDiv(instr));
                break;
            
            case MOD:
                writeAsm(generateMod(instr));
                break;
            
            case AND:
                writeAsm(generateBinaryOpcode(instr, "AND"));
                break;
            
            case OR:
                writeAsm(generateBinaryOpcode(instr, "OR"));
                break;
            
            case NOT:
                writeAsm(generateNot(instr));
                break;
                
            case SKIP:
                String skipStr = generateTag(instr.getDst());
                writeAsm(skipStr + "\n");
                break;
            
            case GOTO:
                writeAsm(generateGoto(instr));
                break;
            
            case GT:
            case LT:
            case GE:
            case LE:
            case EQ:
            case NE:
                writeAsm(generateIfGoto(instr)+"\n");
                break;
            
            case CALL:
                writeAsm(generateCall(instr)+"\n");
                break;
            
            case FUN:
                writeAsm(generateFun(instr)+"\n");
                break;
            
            case RET:
                writeAsm(generateReturn(instr)+"\n");
                break;
                
            case PARAM:
                writeAsm(generateParam(instr));
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
            case READ_STRING:
            case READ_INT:
                writeAsm(generateRead(instr));
        }
    }
    
    private String generateUnarySub(Instruction instr) {
        String asmInstr = BEFORE_TAB + load(instr.getSrc1(), D_REG_1, instr.toString());
        asmInstr += BEFORE_TAB + load(0, D_REG_2);
        asmInstr += BEFORE_TAB + "SUB.L "+ D_REG_1 + ", " + D_REG_2 + "\n";
        asmInstr += BEFORE_TAB +store(D_REG_2, instr.getDst());
        return asmInstr;
    }

}
