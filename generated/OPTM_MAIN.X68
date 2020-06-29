            ORG $1000
            INCLUDE "../68LIB/PRNTLIB.X68"
            INCLUDE "../68LIB/STRLIB.X68"
F1: 
            MOVE.L A6, -(A7)              ;<PMB, f1(cyclone)>
            MOVE.L A7, A6
            SUB.L #16, A7

            MOVE.L #6, D6                 ;<ASSIGN, 6, t10>
            MOVE.L D6, -4(A6)
            MOVE.L #8, D6                 ;<ASSIGN, 8, t11>
            MOVE.L D6, -8(A6)
            MOVE.L -8(A6), D5             ;<DIV, t11, t10, t13>
            MOVE.L -4(A6), D6
            DIVS D6, D5
            AND.L #$0000FFFF, D5
            MOVE.L D5, -12(A6)
            MOVE.L -12(A6), D6            ;<ASSIGN, t13, t12>
            MOVE.L D6, -16(A6)
            MOVE.L A6, A7                 ;<RET, f1(cyclone)>
            MOVE.L (A7)+, A6
            RTS

START:      MOVE.L A7, A6
            JSR F1
            SIMHALT
            END START
