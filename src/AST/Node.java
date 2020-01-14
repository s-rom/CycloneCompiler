package AST;

import cyclonecompiler.DOT;
import cyclonecompiler.FatalError;

public abstract class Node {
    protected int nodeNumber;
    public abstract void toDot();
    public abstract void semanticCheck() throws FatalError;
    
    public Node(){
        this.nodeNumber = DOT.nextNode();
    }
    public int getNodeNumber(){return nodeNumber;}
}
