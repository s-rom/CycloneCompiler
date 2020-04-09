package AST;

import cyclonecompiler.DOT;
import cyclonecompiler.FatalError;

public abstract class Node {
    
    protected int nodeNumber;
    protected IntermediateCode.Variable intermediateVar;
    
    public abstract void toDot();
    public abstract void semanticCheck() throws FatalError;
    public abstract void generateIntermediateCode();
    
    public Node(){
        this.nodeNumber = DOT.nextNode();
        this.intermediateVar = null;
    }
    public int getNodeNumber(){return nodeNumber;}
}
