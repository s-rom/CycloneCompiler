package SymbolTable;

import java.util.ArrayList;

public class FuncDescription extends Description{
    
 
    
    
    /* Para numeración única de las variables */
    private static int funcCounter = -1;
    public static int nextFuncNumber(){
        return ++funcCounter;
    }
    
    private int funcNumber;
    private String returnType;
    private ArrayList<Parameter> params;
    
    public FuncDescription(String name, String returnType){
        super(name,DescriptionType.D_FUNC);
        this.returnType = returnType;
        this.funcNumber = nextFuncNumber();
    }
    
    public void addParam(String id, String type){
        params.add(new Parameter(id,type));
    }
    
    public String getReturnType(){
        return this.returnType;
    }
    
    
    @Override
    public String toString(){
        return "<"+funcNumber+">"+returnType;
    }
}
