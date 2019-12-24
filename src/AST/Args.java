package AST;

import cyclonecompiler.DOT;

public class Args extends Node{

    private Arg a;
    private Args as;
    
    public Args(Arg a, Args as){
        this.a = a;
        this.as = as;
        toDot();
    }
    
    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "{Args | {<a>Arg | <as> Args}}","record");
        if (a != null) DOT.writeEdge(nodeNumber,"a", a.getNodeNumber());
        if (as != null) DOT.writeEdge(nodeNumber,"as", as.getNodeNumber());
    }
    
}
