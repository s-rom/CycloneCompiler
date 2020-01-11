package AST;

import SymbolTable.AtomicType;
import SymbolTable.Description;
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

    @Override
    public void semanticCheck() {
    }
    
    public static enum PrimaryType {
        STR_LIT, BOOL_LIT, INT_LIT, FUNCTION_CALL, EXPR, ID
    }
    
    public Primary(int int_lit){
        this.int_lit = int_lit;
        this.productionType = PrimaryType.INT_LIT;
        this.type = Main.atomicInt;
        toDot();
    }
    
    public Primary(boolean bool_lit){
        this.bool_lit = bool_lit;
        this.productionType = PrimaryType.BOOL_LIT;
        this.type = Main.atomicBool;
        toDot();
    }
    
    /*
    Primary --> id
    */
    public Primary(String id, PrimaryType type) throws FatalError{
        this.id = id;
        this.productionType = type;
        this.type = Main.atomicNull;

        if (null == type){
            
            this.type = Main.atomicNull;
        
        } else switch (type) {
            case ID:
                Description d = ts.get(id);
                if (d == null){
                    InfoDump.reportSemanticError("ID ("+id+") is not defined");
                    throw new FatalError();                    
                }
                VarDescription vd = (VarDescription)d;
                TypeDescription td = (TypeDescription) ts.get(vd.type);
                this.type = td.getAtomicType();
                break;
            case STR_LIT:
                this.type = Main.atomicChar;
                break;
        }
        toDot();
    }
    
    /* 
    Ej: foo(x,y)
    */
    public Primary(FunctionCall fl, String id){
        this.id = id;
        this.fl = fl;
        this.productionType = PrimaryType.FUNCTION_CALL;
        // Buscar el tipo de la funcion (retorno) en la ts
        // asignar el tipo de la funcion (retorno) a this.type
        toDot();
    }
    
    /*
    Primary --> (Expr)
    */
    public Primary(Expr e){
        this.e = e;
        this.productionType = PrimaryType.EXPR;
        this.type = e.getAtomicType();
        toDot();
    }

    public AtomicType getType() {
        return type;
    }

    public void setType(AtomicType type) {
        this.type = type;
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
