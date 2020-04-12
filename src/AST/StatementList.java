package AST;

import cyclonecompiler.DOT;

public class StatementList extends Node{
    
    private Statement s;
    private StatementList sl;

    public StatementList(Statement s, StatementList sl) {
        this.s = s;
        this.sl = sl;
        toDot();
    }

    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "{StatementList | {<s>Statement | <sl>StatementList}}",
                "record");
        if (s != null) DOT.writeEdge(nodeNumber,"s", s.getNodeNumber());
        if (sl != null) DOT.writeEdge(nodeNumber, "sl",sl.getNodeNumber());
    }

    @Override
    public void semanticCheck() {
    }

    @Override
    public void generateIntermediateCode() {
        if (s != null) {
            System.out.println("StatementList genera Statement");
            s.generateIntermediateCode();
        }
        if (sl != null) {
            System.out.println("StatementList genera StatementList");
            sl.generateIntermediateCode();
        }
    }
    
}
