package AST;

import cyclonecompiler.DOT;

public class UnExpr extends Node{

    private String unOp;
    private UnExpr unExpr;
    private Primary p;
    
    public UnExpr(String unOp, UnExpr unExpr, Primary p) {
        this.unOp= unOp;
        this.unExpr =unExpr;
        this.p = p;
        toDot();
    }

    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "UnExpr");
        if (unOp != null) {
            int unOpId = DOT.nextNode();
            DOT.writeNode(unOpId, unOp);
            DOT.writeEdge(nodeNumber, unOpId);
        }
        
        if (unExpr != null) DOT.writeEdge(nodeNumber, unExpr.getNodeNumber());
        if (p != null) DOT.writeEdge(nodeNumber, p.getNodeNumber());
    }

    @Override
    public void semanticCheck() {

    }

    
}
