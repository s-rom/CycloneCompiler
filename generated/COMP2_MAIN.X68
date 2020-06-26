            ORG $1000
            INCLUDE "../68LIB/PRNTLIB.X68"
            INCLUDE "../68LIB/STRLIB.X68"
F11: 
            MOVE.L A6, -(A7)              ;<PMB, f11(cyclone)>
            MOVE.L A7, A6
            SUB.L #42, A7

            MOVE.L #6, D6                 ;<ASSIGN, 6, t34>
            MOVE.L D6, -4(A6)
            MOVE.L -4(A6), D6             ;<ASSIGN, t34, t33>
            MOVE.L D6, -8(A6)
            MOVE.L #255, D6               ;<ASSIGN, 255, t35>
            MOVE.L D6, -12(A6)
            MOVE.L -12(A6), D6            ;<PARAM, t35>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t36>
            MOVE.L D6, -16(A6)
            MOVE.L -16(A6), D6            ;<PARAM, t36>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t37>
            MOVE.L D6, -20(A6)
            MOVE.L -20(A6), D6            ;<PARAM, t37>
            MOVE.L D6, -(A7)
            MOVE.L #14, D6                ;<ASSIGN, 14, t38>
            MOVE.L D6, -24(A6)
            MOVE.L -24(A6), D6            ;<PARAM, t38>
            MOVE.L D6, -(A7)
            MOVE.L -8(A6), D6             ;<PARAM, t33>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t39>
            MOVE.L D6, -28(A6)
            MOVE.L -28(A6), D6            ;<PARAM, t39>
            MOVE.L D6, -(A7)
            JSR SETTXTPR                  ;<CALL, f1>
            ADD.L #24, A7

            MOVE.L #$48656c6c,-42(A6)
            MOVE.L #$6f2c2057,-38(A6)
            MOVE.L #$6f726c64,-34(A6)
            MOVE.W #$2100,-30(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t40>
            ADDA.L #-42, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L A6, A7                 ;<RET, f11(cyclone)>
            MOVE.L (A7)+, A6
            RTS

START:      MOVE.L A7, A6
            JSR F11
            SIMHALT
            END START
