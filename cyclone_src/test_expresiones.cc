
/**
* Programa de test correcto. Expresiones aritmetico-lógicas
*/
func void main () {

    int x = -7;
    int y = x % 2;               
    int z = x + (y * y) + 2;

    bool a = (x < 3) || (y > 1) && (z != -1); // -> Expression correcta
    // bool a = x < 3 || y > 1;                  -> de momento, expression incorrecta
    bool b = !true;
    bool cond = !(a && b) || b; 

}