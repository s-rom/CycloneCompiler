package IntermediateCode;

import cyclonecompiler.InfoDump;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;


/*

Clase encargada de generar las instrucciones de código intermédio.

FORMATO: OPCODE SRC1 SRC2 DST

    * Operaciones binarias:     dst = src1 OP src2

    * Operaciones unarias:      dst = OP src1

    * Relacionales:             if ( src1 OP src2 ) goto dst

    * Control de programa:      dst: skip    
                                goto dst
                                call dst
                                param dst
                                return [src1], dst (ret value, function)
                                output dst
*/  


public class Generator {
    
    
    private final int COMMENT_SPACES = 30;
    private final int TAB_SPACES = 4;
    private final String TAB = this.getNSpaces(TAB_SPACES);
    public String getTabs() { return TAB; }
    
    // key: var ID 
    // value: list of variables and input parameters
    private HashMap<Integer, Variable> varTable;
    
    // key: func ID
    // value: list of functions
    private HashMap<Integer, Function> funcTable;
    
    private  Function currentFunction;
    
 
    
    String [] keywordTable;
    HashMap<String, Opcode> opcodeTable;
    
    BufferedWriter bw;
    
    private String getNSpaces(int n){
        String res ="";
        for (int i = 0; i<n; i++){
            res += ' ';
        }
        return res;
    }
    
    public Generator(String fileName){
        varTable = new HashMap();
        funcTable = new HashMap();
        
        keywordTable = new String[Opcode.values().length];
        opcodeTable = new HashMap();
        this.intializeEquivalenceTable();
        
        try {
            bw = new BufferedWriter(new FileWriter(fileName));
        } catch (IOException ex) {
            System.err.println("Error trying to open "+fileName+": "+ex.getMessage());
        }
    }
    
    public void addCurrentFunction(Function f){
        this.funcTable.put(f.getID(), f);
        this.currentFunction = f;
    }
    
    public Function getCurrentFunction(){
        return currentFunction;
    }
    
    public void addVariable(Variable v){
        if (varTable.get(v.getId()) == null){
            varTable.put(v.getId(), v);
            InfoDump.addIcVar(v);
        }
    }
    
    public Variable getVariable(int id){
        return varTable.get(id);
    }
    
    public ArrayList<Variable> getFunctionVariables(int funcID){
        ArrayList<Variable> vars = new ArrayList();
        for (Map.Entry entry: varTable.entrySet()){
            Variable v = (Variable)entry.getValue();
            if (v.getParentFuncID() == funcID){
                vars.add(v);
            }
        }
        return vars;
    }
    
    public void infoDumpAllFunctions(){
        for (Map.Entry entry: funcTable.entrySet()){
            InfoDump.addIcFunc(((Function)entry.getValue()));
            System.out.println(entry.getValue());
            ((Function)entry.getValue()).printInstructions();
        }
    }
    
    public Set<Map.Entry<Integer,Function>> getFunctionTable(){
        return this.funcTable.entrySet();
    }
    
    
    public Opcode getOpcodeEquivalence(String keyword){
        return opcodeTable.get(keyword);
    }
    
    public String getStringEquivalence(Opcode op){
        return keywordTable[op.ordinal()];
    }
    
    public void close(){
        try {
            bw.close();
        } catch (IOException ex) {
            Logger.getLogger(Generator.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void write(String instruction){
        try {
            bw.write(instruction);
            bw.newLine();
        } catch (IOException ex) {
            Logger.getLogger(Generator.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String generateAssignation(Object src, Object dst){
        boolean isStr = src instanceof String;
        String srcString = (isStr ? "\"":"") + src +  (isStr ? "\"":"");
        String instr = TAB + dst + " = " + srcString;
        
        write(instr);
        
        currentFunction.addInstruction(new Instruction(Opcode.ASSIGN, src, null, dst));
        return instr;
    }
    
    public String generatePmb(){
        String instr = TAB + keywordTable[Opcode.PMB.ordinal()] +" "+currentFunction.getTag();
        write(instr);
        currentFunction.addInstruction(new Instruction(Opcode.PMB, null, null, currentFunction));
        return instr;
    }
    
    public String generateAssignation(Object src, Object dst, String commentary){
          boolean isStr = src instanceof String;
        String srcString = (isStr ? "\"":"") + src +  (isStr ? "\"":"");
        String instr = TAB + dst + " = " + srcString;
        int length = instr.length();
        instr += getNSpaces(COMMENT_SPACES - length);
        instr += "# "+commentary;
        
        write(instr);
        
        currentFunction.addInstruction(new Instruction(Opcode.ASSIGN, src, null, dst));
        return instr;
    }
    
    public String generateCommentary(String commentary){
        write("# "+commentary);
        return "# "+commentary;
    }
    
    public String generateTabbedCommentary(String commentary){
        write(TAB+"# "+commentary);
        return TAB+"# "+commentary;
    }
    
    public String generateBinary(Opcode op, Object src1, Object src2, Object dst){
        String instr = TAB + dst + " = " + src1 + ' ' + keywordTable[op.ordinal()]+ ' ' + src2;
        write(instr);
        currentFunction.addInstruction(new Instruction(op, src1, src2, dst));
        return instr;
    }
    
    public String generateUnary(Opcode op, Object src1, Object dst){
        String instr = TAB + dst + " = " + keywordTable[op.ordinal()] + ' ' + src1;
        write(instr);
        currentFunction.addInstruction(new Instruction(op, src1, null, dst));
        return instr;
    }
    
    public String generateRelational(Opcode op, Object src1, Object src2, Tag dst){
        String instr = TAB + "if ( "+src1 + ' ' + keywordTable[op.ordinal()] + ' '+src2 + " ) " +
                keywordTable[Opcode.GOTO.ordinal()] + ' ' + dst;
        write(instr);
        currentFunction.addInstruction(new Instruction(op, src1, src2, dst));
        return instr;
    }
    
    public String generateSkip(Tag t){
        String instr = t + ": "+keywordTable[Opcode.SKIP.ordinal()];
        write(instr);
        currentFunction.addInstruction(new Instruction(Opcode.SKIP, null, null, t));
        return instr;
    }
    
    public String generateSkip(Tag t, String commentary){
        String instr = t + ": "+keywordTable[Opcode.SKIP.ordinal()];
        
        int length = instr.length();
        instr += getNSpaces(COMMENT_SPACES - length);
        instr += "# "+commentary;
        
        
        write(instr);
        currentFunction.addInstruction(new Instruction(Opcode.SKIP, null, null, t));
        return instr;
    }
    
    public String generateGoto(Tag t){
        String instr = TAB + keywordTable[Opcode.GOTO.ordinal()]+ ' '+t;
        write(instr);
        currentFunction.addInstruction(new Instruction(Opcode.GOTO, null, null, t));

        return instr;
    }
    
    public String generateOutput(Object var){
        String instr = TAB + keywordTable[Opcode.OUTPUT.ordinal()]+' '+var.toString();
        write(instr);
        currentFunction.addInstruction(new Instruction(Opcode.OUTPUT, null, null, var));
        return instr;
    }
    
    public String generateOutputLn(Object var){
        String instr = TAB + keywordTable[Opcode.OUTPUTLN.ordinal()]+' '+var.toString();
        write(instr);
        currentFunction.addInstruction(new Instruction(Opcode.OUTPUTLN, null, null, var));
        return instr;
    }
    
    public String generateCall(Tag t){
        String instr = TAB + keywordTable[Opcode.CALL.ordinal()] + ' '+t;
        write(instr);
        currentFunction.addInstruction(new Instruction(Opcode.CALL, null, null, t));
        return instr;
    }
    
    public String generateReturn(Object returnObject){
        String instr = TAB + keywordTable[Opcode.RET.ordinal()] + 
                ((returnObject == null)? "" : " " + returnObject);
        write(instr);
        currentFunction.addInstruction(new Instruction(Opcode.RET, returnObject, null, this.currentFunction));
        return instr;
    }
    
    public String generateParam(Object param){
        String instr = TAB + keywordTable[Opcode.PARAM.ordinal()] + ' ' + param;
        write(instr);
        currentFunction.addInstruction(new Instruction(Opcode.PARAM, null, null, param));
        return instr;
    }
    
    private void intializeEquivalenceTable(){
        keywordTable[(Opcode.ADD).ordinal()] = "+";
        keywordTable[(Opcode.SUB).ordinal()] = "-";
        keywordTable[(Opcode.MULT).ordinal()] = "*";
        keywordTable[(Opcode.DIV).ordinal()] = "/";
        keywordTable[(Opcode.MOD).ordinal()] = "%";
        
        keywordTable[(Opcode.AND).ordinal()] = "&&";
        keywordTable[(Opcode.OR).ordinal()] = "||";
        keywordTable[(Opcode.NOT).ordinal()] = "!";
        
        keywordTable[(Opcode.LT).ordinal()] = "<";
        keywordTable[(Opcode.GT).ordinal()] = ">";
        keywordTable[(Opcode.LE).ordinal()] = "<=";
        keywordTable[(Opcode.GE).ordinal()] = ">=";
        keywordTable[(Opcode.EQ).ordinal()] = "==";
        keywordTable[(Opcode.NE).ordinal()] = "!=";
        
        keywordTable[(Opcode.SKIP).ordinal()] = "skip";
        keywordTable[(Opcode.GOTO).ordinal()] = "goto";
        keywordTable[(Opcode.CALL).ordinal()] = "call";
        keywordTable[(Opcode.RET).ordinal()] = "return";
        keywordTable[(Opcode.FUN).ordinal()] = "fun";
        keywordTable[(Opcode.PARAM).ordinal()] = "param";
        keywordTable[(Opcode.ASSIGN).ordinal()] = "assign";
        keywordTable[(Opcode.PMB).ordinal()] = "pmb";
        keywordTable[(Opcode.OUTPUT).ordinal()] = "output";
        keywordTable[(Opcode.OUTPUTLN).ordinal()] = "outputln";
        keywordTable[(Opcode.INPUT).ordinal()] = "input";

        
        for (Opcode op: Opcode.values()){
            int idx = op.ordinal();
            String keyword = keywordTable[idx];
            opcodeTable.put(keyword, op);
        }
    }

    
}
