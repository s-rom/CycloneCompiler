package IntermediateCode;

public class Tag {

    private static int tags = 0;
    public static int nextId(){
        return tags++;
    }
   
    private int id;
    private String tag = "e";
    
    /**
     * Cada Tag creado és único.
     */
    public Tag(){
        id = nextId();
        tag += id;
    }
    
    public Tag(String subroutine){
        id = nextId();
        tag = subroutine;
    }
    
    @Override
    public String toString(){
        return tag; 
    }
    
    public int getID(){
        return this.id;
    }
    
    public static boolean equals(Tag t1, Tag t2){
        return t1.id == t2.id;
    }
    
}
