/*
    Basado en la implementación de
        Dragon Book - Compilers Principles Techniques and Tools (2nd Edition)
        Pearson Education - 2006
*/
package SymbolTable;

import cyclonecompiler.FatalError;
import cyclonecompiler.InfoDump;
import java.util.Hashtable;
import java.util.Set;

public class Scope {
    
    private Hashtable<String, Description> t;
    public Scope previous;
    private int level;
    
    public Scope(Scope previous, int level){
        this.t = new Hashtable();
        this.previous = previous;
        this.level = level;
    }
    
    /**
     * Attempts to insert a new entry into the SymbolTable.
     * @param id
     * @param d 
     * @return false if the id is already declared in the current scope, true
     * otherwise
     * @throws cyclonecompiler.FatalError
     */
    public boolean insert(String id, Description d) throws FatalError{
        if (t.containsKey(id)){ // id already exists in this scope
            InfoDump.reportSemanticError("id \""+id+"\" already exists in the current scope");
            return false;
        } else {
            t.put(id, d);
            InfoDump.addTableSymbolEntry(id+" | ",d);
            return true;
        }
    }
    
    /**
     * Retrieves an entry from the SymbolTable.
     * It can be retrieved from the current scope or from any upper one.
     * @param id
     * @return Description corresponding to id, null if its not declared
     */
    public Description get(String id){
        Scope s = this;
        while (s != null){
            if (s.t.containsKey(id)){
                return s.t.get(id);
            } else {
                s = s.previous;
            }
        }
        
        return null;
    }
    
    
    
    @Override
    public String toString(){
        String spc = getNSpaces(level);
        String res = "LEVEL: "+level+"\n";
        Set<String> keys = t.keySet();
        for(String key: keys){
            res += spc+key+"("+t.get(key).dtype+") "+t.get(key)+"\n";
        }    
        return res;
    }
    
    public String getNSpaces(int n){
        String res ="";
        for (int i = 0; i<n; i++) res+=" ";
        return res;
    }
    
}
