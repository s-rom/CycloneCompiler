package IntermediateCode;

import SymbolTable.AtomicType;
import SymbolTable.VarDescription;
import SymbolTable.VarDescription.VarSemantics;
import cyclonecompiler.Main;

public class Variable {
    
    /**
     * Esto está así para respetar los id de las variables del 
     * código fuente sin que se añada a la tabla de símbolos.
     * @return 
     */
    public static int nextId(){
        return VarDescription.nextVarNumber();
    }
   
    private int id;
    private int parentFunctionID;
    private int occupation; // bytes
    private final int offset; // bytes
    private AtomicType atomicType;
    private VarSemantics varSemantics;
    
    /**
     * Cada variable de código intermedio és único con este constructor.
     * @param varSemantics
     */
    public Variable(VarSemantics varSemantics){
        id = nextId();
        this.varSemantics = varSemantics;
        parentFunctionID = Main.gen.getCurrentFunction().getID();
        occupation = 4;
        switch(varSemantics){
            case LOCAL: 
                offset = Main.gen.getCurrentFunction().getNexVarOffset(occupation);
                break;
            case INPARAM: 
                offset = Main.gen.getCurrentFunction().getNextParamOffset(occupation);
                break;
            default: 
                offset = Integer.MAX_VALUE;
        }
        
                
        Main.gen.addVariable(this);
    }
    
    public Variable(int existingId, VarSemantics varSemantics){
        id = existingId;
        this.varSemantics = varSemantics;
        parentFunctionID = Main.gen.getCurrentFunction().getID();
        occupation = 4;
        
        switch(varSemantics){
            case LOCAL: 
                offset = Main.gen.getCurrentFunction().getNexVarOffset(occupation);
                break;
            case INPARAM: 
                offset = Main.gen.getCurrentFunction().getNextParamOffset(occupation);
                break;
            default: 
                offset = Integer.MAX_VALUE;
        }
        
        Main.gen.addVariable(this);
    }
    
    public void setParentFuncID(int parentId){
        this.parentFunctionID = parentId;
    }
    
    public VarSemantics getVarSemantics(){
        return this.varSemantics;
    }
    
    public int getParentFuncID(){
        return this.parentFunctionID;
    }
    
    public int getId(){
        return this.id;
    }
    
    @Override
    public String toString(){
        return "t"+id; 
    }

    public int getOccupation() {
        return occupation;
    }

    public int getOffset() {
        return offset;
    }
    
    
       
    private final static String SEMANTICS_EQUIVALENT [] 
            = {"local", "param"};
    
    public String toStringDetailed(){
        String res = "t"+id+"\t| type: "+SEMANTICS_EQUIVALENT[this.varSemantics.ordinal()]+
                " | off: "+offset+" | bytes: "+occupation;
        res+= " | local to: "+parentFunctionID;
        if (atomicType != null) res+=" | "+atomicType.getDType();
        return res;
    }
    
    public static boolean equals(Variable v1, Variable v2){
        return v1.id == v2.id;
    }
    
    
}
