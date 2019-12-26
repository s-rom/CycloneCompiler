package AST;

import cyclonecompiler.DOT;

public class WhileLoop extends Node{
    
    private Expr e;
    private Block b;
    
    public WhileLoop(Expr e, Block b) {
        this.e = e;
        this.b = b;
        toDot();
    }

    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "{WhileLoop | {<e>Expr | <b>Block}}","record");
        if (e != null) DOT.writeEdge(nodeNumber, "e", e.getNodeNumber());
        if (b != null) DOT.writeEdge(nodeNumber, "b", b.getNodeNumber());
    }

    @Override
    public void semanticCheck() {

    }
    
}
