package AST;

import SymbolTable.AtomicType;
import cyclonecompiler.DOT;
import cyclonecompiler.Main;

public class UnExpr extends Node{

    private String unOp;
    private UnExpr unExpr;
    private Primary p;
    private AtomicType type;
    
    public UnExpr(String unOp, UnExpr unExpr, Primary p) {
        this.unOp= unOp;
        this.unExpr =unExpr;
        this.p = p;
        this.type = Main.atomicNull;

        semanticCheck();
        toDot();
    }

    public AtomicType getAtomicType(){
        return type;
    }
    
    public void setAtomicType(AtomicType type) {
        this.type = type;
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
        
        // Producción: UnExpr --> Primary
        if (this.unOp == null){
            // heredar tipo de primary
            this.type = this.p.getType();
        } else { //Producción: UnExpr --> UnOp UnExpr
            //hacer comprobacion de operadores unarios
        }
    }

    
}
