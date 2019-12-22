package AST;

import cyclonecompiler.DOT;

public class FunctionList extends Node{
    
    private FunctionList fl;
    private Function f;
    
    public FunctionList(Function f, FunctionList fl){
        this.f = f;
        this.fl = fl;
    }

    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "FunctionList");
        if (fl != null) DOT.writeEdge(nodeNumber, fl.getNodeNumber());
        if (f != null) DOT.writeEdge(nodeNumber, f.getNodeNumber());
    }
    
}
