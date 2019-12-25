package AST;

import cyclonecompiler.DOT;

public class Declaration extends Node{

    private Assignation assign;
    private String type;
    private String id;
    
    
    public Declaration(String type, String id){
        this.type = type;
        this.id = id;
        toDot();
    }
    
    public Declaration(String type, String id, Assignation assign){
        this.type = type;
        this.id = id;
        this.assign = assign;
        toDot();
    }
    
    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "Declaration: "+type+" "+id);
        if (assign != null) DOT.writeEdge(nodeNumber, assign.getNodeNumber());
    }
    
}
