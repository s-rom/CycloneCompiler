
/**
* Programa de test correcto. Expresiones aritmetico-lógicas
*/
func void main () {

    int x = -7;                  // Unari SUB y int literal
    int y = x % 2;               // id en expression y BinOp MOD

    bool a = (x > 8) || (y > 1); // Comparaciones y OR
    bool b = !true;              // NOT y bool literal
    bool cond = !(a || b) && b;  // Condición compuesta
}