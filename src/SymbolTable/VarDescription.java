package SymbolTable;

public class VarDescription extends Description{
    
    public static enum VarSemantics {
        LOCAL,
        INPARAM
    }
    
    
    private final static String SEMANTICS_EQUIVALENT [] 
            = {"local var", "input param"};
    
    /* Para numeración única de las variables */
    private static int varCounter = -1;
    public static int nextVarNumber(){
        return ++varCounter;
    }
    
    public VarSemantics varSemantics;
    public final int varNumber;
    public final String type;
    private int length;
    
    public VarDescription(String name, String type, VarSemantics varSemantics){
        super(name,DescriptionType.D_VAR);
        this.varNumber = nextVarNumber();
        this.type = type;
        this.varSemantics = varSemantics;
        this.length = 1;
    }
    
     public VarDescription(String name, String type, VarSemantics varSemantics, int length){
        super(name,DescriptionType.D_VAR);
        this.varNumber = nextVarNumber();
        this.type = type;
        this.varSemantics = varSemantics;
        this.length = length;
    }

    public VarSemantics getVarSemantics() {
        return varSemantics;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }
    
    @Override
    public String toString(){
        return SEMANTICS_EQUIVALENT[varSemantics.ordinal()]+" <"+varNumber+"> "+type
                + (length != 1? "["+length+"]":"");
    }
    
}
