package AST;

import cyclonecompiler.DOT;

public class Declaration extends Node{

    
    private String type;
    private String id;
    private Assignation assign;
    
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
