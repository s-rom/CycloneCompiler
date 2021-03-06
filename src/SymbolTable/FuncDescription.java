package SymbolTable;

import AST.Arg;
import IntermediateCode.FuncTag;
import cyclonecompiler.FatalError;
import java.util.ArrayList;

public class FuncDescription extends Description{
  
    /* Para numeración única de las variables */
    private static int funcCounter = -1;
    public static int nextFuncNumber(){
        return ++funcCounter;
    }
    
    private int funcNumber;
    private String returnType;
    private ArrayList<Arg> params;
    private Scope functionScope;
    private FuncTag tag;
    
    public FuncDescription(String name, String returnType){
        super(name,DescriptionType.D_FUNC);
        this.returnType = returnType;
        this.funcNumber = nextFuncNumber();
        params = new ArrayList();
    }
    
    public void addParam(String id, String type) throws FatalError{
        params.add(new Arg(id,type));
    }
    
    public int getID(){
        return funcNumber;
    }
    
    public Scope getScope(){
        return this.functionScope;
    }
    
    public void linkScope(Scope s){
        this.functionScope = s;
    }
    
    public void addParam(Arg a){
        params.add(a);
    }
    
    public String getReturnType(){
        return this.returnType;
    }
    
    public FuncTag getTag(){
       return tag;
    }
    
    public void setTag(FuncTag t){
        this.tag = t;
    }
    
    public ArrayList<Arg> getParamList(){
        return this.params;
    }
    
    @Override
    public String toString(){
        String ret = "func <"+funcNumber+"> returns "+returnType+", params(";
        if(params.isEmpty()) return ret + ")";
        for (Arg a: params){
            ret += a.toString()+", ";
        }
        return ret.substring(0,ret.length()-2)+")";
    }
}
