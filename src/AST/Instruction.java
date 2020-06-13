package AST;

import cyclonecompiler.DOT;
import cyclonecompiler.Main;

public class Instruction extends Node{

    @Override
    public void semanticCheck() {
    }

    @Override
    public void generateIntermediateCode() {
        switch(this.type)
        {
            case OUTPUTLN:
                this.e.generateIntermediateCode();
                Main.gen.generateOutputLn(this.e.intermediateVar);
                System.err.println("Generated outputLN");
                break;
                
            case FUNCTION_CALL:
                this.fl.generateIntermediateCode();
                break;
            
            case INPUT:
                break;
            
            case OUTPUT:
                this.e.generateIntermediateCode();
                Main.gen.generateOutput(this.e.intermediateVar);
                break;
            
            case RETURN:
                this.e.generateIntermediateCode();
                Main.gen.generateReturn(this.e.intermediateVar);
                break;
            
            case ASSIGNATION:
                assign.generateIntermediateCode();
                break;
            
            case DECLARATION:
                break;
            
            case ALLOCATION:
                alloc.generateIntermediateCode();
                break;
        }
    }
    

    public static enum InstructionType{
        FUNCTION_CALL, INPUT, OUTPUT, OUTPUTLN,
        RETURN, ASSIGNATION, DECLARATION, ALLOCATION;
    }
    
    private FunctionCall fl;
    private Expr e;
    private Assignation assign;
    private Declaration declar;
    private Allocation alloc;
    
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
    
    public Instruction(Allocation alloc){
        this.alloc = alloc;
        this.type = InstructionType.ALLOCATION;
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
            
            case OUTPUTLN:
                aux_node_id = DOT.nextNode();
                DOT.writeNode(aux_node_id, "OUTPUTLN");
                DOT.writeEdge(nodeNumber, aux_node_id);
                if (e != null) DOT.writeEdge(aux_node_id, e.getNodeNumber());
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
            case ALLOCATION:
                if (alloc != null) DOT.writeEdge(nodeNumber, alloc.getNodeNumber());
                break;
        }
    }
    
}
