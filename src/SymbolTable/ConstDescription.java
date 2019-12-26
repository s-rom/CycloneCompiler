package SymbolTable;

public class ConstDescription extends Description{
    
    
    private Object value;
    
    public ConstDescription(String name, String type, Object value) {
        super(name, DescriptionType.D_CONST);
        this.value = value;
    }
 
    
    @Override
    public String toString(){
        return this.dtype+" "+this.value.toString();
    }
    
}
