// Factorial de un entero
func void funcionPrueba(int x){
    if (x < 1)
    {
        int i = 0; // i no existe fuera del if
        if (x == 0)
        {
            int l = 0; //l no existe fuera del if
            while(l<30)
            {
                output(l);
                l = l + 1;
            }
        }
    } 
    
    return x;
}

func void main()
{
    funcionPrueba(0);
}