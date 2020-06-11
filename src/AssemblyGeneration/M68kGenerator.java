package AssemblyGeneration;

import IntermediateCode.Instruction;
import IntermediateCode.Tag;
import IntermediateCode.Variable;
import IntermediateCode.Function;
import SymbolTable.FuncDescription;
import cyclonecompiler.Main;

public class M68kGenerator extends AsmGenerator{

    private String TABS;
    
    private final int START_PROG_ADRESS = 0x1000;
    
    private final String [] SIZE_MODIFIERS = {"B", "W", "L"};
    private final String STACK_REG = "A7";
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
    }
    
    public String generatePmb(Instruction instr){
        String asmInstr = "";
        Function f = (Function) instr.getDst();
        
        String tabs = getNSpaces(AFTER_TAB - asmInstr.length());
        return BEFORE_TAB + asmInstr + tabs + ";"+instr.toString()+"\n";
//        int occup = (int) f.getLocalOccupation().getX();
//        asmInstr += BEFORE_TAB+"SUB.L #"+occup+", "+STACK_REG;
    }
    
    public String generateCall(Instruction instr){
        Tag funcTag = (Tag) instr.getDst();
        String asmInstr = BEFORE_TAB+"JSR "+funcTag.toString().toUpperCase();
        
        String tabs = getNSpaces(AFTER_TAB - asmInstr.length());
        return asmInstr + tabs + ";"+instr.toString()+"\n";
    }
    
    public String generateParam(Instruction instr){
        String asmInstr = BEFORE_TAB + load(instr.getDst(), D_REG_1, instr.toString());
        asmInstr += BEFORE_TAB + "MOVE.L "+D_REG_1+", -("+STACK_REG+")";
        return asmInstr;    
    }
    
    public String generateReturn(Instruction instr){
        String asmInstr = "";
        Function f = (Function) instr.getDst();

        Object retVal = instr.getSrc1();

        
        if (retVal != null){
            asmInstr += BEFORE_TAB+load(retVal, OUT_PARAM_REG, instr.toString());
        }
       
        asmInstr += BEFORE_TAB+"RTS";
//        int occup = (int) f.getLocalOccupation().getX();
//        asmInstr += BEFORE_TAB+"ADD.L #"+occup+", "+STACK_REG;
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
        asmInstr += " "+v.getOffset()+"("+STACK_REG+"), ";
        asmInstr += register;
        return asmInstr;
    }
    
    public String storeVar(String register, Variable v){
        String asmInstr = "MOVE."+getSizeModifier(4);
        asmInstr += " " + register + ", ";
        asmInstr += v.getOffset()+"("+STACK_REG+")";
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

        writeAsm(tabs+"JSR "+cycloneTag.toString().toUpperCase()+"\n");
        writeAsm(BEFORE_TAB+"SIMHALT\n");
        writeAsm(BEFORE_TAB+"END START\n");
    }
    
    private String generateAssignation(Instruction instr){
        Object src = instr.getSrc1();
        Variable vDst = (Variable) instr.getDst();
        String asmInstr = "";       
        
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
    
    @Override
    protected void generateAsmEquivalent(Instruction instr) {
        System.out.println("Converting "+instr.toString());
        switch(instr.getOp())
        {
            case ADD:
                writeAsm(generateAdd(instr));
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
        }
    }
}
