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
    private Block ifBlock;
    private Block elseBlock;

    public IfCondition(Expr e, Block b1, Block b2) throws FatalError {
        this.e = e;
        this.ifBlock = b1;
        this.elseBlock = b2;
        semanticCheck();
        toDot();
    }
    
    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "{IfCondition | {<e>Expr | <b1>BlockIf | <b2>BlockElse}}",
                "record");
        if (e != null)  DOT.writeEdge(nodeNumber, "e",e.getNodeNumber());
        if (ifBlock != null) DOT.writeEdge(nodeNumber, "b1",ifBlock.getNodeNumber());
        if (elseBlock != null) DOT.writeEdge(nodeNumber, "b2",elseBlock.getNodeNumber());
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
        
        

    }
    
}
