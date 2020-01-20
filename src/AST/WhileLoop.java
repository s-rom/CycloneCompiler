package AST;

import SymbolTable.AtomicType;
import SymbolTable.AtomicType.Atomic;
import cyclonecompiler.DOT;
import cyclonecompiler.FatalError;
import cyclonecompiler.InfoDump;

public class WhileLoop extends Node{
    
    private Expr e;
    private Block b;
    
    public WhileLoop(Expr e, Block b) throws FatalError {
        this.e = e;
        this.b = b;
        semanticCheck();
        toDot();
    }

    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "{WhileLoop | {<e>Expr | <b>Block}}","record");
        if (e != null) DOT.writeEdge(nodeNumber, "e", e.getNodeNumber());
        if (b != null) DOT.writeEdge(nodeNumber, "b", b.getNodeNumber());
    }

    @Override
    public void semanticCheck() throws FatalError {
        if (this.e == null){
            InfoDump.reportSemanticError("While loop without expression, in "+this.e.ue.p.getLocationInfo());
        }
        
        if (this.e.getAtomicType().getDType() != Atomic.TS_BOOL){
            InfoDump.reportSemanticError("While loop expression must be bool, in "+this.e.ue.p.getLocationInfo());
        }
    }
    
}
