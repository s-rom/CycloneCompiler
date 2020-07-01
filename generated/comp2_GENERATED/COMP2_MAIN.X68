            ORG $1000
            INCLUDE "../../68LIB/CYCLONE.X68"
F11: 
            MOVE.L A6, -(A7)              ;<PMB, f11(cyclone)>
            MOVE.L A7, A6
            SUB.L #18, A7
            MOVE.L #6, -4(A6)             ;<ASSIGN, 6, t33>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #14, -(A7)             ;<PARAM, 14>
            MOVE.L -4(A6), -(A7)          ;<PARAM, t33>
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            JSR SETTXTPR                  ;<CALL, f1>
            ADD.L #24, A7
            MOVE.L #$48656c6c,-18(A6)
            MOVE.L #$6f2c2057,-14(A6)
            MOVE.L #$6f726c64,-10(A6)
            MOVE.W #$2100,-6(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t34>
            ADDA.L #-18, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L A6, A7                 ;<RET, f11(cyclone)>
            MOVE.L (A7)+, A6
            RTS

START:      MOVE.L A7, A6
            JSR F11
            SIMHALT
            END START
