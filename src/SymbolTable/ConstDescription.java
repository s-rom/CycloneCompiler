package SymbolTable;

public class ConstDescription extends Description{
    
    
    private final Object value;
    public final String type;
    
    public ConstDescription(String name, String type, Object value) {
        super(name, DescriptionType.D_CONST);
        this.value = value;
        this.type = type;
    }
    
    public ConstDescription(String name, String type) {
        super(name, DescriptionType.D_CONST);
        this.value = null;
        this.type = type;
    }
 
    
    @Override
    public String toString(){
        return "const "+this.type+" "+((value!=null)?value:"");
    }
    
}
