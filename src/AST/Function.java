package AST;

import cyclonecompiler.DOT;


public class Function extends Node{
    
    private String type;
    private String id;
    private Args args;
    private Block b;
    
    
    public Function(String type, String id, Args args, Block b){
        this.type = type;
        this.id = id;
        this.args = args;
        this.b = b;
    }

    
    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "Function");
      
        int idType = DOT.nextNode();
        int idID = DOT.nextNode();

        DOT.writeNode(idType, "Type: "+type);
        DOT.writeNode(idID, "ID: "+id);
        
        DOT.writeEdge(nodeNumber, idType);
        DOT.writeEdge(nodeNumber, idID);

        if (args != null) DOT.writeEdge(nodeNumber, args.getNodeNumber());
        if (b != null) DOT.writeEdge(nodeNumber, b.getNodeNumber());

    }
}
