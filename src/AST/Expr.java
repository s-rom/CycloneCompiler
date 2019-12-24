package AST;

import cyclonecompiler.DOT;

public class Expr extends Node{
    
    private Expr e;
    private String bo;
    private UnExpr ue;

    public Expr(Expr e, String bo, UnExpr ue) {
        this.e = e;
        this.bo = bo;
        this.ue = ue;
        toDot();
    }

    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "{Expr | {<e>Expr | <bo>BinOp | <ue>UnExpr}}", "record");
        

      
        if (e != null)  DOT.writeEdge(nodeNumber, "e",e.getNodeNumber());
   
        
        if (bo != null)
        {
            int idBinOp = DOT.nextNode();        
            DOT.writeNode(idBinOp,bo);
            DOT.writeEdge(nodeNumber,"bo",idBinOp);
        }
        
        
        if (ue != null) DOT.writeEdge(nodeNumber,"ue", ue.getNodeNumber());

    }
    
}
