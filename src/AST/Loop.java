package AST;

import cyclonecompiler.DOT;

public class Loop extends Node{
    
    private WhileLoop wl;

    public Loop(WhileLoop wl) {
        this.wl = wl;
        toDot();
    }

    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "Loop");
        if (wl != null) DOT.writeEdge(nodeNumber, wl.getNodeNumber());
    }

    @Override
    public void semanticCheck() {

    }
        
}
