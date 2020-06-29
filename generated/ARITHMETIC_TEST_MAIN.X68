            ORG $1000
            INCLUDE "../68LIB/PRNTLIB.X68"
            INCLUDE "../68LIB/STRLIB.X68"
F1: 
            MOVE.L A6, -(A7)              ;<PMB, f1(cyclone)>
            MOVE.L A7, A6
            SUB.L #24, A7

            MOVE.L #6, D6                 ;<ASSIGN, 6, t10>
            MOVE.L D6, -4(A6)
            MOVE.L #255, D6               ;<PARAM, 255>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<PARAM, 255>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<PARAM, 255>
            MOVE.L D6, -(A7)
            MOVE.L #14, D6                ;<PARAM, 14>
            MOVE.L D6, -(A7)
            MOVE.L -4(A6), D6             ;<PARAM, t10>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<PARAM, 0>
            MOVE.L D6, -(A7)
            JSR SETTXTPR                  ;<CALL, f0>
            ADD.L #24, A7


            MOVE.L #4, D0                 ;<READ_INT, t13>
            TRAP #15
            MOVE.L D1, -8(A6)

            MOVE.L -8(A6), D6             ;<ASSIGN, t13, t11>
            MOVE.L D6, -12(A6)


            MOVE.L #4, D0                 ;<READ_INT, t14>
            TRAP #15
            MOVE.L D1, -16(A6)

            MOVE.L -16(A6), D6            ;<ASSIGN, t14, t12>
            MOVE.L D6, -20(A6)
            MOVE.L -12(A6), D1            ;<OUTPUT, t11>
            MOVE.L #3, D0
            TRAP #15

            MOVE.L -20(A6), D1            ;<OUTPUT, t12>
            MOVE.L #3, D0
            TRAP #15

            MOVE.L -12(A6), D6            ;<ADD, t11, t12, t15>
            MOVE.L -20(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -24(A6)
            MOVE.L -24(A6), D1            ;<OUTPUT, t15>
            MOVE.L #3, D0
            TRAP #15
            MOVE.L A6, A7                 ;<RET, f1(cyclone)>
            MOVE.L (A7)+, A6
            RTS

START:      MOVE.L A7, A6
            JSR F1
            SIMHALT
            END START
