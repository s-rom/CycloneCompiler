package AST;

import cyclonecompiler.DOT;

public class Assignation extends Node{

    private String type;
    private String id;
    private Expr e;
    
    
    public Assignation(String type, String id, Expr e){
        this.e = e;
        this.id = id;
        this.type = type;
        toDot();
    }
    
    public Assignation(String id, Expr e){
        this.type = null;
        this.e = e;
        this.id = id;
        toDot();
    }
    
    @Override
    public void toDot() {
        String label = "";
        if (e == null){
            label = "Declaration: "+type+" "+id;
        } else {
            if (type == null){
                label = "Assignation: "+id+" = ";
            } else {
                label = "Declaration: "+type+" "+id+" = ";
            }
        }
        DOT.writeNode(nodeNumber, label);
        if (e != null) DOT.writeEdge(nodeNumber, e.getNodeNumber());
    }
    
    
    
}
