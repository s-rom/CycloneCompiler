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
    
   
    private FuncDescription currentFunc;

    public FuncDescription getCurrentFunc() {
        return currentFunc;
    }

    public void setCurrentFunc(FuncDescription newFunc) {
        this.currentFunc = newFunc;
    }
    
    private Scope lastLevel1Scope;     
    
    public SymbolTable(){
        level = 0;
        current = new Scope(null, level);
        ROOT = current;
        last = current;
        lastLevel1Scope = null;
        currentFunc = null;
    }
    
    public void enterBlock(){
        last = current;
        level++;
        current = new Scope(last, level);
        last.insertForwardChild(current);
        
        if (level == 1) lastLevel1Scope = current;
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
        return getForwardStartingFrom(id, ROOT);
    }    
    
    public Description getForwardStartingFrom(String id, Scope start){
        Description firstDesc = start.get(id);
        if (firstDesc != null) return firstDesc; 
        
        Scope s;
        Queue<Scope> childrenQueue = new LinkedList<>(new ArrayList<>(start.forwardList));
        
        while (!childrenQueue.isEmpty()){
            s = childrenQueue.poll();
            
            // If found in current scope, return it
            Description d = s.get(id);
            if (d != null) return d;
            
            for (Scope child : s.forwardList){
                childrenQueue.add(child);
            }
        }
        
        return null;
    }    
    
    
    public Scope getCurrentScope(){
        return this.current;
    }
    
    public Scope getLastLevel1Scope(){
        return this.lastLevel1Scope;
    }
    
    public int getLastScope(){
        return this.level;
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
