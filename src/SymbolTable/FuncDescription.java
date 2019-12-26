package SymbolTable;

public class FuncDescription extends Description{
    
    /* Para numeración única de las variables */
    private static int funcCounter = -1;
    public static int nextFuncNumber(){
        return ++funcCounter;
    }
    
    private int funcNumber;
    private String returnType;
    
    public FuncDescription(String name, String returnType){
        super(name,DescriptionType.D_FUNC);
        this.returnType = returnType;
        this.funcNumber = nextFuncNumber();
    }
    
    
    @Override
    public String toString(){
        return "<"+funcNumber+">"+returnType;
    }
}