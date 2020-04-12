package AST;

import cyclonecompiler.DOT;

public class Instruction extends Node{

    @Override
    public void semanticCheck() {
    }

    @Override
    public void generateIntermediateCode() {
        switch(this.type)
        {
            case FUNCTION_CALL:
                break;
            case INPUT:
                break;
            case OUTPUT:
                break;
            case RETURN:
                break;
            case ASSIGNATION:
                System.out.println("Instruction genera Assignation");
                assign.generateIntermediateCode();
                break;
            case DECLARATION:
                break;
        }
    }
    

    public static enum InstructionType{
        FUNCTION_CALL, INPUT, OUTPUT, RETURN, ASSIGNATION, DECLARATION;
    }
    
    private FunctionCall fl;
    private Expr e;
    private Assignation assign;
    private Declaration declar;
    
    private InstructionType type;
    
    public Instruction(FunctionCall fl) {
        this.fl = fl;
        this.type = InstructionType.FUNCTION_CALL;
        toDot();
    }
    
    public Instruction(Expr e, InstructionType type){
        this.e = e;
        this.type = type;
        toDot();
    }
    
    public Instruction(InstructionType type){
        this.type = type;
        toDot();
    }
    
    public Instruction(Assignation assign){
        this.assign = assign;
        this.type = InstructionType.ASSIGNATION;
        toDot();
    }
    
    public Instruction(Declaration declar){
        this.declar = declar;
        this.type=InstructionType.DECLARATION;
        toDot();
    }
    
    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "Instruction");
        int aux_node_id;
        switch(type){
            case FUNCTION_CALL:
                if(fl!= null)DOT.writeEdge(nodeNumber, fl.getNodeNumber());
                break;
            
            case INPUT:
                aux_node_id = DOT.nextNode();
                DOT.writeNode(aux_node_id, "INPUT");
                DOT.writeEdge(nodeNumber, aux_node_id);
                break;
            
            case OUTPUT:
                aux_node_id = DOT.nextNode();
                DOT.writeNode(aux_node_id, "OUTPUT");
                DOT.writeEdge(nodeNumber, aux_node_id);
                if (e != null) DOT.writeEdge(aux_node_id, e.getNodeNumber());
                break;
                
            case RETURN:
                aux_node_id = DOT.nextNode();
                DOT.writeNode(aux_node_id, "RETURN");
                DOT.writeEdge(nodeNumber, aux_node_id);
                if (e != null) DOT.writeEdge(aux_node_id, e.getNodeNumber());
                break;
            
            case ASSIGNATION:
                if(assign!=null)DOT.writeEdge(nodeNumber, assign.getNodeNumber());
                break;
            
            case DECLARATION:
                if(declar!=null)DOT.writeEdge(nodeNumber, declar.getNodeNumber());
                break;
        
        }
    }
    
}
