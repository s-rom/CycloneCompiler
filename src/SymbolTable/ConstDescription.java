package SymbolTable;

public class ConstDescription extends Description{
    
    private Object value;
    public final String type;
    
    private int constNum = 0;
   
    private int nextConst(){
        return VarDescription.nextVarNumber();
    }
    
    public ConstDescription(String name, String type, Object value) {
        super(name, DescriptionType.D_CONST);
        this.value = value;
        this.type = type;
        this.constNum = nextConst();
    }
    
    public ConstDescription(String name, String type) {
        super(name, DescriptionType.D_CONST);
        this.value = null;
        this.type = type;
        this.constNum = nextConst();
    }
 
    public void setValue(Object value){
        this.value = value;
    }
    
    public Object getValue(){
        return value;
    }
    
    public int getConstNum(){
        return constNum;
    }
    
    @Override
    public String toString(){
        return "const <"+constNum+"> "+this.type+" "+((value!=null)?value:"");
    }
    
}
