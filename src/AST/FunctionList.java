package AST;

import cyclonecompiler.DOT;

public class FunctionList extends Node{
    
    private Function f;
    private FunctionList fl;
    
    public FunctionList(Function f, FunctionList fl){
        this.f = f;
        this.fl = fl;
        toDot();
    }

    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "{FunctionList | {<f> Function | <fl> FunctionList}}",
                "record");
        if (f != null) DOT.writeEdge(nodeNumber, "f", f.getNodeNumber());
        if (fl != null) DOT.writeEdge(nodeNumber, "fl", fl.getNodeNumber());
    }

    @Override
    public void semanticCheck() {

    }

    @Override
    public void generateIntermediateCode() {
        if (f != null) {
            f.generateIntermediateCode();
        }
        if (fl != null) {
            fl.generateIntermediateCode();
        }
    }
    
}
