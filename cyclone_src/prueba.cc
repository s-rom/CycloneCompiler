
/**
* Calcula e imprime la recta entre dos puntos.
*/
func void rectBetween(int x1, int y1, int x2, int y2)
{
    int dx = x2 - x1;
    int dy = y2 - y1;
    int slope = dy / dx;
    int y_intercept = y1 - (slope * x1);
    output("rect: ");
    output("y = ");
    output(slope);
    output("x + ");
    output(y_intercept);
    output("\n");
}

/* 
* Función principal
*/
func int main()
{
    const int max = INT32_MAX; //constante predefinida
    int x1 = 0;
    int y1 = -3;

    int x2 = -3;
    int y2 = 5;

    output("El maximo de la variable int es: ");
    output(max);

    rectBetween(x1,y2,x2,y2);

    int x = 0;
    if (x >= 0)
    {
        while (x < 100){
            x = x + 1;
            output(x);
        }
    }

}


