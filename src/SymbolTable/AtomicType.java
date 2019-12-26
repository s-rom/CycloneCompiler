package SymbolTable;

public class AtomicType {
    
    public static enum Atomic{ 
        TS_BOOL, TS_CHAR, TS_INT, TS_NULL
    }
    
    private Atomic tsb;
    private int supLimit;
    private int infLimit;
    private int occupation; //bytes
    
    public AtomicType(Atomic tsb, int supLimit, int infLimit, int occupation){
        this.tsb = tsb;
        this.supLimit = supLimit;
        this.infLimit = infLimit;
        this.occupation = occupation;
    }
    
    public boolean equals(Object o){
        AtomicType t = (AtomicType) o;
        return t.tsb == this.tsb;
    }
    
    public Atomic getDType(){
        return tsb;
    } 
    
    
    @Override
    public String toString(){
        return tsb + " ["+infLimit+","+supLimit+"] "+occupation+
                (occupation > 1? "bytes" : "byte");
    }
}
