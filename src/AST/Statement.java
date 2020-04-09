package AST;

import cyclonecompiler.DOT;

public class Statement extends Node{
    
    private Node node; // loop | conditional | instruction
    
    public Statement(Node node) {
        this.node = node;
        toDot();
    }

    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "Statement");
        if (node != null) DOT.writeEdge(nodeNumber, node.getNodeNumber());
    }

    @Override
    public void semanticCheck() {

    }

    @Override
    public void generateIntermediateCode() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
        
}
