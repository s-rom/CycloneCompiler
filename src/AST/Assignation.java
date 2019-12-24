package AST;

import cyclonecompiler.DOT;

public class Assignation extends Node{

    private Expr e;
    
    public Assignation(Expr e){
        this.e = e;
        toDot();
    }
    
    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "=");
        if (e != null) DOT.writeEdge(nodeNumber, e.getNodeNumber());
    }
    
    
    
}
