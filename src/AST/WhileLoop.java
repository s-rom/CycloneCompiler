package AST;

import IntermediateCode.Opcode;
import IntermediateCode.Tag;
import SymbolTable.AtomicType.Atomic;
import cyclonecompiler.DOT;
import cyclonecompiler.FatalError;
import cyclonecompiler.InfoDump;
import cyclonecompiler.Main;

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

    @Override
    public void generateIntermediateCode() {
        Tag eini = new Tag();
        Tag efin = new Tag();
        
        Main.gen.generateSkip(eini, "Loop init");
        this.e.generateIntermediateCode();

        // TODO: Replace with proper value of false
        Main.gen.generateRelational(Opcode.EQ, e.intermediateVar, 0, efin);
        this.b.generateIntermediateCode();
        Main.gen.generateGoto(eini);
        Main.gen.generateSkip(efin,"Loop final");
    }
    
}
