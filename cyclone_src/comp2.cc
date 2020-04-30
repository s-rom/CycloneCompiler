func void cyclone()
{
    const int b = 2;   
    int x = 1;
    int y = 3;
    int z = x + y + b;
}

func void prueba(int x)
{
    // Aquí x se refiere a la variable local a prueba
    x = 3;
    while (x > 0)
    {
        x = x - 1;
    }
    
}