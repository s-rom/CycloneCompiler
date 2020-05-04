package IntermediateCode;

import SymbolTable.VarDescription;
import SymbolTable.VarDescription.VarSemantics;
import cyclonecompiler.Main;
import java.awt.Point;
import java.awt.geom.Point2D;
import java.util.ArrayList;

public class Function {

    private int id;
    private String name;
    private Tag initTag;
    
    
    private int nextParamOffset;
    private int nextLocalVarOffset;
    
    private ArrayList<Instruction> instructions;
    
    private boolean hasReturnValue;
    
    public Function(int id, String name, Tag initTag) {
        instructions = new ArrayList();
        this.id = id;
        this.name = name;
        this.initTag = initTag;
    
        nextParamOffset = 0;
        nextLocalVarOffset = 0;
    }
    
    public Tag getTag(){
        return this.initTag;
    }
    
    public int getNexVarOffset(int bytes){
        nextLocalVarOffset -= bytes;
        return nextLocalVarOffset;
    }
    
    public int getNextParamOffset(int bytes){
        nextParamOffset += bytes;
        return nextParamOffset;
    }
    
    public Point getLocalOccupation() {
        int localBytes = 0;
        int paramBytes = 0;
        for (Variable v : Main.gen.getFunctionVariables(this.id)){
            if (v.getVarSemantics() == VarSemantics.LOCAL){
                localBytes += 4;
            } else {
                paramBytes += 4;
            }
        }
        return new Point(localBytes, paramBytes);
    }
    
    public int getID(){
        return this.id;
    }
    
    public void addInstruction(Instruction instr){
        this.instructions.add(instr);
    }
    
    public boolean isHasReturnValue() {
        return hasReturnValue;
    }

    public void setHasReturnValue(boolean hasReturnValue) {
        this.hasReturnValue = hasReturnValue;
    }
    
    public void printInstructions(){
        for (Instruction instr: instructions){
            System.out.println(instr.toString()+"\n");
        }
    }
    
    public ArrayList<Instruction> getInstructions(){
        return this.instructions;
    }
    
    @Override
    public String toString(){
        return initTag+"("+name+")";
    }
    
    public String toStringDetailed(){
        Point occup = getLocalOccupation();
        return "f"+id+" | "+name+" | tag: "+initTag.toString()+
                " | local bytes: "+(int)occup.getX()+" | parameter bytes: "+(int)occup.getY();
    }
}
