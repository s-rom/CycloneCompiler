package AST;

import cyclonecompiler.DOT;

public class Arg extends Node{

    private String type;
    private String id;

    public Arg(String type, String id) {
        this.type = type;
        this.id = id;
        toDot();
    }
    
    @Override
    public void toDot() {
        DOT.writeNode(this.nodeNumber, "Arg: "+type+" "+id);
        
//        int idType = DOT.nextNode();
//        int idID = DOT.nextNode();
//        
//        DOT.writeNode(idType, "Type: "+type);
//        DOT.writeNode(idID, "ID: "+id);
        
//        DOT.writeEdge(nodeNumber, idType);
//        DOT.writeEdge(nodeNumber, idID);
    }
    
}
