            ORG $1000
            INCLUDE "../../68LIB/CYCLONE.X68"
F1: 
            MOVE.L A6, -(A7)              ;<PMB, f1(cyclone)>
            MOVE.L A7, A6
            SUB.L #8, A7
            MOVE.L #7, -4(A6)             ;<ASSIGN, 7, t10>
            MOVE.L -4(A6), -8(A6)         ;<ASSIGN, t10, t11>

            MOVE.L A6, A7                 ;<RET, f1(cyclone)>
            MOVE.L (A7)+, A6
            RTS

START:      MOVE.L A7, A6
            JSR F1
            SIMHALT
            END START
