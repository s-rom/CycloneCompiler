package AssemblyGeneration;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;


public abstract class AsmGenerator {
    
    protected BufferedWriter fileWriter;
    
    protected AsmGenerator(String filePath) {
        try {
            fileWriter = new BufferedWriter(new FileWriter(filePath));
        } catch (IOException ex) {
            Logger.getLogger(AsmGenerator.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void close(){
        try {
            fileWriter.close();
        } catch (IOException ex) {
            Logger.getLogger(AsmGenerator.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    protected void writeAsm(String asm){
        try {
            fileWriter.write(asm);
        } catch (IOException ex) {
            Logger.getLogger(M68kGenerator.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public void generateFunction(IntermediateCode.Function f){
        f.getInstructions().forEach((instr) -> {
            generateAsmEquivalent(instr);
        });
    }
    
    public abstract void generateMain();
    protected abstract void generateAsmEquivalent(IntermediateCode.Instruction instr);
}

