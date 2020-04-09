package AST;

import cyclonecompiler.DOT;

public class Block extends Node{
    
    private StatementList sl;

    public Block(StatementList sl) {
        this.sl = sl;
        toDot();
    }

    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "Block");
        if (sl != null) DOT.writeEdge(nodeNumber, sl.getNodeNumber());
    }

    @Override
    public void semanticCheck() {

    }

    @Override
    public void generateIntermediateCode() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
        
}
