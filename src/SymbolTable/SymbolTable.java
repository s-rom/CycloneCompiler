package SymbolTable;

import cyclonecompiler.FatalError;
import cyclonecompiler.InfoDump;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;

public class SymbolTable {
    
    private int level;
    private final Scope ROOT; // Scope at level 0
    private Scope current; // inner-most scope
    private Scope last; 
    
    public SymbolTable(){
        level = 0;
        current = new Scope(null, level);
        ROOT = current;
        last = current;
    }
    
    public void enterBlock(){
        last = current;
        level++;
        current = new Scope(last, level);
        last.insertForwardChild(current);
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
    
    public Description getForward(String id){
        Scope s;
        Queue<Scope> children = new LinkedList<>(new ArrayList<>(ROOT.forwardList));
        
        while (!children.isEmpty()){
            s = children.poll();
            
            // If found in current scope, return it
            Description d = s.get(id);
            if (d != null) return d;
            
            for (Scope child : s.forwardList){
                children.add(child);
            }
        }
        
        return null;
    }    
    
    
    @Override
    public String toString(){
        String res = ROOT.toString() + "\n";
        Scope s;
        Queue<Scope> children = new LinkedList<>(new ArrayList<>(ROOT.forwardList));
        
        while (!children.isEmpty()){
            s = children.poll();
            res += s.toString() + "\n";
            for (Scope child : s.forwardList){
                children.add(child);
            }
        }
        
        return res;
    }
    
}
