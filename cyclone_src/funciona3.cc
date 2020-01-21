func int getValor1(int x, int y)
{
    return 2+((y*x) % 2);
}

func int getValor2(int a)
{
    int i = 1;
    while (i < a)
    {
        i = i * a;
    }
    return i;
}


func void cyclone()
{
    const int a = 23;
    const int b = -3;
    int x = getValor1(getValor2(a),getValor2(b));
}