package SymbolTable;

public class TypeDescription extends Description{

    private AtomicType tsb;
    
    
    public TypeDescription(String typeName, AtomicType tsb){
        super(typeName,DescriptionType.D_TYPE);
        this.tsb = tsb;
    }
    
    
    public AtomicType getAtomicType(){
        return this.tsb;
    }
    
    @Override
    public String toString(){
        return tsb.toString();
    }
    
}
