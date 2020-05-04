package AST;

import IntermediateCode.Opcode;
import SymbolTable.AtomicType;
import SymbolTable.AtomicType.Atomic;
import SymbolTable.VarDescription;
import SymbolTable.VarDescription.VarSemantics;
import cyclonecompiler.DOT;
import cyclonecompiler.FatalError;
import cyclonecompiler.InfoDump;
import cyclonecompiler.Main;

public class UnExpr extends Node{

    private String unOp;
    private UnExpr unExpr;
    public Primary p;
    private AtomicType type;
    
    public UnExpr(String unOp, UnExpr unExpr, Primary p) throws FatalError {
        this.unOp= unOp;
        this.unExpr =unExpr;
        this.p = p;
        this.type = Main.atomicNull;
        
        semanticCheck();
        toDot();
    }

    public AtomicType getAtomicType(){
        return type;
    }
    
    public void setAtomicType(AtomicType type) {
        this.type = type;
    }
    
    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "UnExpr");
        if (unOp != null) {
            int unOpId = DOT.nextNode();
            DOT.writeNode(unOpId, unOp);
            DOT.writeEdge(nodeNumber, unOpId);
        }
        
        if (unExpr != null) DOT.writeEdge(nodeNumber, unExpr.getNodeNumber());
        if (p != null) DOT.writeEdge(nodeNumber, p.getNodeNumber());
    }

    @Override
    public void semanticCheck() throws FatalError {
        
        // Producción: UnExpr --> Primary
        if (this.p != null && this.unExpr==null && this.unOp == null){
            
            // heredar tipo de primary
            this.type = this.p.getType();
            
        } else if (this.unOp!= null && this.unExpr !=null){ //Producción: UnExpr --> UnOp UnExpr
            switch(this.unOp){
                case "-":
                    subCheck();
                    break;
                case "!":
                    notCheck();
                    break;
            }
        }
    }
    
    private void subCheck() throws FatalError{
        if (this.unExpr == null){
            InfoDump.reportSemanticError("Unary expression of binary operator is missing, in "+
                    this.unExpr.p.getLocationInfo());
        }
        
        if (this.unExpr.type.getDType() != Atomic.TS_INT){
            InfoDump.reportSemanticError("Unary sub operand "
                    + "("+ unExpr.type.getDType()+") must be integer in "+
                    this.unExpr.p.getLocationInfo());
        }
        
        this.type = Main.atomicInt;
    }
    
    private void notCheck() throws FatalError{
        
        if (this.unExpr == null){
            InfoDump.reportSemanticError("Unary expression of binary operator is missing, in "+
                    this.unExpr.p.getLocationInfo());
            return;
        }
        
        if (this.unExpr.type.getDType() != Atomic.TS_BOOL){
            InfoDump.reportSemanticError("Unary sub operand ("+ 
                    unExpr.type.getDType()+") must be bool in "+
                    this.unExpr.p.getLocationInfo());
        }
        
        this.type = Main.atomicBool;
    }

    @Override
    public void generateIntermediateCode() {
        if (this.p != null && this.unExpr==null && this.unOp == null){
            // UnExpr --> Primary
            System.out.println("UnaryExpression genera Primary");
            p.generateIntermediateCode();
            this.intermediateVar = p.intermediateVar;
        } else {
            // UnExpr --> UnOP UnExpr
            System.out.println("UnaryExpression genera UnaryExpression");
            this.unExpr.generateIntermediateCode();
            this.intermediateVar = new IntermediateCode.Variable(VarSemantics.LOCAL);
            if ("-".equals(unOp)){
                Main.gen.generateBinary(Opcode.SUB, 0, unExpr.intermediateVar, intermediateVar);
            } else { // !
                Main.gen.generateUnary(Opcode.NOT, unExpr.intermediateVar, intermediateVar);
            }
        }
    }

    
}
