package AST;

import SymbolTable.AtomicType;
import SymbolTable.ConstDescription;
import SymbolTable.Description;
import SymbolTable.DescriptionType;
import SymbolTable.FuncDescription;
import SymbolTable.TypeDescription;
import SymbolTable.VarDescription;
import cyclonecompiler.DOT;
import cyclonecompiler.FatalError;
import cyclonecompiler.InfoDump;
import cyclonecompiler.Main;
import static cyclonecompiler.Main.ts;

public class Primary extends Node {
       
    private Expr e;
    
    private String id;
    private FunctionCall fl;
    
    private String str_lit;
    private boolean bool_lit;
    private int int_lit;
    
    private PrimaryType productionType;
    private AtomicType type;
    
    
    private int line, column;
    public String getLocationInfo(){
        return "line "+(line+1)+", column "+(column+1);
    }
    
    
    @Override
    public void semanticCheck() {
       

    }

    @Override
    public void generateIntermediateCode() {
        switch(productionType)
        {
            case STR_LIT:
                // Genera ti = str_lit
                this.intermediateVar = new IntermediateCode.Variable();
                Main.gen.generateAssignation(str_lit, intermediateVar, "Aux var");
                break;
                
            case BOOL_LIT:
                 // Genera ti = bool_lit
                this.intermediateVar = new IntermediateCode.Variable();
                Main.gen.generateAssignation(bool_lit, intermediateVar, "Aux var");
                break;
                
            case INT_LIT:
                 // Genera ti = int_lit
                System.out.println("Primary genera nueva variable auxiliar");
                this.intermediateVar = new IntermediateCode.Variable();
                Main.gen.generateAssignation(int_lit, intermediateVar, "Aux var");
                break;
                
            case FUNCTION_CALL:
                System.err.println("F call not implemented yet"); break;
                
            case EXPR:
                // TODO: VIGILAR ESTO QUE SEA ASÍ
                this.e.generateIntermediateCode();
                this.intermediateVar = this.e.intermediateVar;
                
            case ID:
                Description d = Main.ts.getForward(id);
                if (d.getDescriptionType() == DescriptionType.D_VAR){
                    
                    VarDescription vd = (VarDescription) d;
                    this.intermediateVar = new IntermediateCode.Variable(vd.varNumber);
                    
                } else if (d.getDescriptionType() == DescriptionType.D_CONST){
                   
                    ConstDescription cd = (ConstDescription) d;
                    this.intermediateVar = new IntermediateCode.Variable(cd.getConstNum());
                    
                }
                    
        }
    }
    
    public static enum PrimaryType {
        STR_LIT, BOOL_LIT, INT_LIT, FUNCTION_CALL, EXPR, ID
    }
    
    /*
    Primary --> int literal
    */
    public Primary(int int_lit, int line, int column){
        this.int_lit = int_lit;
        this.productionType = PrimaryType.INT_LIT;
        this.type = Main.atomicInt;
        this.line = line;
        this.column = column;
        toDot();
    }
    
    /*
    Primary --> bool literal
    */
    public Primary(boolean bool_lit, int line, int column){
        this.bool_lit = bool_lit;
        this.productionType = PrimaryType.BOOL_LIT;
        this.type = Main.atomicBool;
        this.line = line;
        this.column = column;
        toDot();
    }
    
    /*
    Primary --> id
    */
    public Primary(String id, PrimaryType type,int line, int column) throws FatalError{
        this.id = id;
        this.productionType = type;
        this.type = Main.atomicNull;
        this.line = line;
        this.column = column;
        if (null == type){
            
            this.type = Main.atomicNull;
        
        } else switch (type) {
            case ID:
                Description d = ts.get(id);
                if (d == null){
                    InfoDump.reportSemanticError("ID ("+id+") is not defined in "
                            +getLocationInfo());
                }
                
                TypeDescription td;
                
                if (d.getDescriptionType() == DescriptionType.D_VAR){
                    VarDescription vd = (VarDescription) d;
                    
                    td = (TypeDescription) ts.get(vd.type);
                } else {
                    ConstDescription cd = (ConstDescription) d;
                    
                    this.intermediateVar = new IntermediateCode.Variable(cd.getConstNum());
                    
                    td = (TypeDescription) ts.get(cd.type);
                }
                this.type = td.getAtomicType();                
                
                
                
                break;
            case STR_LIT:
                
                this.intermediateVar = new IntermediateCode.Variable();
                Main.gen.generateAssignation('$'+id, intermediateVar, "Aux var");
                
                this.type = Main.atomicChar;
                break;
        }
        toDot();
    }
    
    /* 
    Ej: foo(x,y)
    */
    public Primary(FunctionCall fl, String id,int line, int column) throws FatalError{
        this.id = id;
        this.fl = fl;
        this.productionType = PrimaryType.FUNCTION_CALL;
        this.line = line;
        this.column = column;
        // Buscar el tipo de la funcion (retorno) en la ts
        Description d = Main.ts.get(this.id);
        if (d == null || d.getDescriptionType() != DescriptionType.D_FUNC){
            InfoDump.reportSemanticError(id+" is not an existing function, in ");
        }
        // asignar el tipo de la funcion (retorno) a this.type
        String funcType= ((FuncDescription)d).getReturnType();
        
        d = Main.ts.get(funcType);
        if (d == null || d.getDescriptionType() != DescriptionType.D_TYPE){
            InfoDump.reportLexicError(funcType+" is not a valid type");
        }
        
        if (d != null){
            this.type = ((TypeDescription)d).getAtomicType();
        } else{
            this.type=Main.atomicNull;
        }
        functionCheck(id);
        toDot();
    }
    
    private void functionCheck(String id) throws FatalError{
        Description d = Main.ts.get(id);
        if (d == null){
            InfoDump.reportSemanticError("Function "+id+" is not declared in "+
                    this.getLocationInfo());
        }
        
        if (d.getDescriptionType() != DescriptionType.D_FUNC){
            InfoDump.reportSemanticError(id+" is not a callable function in "+
                    this.getLocationInfo());
        }
        
        FuncDescription fd = (FuncDescription) d;
        if (d == null){
              InfoDump.reportSemanticError(id+" is not a callable function in "+
                    this.getLocationInfo());
        }
        TypeDescription td = (TypeDescription) Main.ts.get(fd.getReturnType());
        this.type = td.getAtomicType();
    }
    
    /*
    Primary --> (Expr)
    */
    public Primary(Expr e,int line, int column){
        this.e = e;
        this.productionType = PrimaryType.EXPR;
        this.type = e.getAtomicType();
        this.line = line;
        this.column = column;
        toDot();
    }

    public AtomicType getType() {
        return type;
    }

    public void setType(AtomicType type) {
        this.type = type;
    }
    
    @Override
    public String toString(){
        switch(productionType){
            case ID: return "ID: "+id;
            case BOOL_LIT: return "BOOL_LIT: "+this.bool_lit;
            case STR_LIT: return "STR_LIT: "+this.str_lit;
            case INT_LIT: return "INT_LIT: "+this.int_lit;
            case FUNCTION_CALL: return "FUNCTION_CALL: "+this.fl;
            case EXPR: return "( EXPRESSION )";
        }
        return "";
    }
    
    @Override
    public void toDot() {
        
        DOT.writeNode(nodeNumber, "Primary");
        
        if (e != null){
            DOT.writeEdge(nodeNumber, e.getNodeNumber());
        } else if (fl != null){
            DOT.writeEdge(nodeNumber, fl.getNodeNumber());
        } else {
            int aux = DOT.nextNode();
            String label;
            switch(productionType){
                case ID: label = "ID: "+id; break;
                case STR_LIT: label = "STR_LIT: "+str_lit; break;
                case INT_LIT: label = "INT_LIT: "+int_lit; break;
                case BOOL_LIT: label = "BOOL_LIT: "+bool_lit; break;
                default:
                    label = "error ???";
            }
            
            DOT.writeNode(aux, label);
            DOT.writeEdge(nodeNumber, aux);
        }
    }
    
}
