package SymbolTable;

public class AtomicType {
    
    public static enum Atomic{ 
        TS_BOOL, TS_CHAR, TS_INT, TS_NULL
    }
    
    private Atomic at;
    private int supLimit;
    private int infLimit;
    private int occupation; //bytes
    
    public AtomicType(Atomic at, int supLimit, int infLimit, int occupation){
        this.at = at;
        this.supLimit = supLimit;
        this.infLimit = infLimit;
        this.occupation = occupation;
    }
    
    @Override
    public boolean equals(Object o){
        AtomicType t = (AtomicType) o;
        return t.at == this.at;
    }
    
    public Atomic getDType(){
        return at;
    } 
    
    
    @Override
    public String toString(){
        return at + " ["+infLimit+","+supLimit+"] "+occupation+
                (occupation > 1? "bytes" : "byte");
    }
}
