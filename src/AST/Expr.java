package AST;

import IntermediateCode.Opcode;
import SymbolTable.AtomicType;
import SymbolTable.AtomicType.Atomic;
import cyclonecompiler.DOT;
import cyclonecompiler.FatalError;
import cyclonecompiler.InfoDump;
import cyclonecompiler.Main;

/*
    Expr tiene dos producciones:
        Expr -> UnExpr
        Expr -> Expr BinOp UnExpr

*/
public class Expr extends Node{
    
    private Expr e;
    private String bo; //Operador binario
    public UnExpr ue;
    private AtomicType type; //Tipo de la expresion. Ej: 2+3 (Expr de tipo int)

    public Expr(Expr e, String bo, UnExpr ue)  throws FatalError{
        this.e = e;
        this.bo = bo;
        this.ue = ue;
        semanticCheck();
        toDot();
        generateIntermediateCode();
    }
    
    public void setAtomicType(AtomicType type){
        this.type = type;
    }
    
    public AtomicType getAtomicType(){
        return this.type;
    }
    

    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "{Expr | {<e>Expr | <bo>BinOp | <ue>UnExpr}}", "record");
        

      
        if (e != null)  DOT.writeEdge(nodeNumber, "e",e.getNodeNumber());
   
        
        if (bo != null)
        {
            int idBinOp = DOT.nextNode();        
            DOT.writeNode(idBinOp,bo);
            DOT.writeEdge(nodeNumber,"bo",idBinOp);
        }
        
        
        if (ue != null) DOT.writeEdge(nodeNumber,"ue", ue.getNodeNumber());

    }

    @Override
    public void semanticCheck()  throws FatalError{
        this.type = Main.atomicNull;
        // ** Produccion: Expr -> UnExpr
        if (bo == null){
            this.type = this.ue.getAtomicType();
        }else { // ** Produccion: Expr -> Expr BinOp UnExpr;
            switch(bo){
                case ">":
                case "<":
                case ">=":
                case "<=":
                    comparisonCheck();
                    break;

                case "==":
                case "!=":
                    equalityCheck();
                    break;
                    
                case "+":
                case "-":
                case "*":
                case "/":
                case "%":
                    arithmeticCheck();
                    break;
                    
                case "||":
                case "&&":
                    booleanCheck();
                    break;
            }
        }
    }
    
    
    
    /**
     * Parametros: ambos int
     * Tipo resultante: bool
     * 
     * >,<,>=,<=
     */
    private void comparisonCheck() throws FatalError {
        if (this.e == null || this.ue == null) {
            InfoDump.reportSemanticError("Binary operation ("+this.bo+") is missing an operand");
        }
        
        if (!this.e.type.equals(this.ue.getAtomicType())){
            InfoDump.reportSemanticError("Operands type must be the same ("+this.bo+")"+
                    ". Types found: "+this.e.type.getDType()+", "+
                    this.ue.getAtomicType().getDType()+" in "+this.e.ue.p.getLocationInfo());
            
            return;
        }
        
        if (this.e.type.getDType() != Atomic.TS_INT || 
                this.ue.getAtomicType().getDType() != Atomic.TS_INT){
            InfoDump.reportSemanticError("Both operands of '"+this.bo+"' must be integer in "+
                    this.ue.p.getLocationInfo());
            return;
        }
        
        this.type = Main.atomicBool;
    }
    
    /**
     * Parametros: ambos bool o ambos int
     * Tipo resultante: bool
     * 
     * ==, !=
     */
    private void equalityCheck()  throws FatalError{
        if (this.e == null || this.ue == null) {
            InfoDump.reportSemanticError("Binary operation ("+this.bo+") is missing an operand");
            return;
        }
        
        if (!this.e.type.equals(this.ue.getAtomicType())){
            InfoDump.reportSemanticError("Operands type must be the same ("+this.bo+")"+
                    ". Types found: "+this.e.type.getDType()+", "+
                    this.ue.getAtomicType().getDType());
            
            return;
        }
        
        this.type = Main.atomicBool;
    }
    
    /**
     * Parametros: ambos bool
     * Tipo resultante: bool
     * 
     * &&, ||
     */
    private void booleanCheck()  throws FatalError{
        if (this.e == null || this.ue == null) {
            InfoDump.reportSemanticError("Binary operation ("+this.bo+") is missing an operand");
            return;
        }
        
        if (!this.e.type.equals(this.ue.getAtomicType())){
            InfoDump.reportSemanticError("Operands type must be the same ("+this.bo+")"+
                    ". Types found: "+this.e.type.getDType()+", "+
                    this.ue.getAtomicType().getDType());
            
            return;
        }
        
        if (this.e.type.getDType() != Atomic.TS_BOOL || 
                this.ue.getAtomicType().getDType() != Atomic.TS_BOOL){
            InfoDump.reportSemanticError("Both operands of '"+this.bo+"' must be bool");
            return;
        }
        
        this.type = Main.atomicBool;
    }
    
    /**
     * Parametros: ambos int
     * Tipo resultante: int
     * 
     * +,-,*,/,%
     */
    private void arithmeticCheck()  throws FatalError{
        if (this.e == null || this.ue == null) {
            InfoDump.reportSemanticError("Binary operation ("+this.bo+") is missing an operand");
            return;
        }
        
        
        if (e.type == null){
            System.out.println("AtomicType de Expr es null");
            return;
        }
        
        
        if (ue.getAtomicType() == null){
            System.out.println("AtomicType de UnExpr es null");
            return;
        }
        
        
        
        if (!this.e.type.equals(this.ue.getAtomicType())){
            InfoDump.reportSemanticError("Operands type must be the same ("+this.bo+")"+
                    ". Types found: "+this.e.type.getDType()+", "+
                    this.ue.getAtomicType().getDType() + " in "+
                    this.ue.p.getLocationInfo());
            
            return;
        }
        
        if (this.e.type.getDType() != Atomic.TS_INT || 
                this.ue.getAtomicType().getDType() != Atomic.TS_INT){
            InfoDump.reportSemanticError("Both operands of '"+this.bo+"' must be integer in "+
                    this.ue.p.getLocationInfo());
            return;
        }
        
        this.type = Main.atomicInt;
    }

    @Override
    public void generateIntermediateCode() {

        if (this.ue != null && this.bo == null && this.e == null){
            // Expr --> UnExpr
            this.intermediateVar = ue.intermediateVar;
            
        } else {
            // Expr --> Expr BinOp UnExpr
            this.intermediateVar = new IntermediateCode.Variable();
            
            Main.gen.generateBinary(Main.gen.getOpcodeEquivalence(bo), 
                    e.intermediateVar, ue.intermediateVar, intermediateVar);
        }


    }
    
}
