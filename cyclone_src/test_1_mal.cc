
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
    //Dará error porque el 4º parametro es string y no int
    rectBetween(x1,y2,x2,"hola");
   //rectBetween(); otro error
}


