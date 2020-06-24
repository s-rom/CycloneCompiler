package IntermediateCode;

import SymbolTable.VarDescription.VarSemantics;
import cyclonecompiler.Main;
import java.awt.Point;
import java.util.ArrayList;

public class Function {
    
    private int id;
    private String name;
    private FuncTag initTag;
    
    
    private int nextParamOffset;
    private int nextLocalVarOffset;
    
    private int localBytes = 0, paramBytes = 0;
    private boolean isUserDefined;
    private String subroutine = null;
   
    private ArrayList<Instruction> instructions;
    
    private boolean hasReturnValue;
    
    public Function(int id, String name, FuncTag initTag) {
        instructions = new ArrayList();
        this.id = id;
        this.name = name;
        this.initTag = initTag;
    
        nextParamOffset = 4;
        nextLocalVarOffset = 0;
        isUserDefined = true;
    }

    public String getSubroutine() {
        return subroutine;
    }

    public void setSubroutine(String subroutine) {
        this.subroutine = subroutine;
    }

    public boolean isUserDefined() {
        return isUserDefined;
    }

    public void setIsUserDefined(boolean isUserDefined) {
        this.isUserDefined = isUserDefined;
    }
    
    public FuncTag getTag(){
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
    
    public void setOccupationInternalAPI(int local, int param){
        this.localBytes = local;
        this.paramBytes = param;
        this.isUserDefined = false;
    }
    
    public Point getLocalOccupationInternalAPI(){
        return new Point(localBytes, paramBytes);
    }
    
    
    public Point computeLocalOccupation() {
        if (!isUserDefined) return getLocalOccupationInternalAPI();
        
        localBytes = 0;
        paramBytes = 0;
        for (Variable v : Main.gen.getFunctionVariables(this.id)){
            if (v.getVarSemantics() == VarSemantics.LOCAL){
                localBytes += v.getOccupation();
            } else {
                paramBytes += v.getOccupation();
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
        Point occup = computeLocalOccupation();
        return "f"+id+" | "+name+
                " | local bytes: "+(int)occup.getX()+" | parameter bytes: "+(int)occup.getY();
    }
}
