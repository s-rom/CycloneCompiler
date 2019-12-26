package AST;

import cyclonecompiler.DOT;

public abstract class Node {
    protected int nodeNumber;
    public abstract void toDot();
    public abstract void semanticCheck();
    
    public Node(){
        this.nodeNumber = DOT.nextNode();
    }
    public int getNodeNumber(){return nodeNumber;}
}
