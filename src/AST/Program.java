package AST;

import cyclonecompiler.DOT;

public class Program extends Node{
    private FunctionList fl;
    
    public Program(FunctionList fl){
        this.fl = fl;
        toDot();
    }

    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "Program");
        if (fl!=null) DOT.writeEdge(nodeNumber,fl.getNodeNumber());
    }

    @Override
    public void semanticCheck() {

    }
    
    
}
