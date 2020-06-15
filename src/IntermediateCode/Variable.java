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
    private VarSemantics varSemantics;
    private VarType type;
    private String originalID = null;
    
   
    /**
     * Cada variable de código intermedio és único con este constructor.
     * @param varSemantics
     * @param type
     * @param originalID
     */
    public Variable(VarSemantics varSemantics, VarType type, String originalID){
        this(varSemantics, 4, type, originalID);
    }
    
    
    public Variable(VarSemantics varSemantics, int bytes, VarType type, String originalID){
        id = nextId();
        this.originalID = originalID;
        this.varSemantics = varSemantics;
        parentFunctionID = Main.gen.getCurrentFunction().getID();
        occupation = bytes;
        occupation += bytes % 2 == 1 ? 1 : 0;
        this.type = type;

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
    
    public Variable(int existingId, VarSemantics varSemantics, VarType type, String originalID){
        this(existingId, varSemantics, 4, type, originalID);
    }
    
    public Variable(int existingId, VarSemantics varSemantics, int bytes, VarType type, String originalID){
        id = existingId;
        this.originalID = originalID;
        this.varSemantics = varSemantics;
        parentFunctionID = Main.gen.getCurrentFunction().getID();
        occupation = bytes;
        occupation += bytes % 2 == 1 ? 1 : 0;
        this.type = type;
        
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
    
    public void setOriginalID(String id){
        this.originalID = id;
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

    public VarType getType() {
        return type;
    }
       
    private final static String SEMANTICS_EQUIVALENT [] 
            = {"local", "param"};
    
    public String toStringDetailed(){
        String res = "t"+id+"\t| type: "+SEMANTICS_EQUIVALENT[this.varSemantics.ordinal()]+
                " | off: "+offset+" | bytes: "+occupation;
        res+= " | local to: "+parentFunctionID + " | "+type.name().toLowerCase();
        if (originalID != null) res += " | original: "+originalID;
        return res;
    }
    
    public static boolean equals(Variable v1, Variable v2){
        return v1.id == v2.id;
    }
    
    
}
