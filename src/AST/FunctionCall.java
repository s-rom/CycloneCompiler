package AST;

import cyclonecompiler.DOT;

public class FunctionCall extends Node {
    
    private String id;
    private ExprArg param;
    
    public FunctionCall(String id, ExprArg param){
        this.id = id;
        this.param = param;
        toDot();
    }

    @Override
    public void toDot(){
        
        DOT.writeNode(nodeNumber, "{FunctionCall | { ID: "+id+" | <e>ExprArg}}","record");
//        DOT.writeNode(nodeNumber, "FunctionCall: "+id);
        if (param != null) DOT.writeEdge(nodeNumber,"e", param.getNodeNumber());
        
    }

    @Override
    public void semanticCheck() {

    }

}
