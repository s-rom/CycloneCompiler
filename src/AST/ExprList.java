package AST;

import cyclonecompiler.DOT;


public class ExprList extends Node{

    
    private Expr e;
    private ExprList el;
    
    public ExprList(Expr e, ExprList el){
        this.e = e;
        this.el = el;
        toDot();
    }

    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "{ExprList |{<e>Expr | <el>ExprList}}","record");
        if (e!= null) DOT.writeEdge(nodeNumber,"e", e.getNodeNumber());
        if (el != null) DOT.writeEdge(nodeNumber,"el", el.getNodeNumber());
    }

    @Override
    public void semanticCheck() {

    }
    
}