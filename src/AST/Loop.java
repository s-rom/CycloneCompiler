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

    @Override
    public void generateIntermediateCode() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
        
}
