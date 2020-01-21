package AST;

import cyclonecompiler.DOT;

public class ExprArg extends Node{

    private Expr e;
    private ExprList el;
    
    public ExprArg(Expr e, ExprList el){
        this.e = e;
        this.el = el;
        toDot();
    }
    
    public Expr getExpr(){
        return e;
    }
    
    public ExprList getExprList(){
        return el;
    }
    
    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "{ExprArg | {<e>Expr | <el>ExprList}}","record");
        if (e != null) DOT.writeEdge(nodeNumber,"e", e.getNodeNumber());
        if (el != null) DOT.writeEdge(nodeNumber,"el", el.getNodeNumber());
    }

    @Override
    public void semanticCheck() {
        
    }
    
}
