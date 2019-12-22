package AST;

import cyclonecompiler.DOT;

public class Args extends Node{

    /* PLACEHOLDER */
    
    @Override
    public void toDot() {
        DOT.writeNode(this.nodeNumber, "Args");
    }
    
}
