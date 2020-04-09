package AST;

import SymbolTable.AtomicType;
import cyclonecompiler.DOT;
import cyclonecompiler.FatalError;
import cyclonecompiler.InfoDump;

public class IfCondition extends Node{
    
    /*  
        if (e) 
        { 
            b1 
        }
        else 
        {
            b2
        }
    
    */
    
    private Expr e;
    private Block b1;
    private Block b2;

    public IfCondition(Expr e, Block b1, Block b2) throws FatalError {
        this.e = e;
        this.b1 = b1;
        this.b2 = b2;
        semanticCheck();
        toDot();
    }
    
    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "{IfCondition | {<e>Expr | <b1>BlockIf | <b2>BlockElse}}",
                "record");
        if (e != null)  DOT.writeEdge(nodeNumber, "e",e.getNodeNumber());
        if (b1 != null) DOT.writeEdge(nodeNumber, "b1",b1.getNodeNumber());
        if (b2 != null) DOT.writeEdge(nodeNumber, "b2",b2.getNodeNumber());
    }

    @Override
    public void semanticCheck() throws FatalError {
           if (this.e == null){
            InfoDump.reportSemanticError("If conditional without expression, in "+this.e.ue.p.getLocationInfo());
        }
        
        if (this.e.getAtomicType().getDType() != AtomicType.Atomic.TS_BOOL){
            InfoDump.reportSemanticError("If conditional expression must be bool, in "+this.e.ue.p.getLocationInfo());
        }
    }

    @Override
    public void generateIntermediateCode() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
