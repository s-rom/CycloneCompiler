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

    public Arg getA() {
        return a;
    }

    public Args getNextArgs() {
        return as;
    }
    
    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "{Args | {<a>Arg | <as> Args}}","record");
        if (a != null) DOT.writeEdge(nodeNumber,"a", a.getNodeNumber());
        if (as != null) DOT.writeEdge(nodeNumber,"as", as.getNodeNumber());
    }

    @Override
    public void semanticCheck() {
    }

    @Override
    public void generateIntermediateCode() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
