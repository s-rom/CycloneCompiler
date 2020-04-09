package IntermediateCode;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
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
    
    String [] equivalenceTable;
    
    BufferedWriter bw;
    
    public Generator(String fileName){
        equivalenceTable = new String[Opcode.values().length];
        this.intializeEquivalenceTable();
        
        try {
            bw = new BufferedWriter(new FileWriter(fileName));
        } catch (IOException ex) {
            System.err.println("Error trying to open "+fileName+": "+ex.getMessage());
        }
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
        String instr = dst + " = " + src;
        write(instr);
        return instr;
    }
    
    public String generateBinary(Opcode op, Object src1, Object src2, Object dst){
        String instr = dst + " = " + src1 + ' ' + equivalenceTable[op.ordinal()]+ ' ' + src2;
        write(instr);
        return instr;
    }
    
    public String generateUnary(Opcode op, Object src1, Object dst){
        String instr = dst + " = " + equivalenceTable[op.ordinal()] + ' ' + src1;
        write(instr);
        return instr;
    }
    
    public String generateRelational(Opcode op, Object src1, Object src2, Tag dst){
        String instr = "if ( "+src1 + ' ' + equivalenceTable[op.ordinal()] + ' '+src2 + " ) " +
                equivalenceTable[Opcode.GOTO.ordinal()] + ' ' + dst;
        write(instr);
        return instr;
    }
    
    public String generateGoto(Tag t){
        String instr =  equivalenceTable[Opcode.GOTO.ordinal()]+ ' '+t;
        write(instr);
        return instr;
    }
    
    public String generateCall(Tag t){
        String instr = equivalenceTable[Opcode.CALL.ordinal()] + ' '+t;
        write(instr);
        return instr;
    }
    
    public String generateReturn(Object returnObject){
        String instr = equivalenceTable[Opcode.RET.ordinal()] + 
                ((returnObject == null)? "" : " " + returnObject);
        write(instr);
        return instr;
    }
    
    public String generateParam(Object param){
        String instr = equivalenceTable[Opcode.PARAM.ordinal()] + ' ' + param;
        write(instr);
        return instr;
    }
    
    private void intializeEquivalenceTable(){
        equivalenceTable[(Opcode.ADD).ordinal()] = "+";
        equivalenceTable[(Opcode.SUB).ordinal()] = "-";
        equivalenceTable[(Opcode.MULT).ordinal()] = "*";
        equivalenceTable[(Opcode.DIV).ordinal()] = "/";
        equivalenceTable[(Opcode.MOD).ordinal()] = "%";
        
        equivalenceTable[(Opcode.AND).ordinal()] = "&&";
        equivalenceTable[(Opcode.OR).ordinal()] = "||";
        equivalenceTable[(Opcode.NOT).ordinal()] = "!";
        
        equivalenceTable[(Opcode.LT).ordinal()] = "<";
        equivalenceTable[(Opcode.GT).ordinal()] = ">";
        equivalenceTable[(Opcode.LE).ordinal()] = "<=";
        equivalenceTable[(Opcode.GE).ordinal()] = ">=";
        equivalenceTable[(Opcode.EQ).ordinal()] = "==";
        equivalenceTable[(Opcode.NE).ordinal()] = "!=";
        
        equivalenceTable[(Opcode.SKIP).ordinal()] = "skip";
        equivalenceTable[(Opcode.GOTO).ordinal()] = "goto";
        equivalenceTable[(Opcode.CALL).ordinal()] = "call";
        equivalenceTable[(Opcode.RET).ordinal()] = "return";
        equivalenceTable[(Opcode.FUN).ordinal()] = "fun";
        equivalenceTable[(Opcode.PARAM).ordinal()] = "param";
    }

    
}
