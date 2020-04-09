package IntermediateCode;

public class Tag {

    private static int tags = 0;
    public static int nextId(){
        return tags++;
    }
   
    private int id;
    
    /**
     * Cada Tag creado és único.
     */
    public Tag(){
        id = nextId();
    }
    
    @Override
    public String toString(){
        return "e"+id; 
    }
    
    public static boolean equals(Tag t1, Tag t2){
        return t1.id == t2.id;
    }
    
}
