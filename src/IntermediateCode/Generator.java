package IntermediateCode;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;


/*

Clase encargada de generar las instrucciones de código intermédio.

Ejemplo de uso:
    Generator gen = new Generator("IntermediateCode.ic");


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
    
    public Generator(){
        bw = null;
    }
    
    public String generateAssignation(Object src, Object dst){
        return dst + " = " + src;
    }
    
    public String generateBinary(Opcode op, Object src1, Object src2, Object dst){
        return dst + " = " + src1 + ' ' + equivalenceTable[op.ordinal()]+ ' ' + src2;
    }
    
    public String generateUnary(Opcode op, Object src1, Object dst){
        return dst + " = " + equivalenceTable[op.ordinal()] + ' ' + src1;
    }
    
    public String generateRelational(Opcode op, Object src1, Object src2, Tag dst){
        return "if ( "+src1 + ' ' + equivalenceTable[op.ordinal()] + ' '+src2 + " ) " +
                equivalenceTable[Opcode.GOTO.ordinal()] + ' ' + dst;
    }
    
    public String generateGoto(Tag t){
        return equivalenceTable[Opcode.GOTO.ordinal()]+ ' '+t;
    }
    
    public String generateCall(Tag t){
        return equivalenceTable[Opcode.CALL.ordinal()] + ' '+t;
    }
    
    public String generateReturn(Object returnObject){
        return equivalenceTable[Opcode.RET.ordinal()] + 
                ((returnObject == null)? "" : " " + returnObject);
    }
    
    public String generateParam(Object param){
        return equivalenceTable[Opcode.PARAM.ordinal()] + ' ' + param;
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
