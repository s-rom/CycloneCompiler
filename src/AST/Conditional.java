package AST;

import cyclonecompiler.DOT;

public class Conditional extends Node{
    
    private IfCondition ic;

    public Conditional(IfCondition ic) {
        this.ic = ic;
        toDot();
    }

    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "Conditional");
        if (ic != null) DOT.writeEdge(nodeNumber, ic.getNodeNumber());
    }

    @Override
    public void semanticCheck() {

    }
        
}
