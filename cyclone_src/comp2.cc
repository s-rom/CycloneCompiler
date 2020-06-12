func void cyclone()
{
    output("a");
    output(6);
    output("b");

    /* El IC está listo en cuanto a strings */
    /* IC --> 68K */

    // t1 = "hola"      Cargar hola\0 en la pila
    // t2 = t1          Copiar t2 en t1
    
    // output(t1)       Cargar direccion de t1 en A1 y trap #15
}