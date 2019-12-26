package SymbolTable;

public class TypeDescription extends Description{

    private AtomicType at;
    
    public TypeDescription(String typeName, AtomicType at){
        super(typeName,DescriptionType.D_TYPE);
        this.at = at;
    }
    
    
    public AtomicType getAtomicType(){
        return this.at;
    }
    
    @Override
    public String toString(){
        return at.toString();
    }
    
}
