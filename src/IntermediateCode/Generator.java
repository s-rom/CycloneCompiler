package IntermediateCode;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
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
                                return dst
*/  


public class Generator {
    
    
    private final int COMMENT_SPACES = 30;
    private final int TAB_SPACES = 4;
    private final String TAB = this.getNSpaces(TAB_SPACES);
    public String getTabs() { return TAB; }
    
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
        keywordTable = new String[Opcode.values().length];
        opcodeTable = new HashMap();
        this.intializeEquivalenceTable();
        
        try {
            bw = new BufferedWriter(new FileWriter(fileName));
        } catch (IOException ex) {
            System.err.println("Error trying to open "+fileName+": "+ex.getMessage());
        }
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
        String instr = TAB + dst + " = " + src;
        write(instr);
        return instr;
    }
    
    public String generateAssignation(Object src, Object dst, String commentary){
        String instr = TAB + dst + " = " + src;
        int length = instr.length();
        instr += getNSpaces(COMMENT_SPACES - length);
        instr += "# "+commentary;
        
        write(instr);
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
        return instr;
    }
    
    public String generateUnary(Opcode op, Object src1, Object dst){
        String instr = TAB + dst + " = " + keywordTable[op.ordinal()] + ' ' + src1;
        write(instr);
        return instr;
    }
    
    public String generateRelational(Opcode op, Object src1, Object src2, Tag dst){
        String instr = TAB + "if ( "+src1 + ' ' + keywordTable[op.ordinal()] + ' '+src2 + " ) " +
                keywordTable[Opcode.GOTO.ordinal()] + ' ' + dst;
        write(instr);
        return instr;
    }
    
    public String generateSkip(Tag t){
        String instr = t + ": "+keywordTable[Opcode.SKIP.ordinal()];
        write(instr);
        return instr;
    }
    
    public String generateSkip(Tag t, String commentary){
        String instr = t + ": "+keywordTable[Opcode.SKIP.ordinal()];
        
        int length = instr.length();
        instr += getNSpaces(COMMENT_SPACES - length);
        instr += "# "+commentary;
        
        
        write(instr);
        return instr;
    }
    
    public String generateGoto(Tag t){
        String instr = TAB + keywordTable[Opcode.GOTO.ordinal()]+ ' '+t;
        write(instr);
        return instr;
    }
    
    public String generateCall(Tag t){
        String instr = TAB + keywordTable[Opcode.CALL.ordinal()] + ' '+t;
        write(instr);
        return instr;
    }
    
    public String generateReturn(Object returnObject){
        String instr = TAB + keywordTable[Opcode.RET.ordinal()] + 
                ((returnObject == null)? "" : " " + returnObject);
        write(instr);
        return instr;
    }
    
    public String generateParam(Object param){
        String instr = TAB + keywordTable[Opcode.PARAM.ordinal()] + ' ' + param;
        write(instr);
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
        
        
        for (Opcode op: Opcode.values()){
            int idx = op.ordinal();
            String keyword = keywordTable[idx];
            opcodeTable.put(keyword, op);
        }
    }

    
}
