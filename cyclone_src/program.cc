/* AddTwo: Suma dos numeros
    @param int a primer operando
    @param int b segundo operando
    @returns int resultado de a + b
*/
func int AddTwo(int a, int b)
{
    return a+b;
}



/* CountTo: Cuenta hasta un cierto objetivo e imprime la cuenta
    @param int goal Objetivo hasta el que contar
    @example
        goal = 3
        out: 1
             2
             3
*/
func void CountTo(int goal)
{
    int i = 1;
    while (i <= goal)
    {
        i = i + 1;
        output(i);
    }
}

func string prueba()
{
    int msg = "hola";

    int y = 3;
    int x = y + 1 % 3;
    bool cond = x < 3 || x > 0;

    if (cond)
    {
        output("kek");
    }

    return "hola";
}

/* Función principal */
func int main()
{
    int x = 2;
    int y = 3;
    int result = AddTwo(x , y);
    output("Se ha contado hasta :");
    output(result);
    countTo(result);
}



