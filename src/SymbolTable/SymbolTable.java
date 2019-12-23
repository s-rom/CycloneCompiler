package SymbolTable;

public class SymbolTable {
    
    private int level;
    private Scope current; // inner-most scope
    private Scope last; 
    
    public SymbolTable(){
        level = 0;
        current = new Scope(null, level);
        last = current;
    }
    
    public void enterBlock(){
        last = current;
        level++;
        current = new Scope(last, level);
    }
    
    public void exitBlock(){
        // level 0 cannot be erased
        if (level > 0){
            current = last;
            last = current.previous;
            level--;
        }
    }
    
    
    public boolean insert(String id, Description d){
        return current.insert(id, d);
    }
    
    public Description get(String id){
        return current.get(id);
    }
    
    
    
    
    /* PARA PRUEBAS */
    @Override
    public String toString(){
        String res = "";
        Scope s = current;
        while (s != null){
            res += s.toString()+"\n";
            s = s.previous;
        }
        return res;
    }
    
}
