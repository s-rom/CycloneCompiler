package IntermediateCode;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map.Entry;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Optimizer {

    private BufferedWriter bw;
    private HashMap<Integer, Function> ic_code;
    private Set<Opcode> constantOpcodes;

    public Optimizer(String filePath, HashMap<Integer,Function> ic_code){
        this.ic_code = ic_code;
        constantOpcodes = new HashSet<>();
        initConstantOpcodesSet();
        try {
            bw = new BufferedWriter(new FileWriter(filePath));
        } catch (IOException ex) {
            System.err.println("Error trying to open "+filePath+": "+ex.getMessage());
        }
    }
    
    private void initConstantOpcodesSet(){
        constantOpcodes.add(Opcode.ADD);
        constantOpcodes.add(Opcode.SUB);
        constantOpcodes.add(Opcode.MULT);
        constantOpcodes.add(Opcode.DIV);
        constantOpcodes.add(Opcode.MOD);
        
        constantOpcodes.add(Opcode.AND);
        constantOpcodes.add(Opcode.OR);
        constantOpcodes.add(Opcode.NOT);
        
        constantOpcodes.add(Opcode.GT);
        constantOpcodes.add(Opcode.GE);
        constantOpcodes.add(Opcode.LT);
        constantOpcodes.add(Opcode.LE);
        constantOpcodes.add(Opcode.EQ);
        constantOpcodes.add(Opcode.NE);
    }
    
    public void optimize(){
        for (Entry<Integer,Function> entry : ic_code.entrySet()){
            Function f = entry.getValue();
            optimizeFunction(f);
        }
    }
    
    private void optimizeFunction(Function f){
        ArrayList<Instruction> instructions = f.getInstructions();
        for (int i = 0; i< instructions.size(); i++){
            Instruction instr  = instructions.get(i);
            
            // ESTO ES IMPOSIBLE QUE OCURRA A NO SER QUE HAGA ASIGNACION DIFERIDA!!
            if (isConstantComputable(instr)){
                System.err.println("Found posible constant instruction: "+instr.toString());
            }
            
            try {
                bw.write(instr.toString());
            } catch (IOException ex) {
                Logger.getLogger(Optimizer.class.getName()).log(Level.SEVERE, null, ex);
            }
        } 
    }
    
    private boolean isSrcConstant(Object src) {
        return src!= null && 
               (src instanceof Integer ||
                src instanceof Boolean ||
                src instanceof String);
    }
    
    private boolean isConstantComputable(Instruction instr){
        return constantOpcodes.contains(instr.getOp()) &&
               isSrcConstant(instr.getSrc1()) && 
               isSrcConstant(instr.getSrc2());
    }
}
