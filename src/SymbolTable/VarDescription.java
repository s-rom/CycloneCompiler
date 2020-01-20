package SymbolTable;

public class VarDescription extends Description{
    
    /* Para numeración única de las variables */
    private static int varCounter = -1;
    public static int nextVarNumber(){
        return ++varCounter;
    }
    
    private final int varNumber;
    public final String type;
    
    public VarDescription(String name, String type){
        super(name,DescriptionType.D_VAR);
        this.varNumber = nextVarNumber();
        this.type = type;
    }
    
    @Override
    public String toString(){
        return "var <"+varNumber+"> "+type;
    }
    
}
