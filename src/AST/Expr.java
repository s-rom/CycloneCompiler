package AST;

import IntermediateCode.Tag;
import SymbolTable.AtomicType;
import SymbolTable.AtomicType.Atomic;
import SymbolTable.VarDescription;
import SymbolTable.VarDescription.VarSemantics;
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
            System.out.println("Expression genera UnaryExpression");
            this.ue.generateIntermediateCode();
            this.intermediateVar = ue.intermediateVar;
            
        } else {
            // Expr --> Expr BinOp UnExpr
            System.out.println("Expression genera Expression y UnaryExpression");
            this.ue.generateIntermediateCode();
            this.e.generateIntermediateCode();
            
            // Asunción: Expr y UnExpr tendrán que tener el mismo tipo (detectado en semanticCheck)
            // Si no, habría que determinar el tipo de la expresión en función de sus operandos
            this.intermediateVar = new IntermediateCode.Variable(VarSemantics.LOCAL, 
                    this.ue.intermediateVar.getType());
            
            if (!isBinOpRelational()){
                Main.gen.generateBinary(Main.gen.getOpcodeEquivalence(bo), 
                    e.intermediateVar, ue.intermediateVar, intermediateVar);
            } else {
                Main.gen.generateTabbedCommentary("Relational");
                // TODO: replace with proper true/false values
                Main.gen.generateAssignation("-1",intermediateVar);
                Tag t = new Tag(); 
                Main.gen.generateRelational(Main.gen.getOpcodeEquivalence(bo),
                        e.intermediateVar, ue.intermediateVar, t);
                Main.gen.generateAssignation("0",intermediateVar);
                Main.gen.generateSkip(t);
            }
        }
    }
    
    
    public boolean isBinOpRelational(){
        return bo != null && (bo.equals(">") || bo.equals("<") || 
                bo.equals("==") || bo.equals("!=") ||
                bo.equals(">=") || bo.equals("<="));
    }
    
}
