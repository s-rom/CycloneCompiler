package AST;

import cyclonecompiler.DOT;

public class Primary extends Node {
    
    private Expr e;
    
    private String id;
    private FunctionCall fl;
    
    private String str_lit;
    private boolean bool_lit;
    private int int_lit;
    
    private PrimaryType type;
    
    public static enum PrimaryType {
        STR_LIT, BOOL_LIT, INT_LIT, FUNCTION_CALL, EXPR, ID
    }
    
    public Primary(int int_lit){
        this.int_lit = int_lit;
        this.type = PrimaryType.INT_LIT;
        toDot();
    }
    
    public Primary(boolean bool_lit){
        this.bool_lit = bool_lit;
        this.type = PrimaryType.BOOL_LIT;
        toDot();
    }
    
    /*
    Primary --> id
    */
    public Primary(String id, PrimaryType type){
        this.id = id;
        this.type = type;
        toDot();
    }
    
    /* 
    Ej: foo(x,y)
    */
    public Primary(FunctionCall fl, String id){
        this.id = id;
        this.fl = fl;
        this.type = PrimaryType.FUNCTION_CALL;
        toDot();
    }
    
    /*
    Primary --> (Expr)
    */
    public Primary(Expr e){
        this.e = e;
        this.type = PrimaryType.EXPR;
        toDot();
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
            switch(type){
                case ID: label = "ID: "+id; break;
                case STR_LIT: label = "STR_LIT: \""+str_lit+"\""; break;
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
