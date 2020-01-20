package SymbolTable;

import cyclonecompiler.FatalError;
import cyclonecompiler.InfoDump;

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
        String spaces = getNSpaces(level*5);
        InfoDump.addTableSymbolText(spaces+"------------------------\n");
        InfoDump.addTableSymbolText(spaces+"| LEVEL "+level+"\n");
    }
    
    private String getNSpaces(int n){
        String res ="";
        for(int i = 0;i<n; i++) res+= ' ';
        return res;
    }
    
    public void exitBlock(){
        
        // level 0 cannot be erased
        if (level > 0){
            current = last;
            last = current.previous;
            level--;
            InfoDump.addTableSymbolText(getNSpaces((level+1)*5)+"------------------------\n");
        }
    }
    
    public int getCurrentLevel(){
        return this.level;
    }
    
    public boolean insert(String id, Description d) throws FatalError{
        return current.insert(id, d);
    }
    
    public Description get(String id){
        return current.get(id);
    }
    
        
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
