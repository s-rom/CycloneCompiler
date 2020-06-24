            ORG $1000
            INCLUDE "../68LIB/PRNTLIB.X68"
            INCLUDE "../68LIB/STRLIB.X68"
F1: 
            MOVE.L A6, -(A7)              ;<PMB, f1(cyclone)>
            MOVE.L A7, A6
            SUB.L #120, A7

            MOVE.L #6, D6                 ;<ASSIGN, 6, t14>
            MOVE.L D6, -4(A6)
            MOVE.L -4(A6), D6             ;<ASSIGN, t14, t10>
            MOVE.L D6, -8(A6)
            MOVE.L #255, D6               ;<ASSIGN, 255, t15>
            MOVE.L D6, -12(A6)
            MOVE.L -12(A6), D6            ;<PARAM, t15>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t16>
            MOVE.L D6, -16(A6)
            MOVE.L -16(A6), D6            ;<PARAM, t16>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t17>
            MOVE.L D6, -20(A6)
            MOVE.L -20(A6), D6            ;<PARAM, t17>
            MOVE.L D6, -(A7)
            MOVE.L #14, D6                ;<ASSIGN, 14, t18>
            MOVE.L D6, -24(A6)
            MOVE.L -24(A6), D6            ;<PARAM, t18>
            MOVE.L D6, -(A7)
            MOVE.L -8(A6), D6             ;<PARAM, t10>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t19>
            MOVE.L D6, -28(A6)
            MOVE.L -28(A6), D6            ;<PARAM, t19>
            MOVE.L D6, -(A7)
            JSR SETTXTPR                  ;<CALL, f0>
            ADD.L #24, A7

            MOVE.L #7, D6                 ;<ASSIGN, 7, t20>
            MOVE.L D6, -32(A6)
            MOVE.L -32(A6), D6            ;<ASSIGN, t20, t11>
            MOVE.L D6, -36(A6)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t21>
            MOVE.L D6, -40(A6)
            MOVE.L -40(A6), D6            ;<ASSIGN, t21, t12>
            MOVE.L D6, -44(A6)
            MOVE.L -36(A6), D6            ;<SUB, t11, t12, t22>
            MOVE.L -44(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -48(A6)
            MOVE.L -48(A6), D6            ;<ASSIGN, t22, t13>
            MOVE.L D6, -52(A6)
            MOVE.L #$2037202d,-60(A6)
            MOVE.L #$20330000,-56(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t23>
            ADDA.L #-60, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L #$203d2000,-64(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t24>
            ADDA.L #-64, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -52(A6), D1            ;<OUTPUTLN, t13>
            MOVE.L #3, D0
            TRAP #15
            JSR NEWLN

            MOVE.L -36(A6), D6            ;<ADD, t11, t12, t25>
            MOVE.L -44(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -68(A6)
            MOVE.L -68(A6), D6            ;<ASSIGN, t25, t13>
            MOVE.L D6, -52(A6)
            MOVE.L #$2037202b,-76(A6)
            MOVE.L #$20330000,-72(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t26>
            ADDA.L #-76, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L #$203d2000,-80(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t27>
            ADDA.L #-80, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -52(A6), D1            ;<OUTPUTLN, t13>
            MOVE.L #3, D0
            TRAP #15
            JSR NEWLN

            MOVE.L #0, D6                 ;<SUB, 0, t12, t28>
            MOVE.L -44(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -84(A6)
            MOVE.L -84(A6), D6            ;<ASSIGN, t28, t12>
            MOVE.L D6, -44(A6)
            MOVE.L -36(A6), D6            ;<SUB, t11, t12, t29>
            MOVE.L -44(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -88(A6)
            MOVE.L -88(A6), D6            ;<ASSIGN, t29, t13>
            MOVE.L D6, -52(A6)
            MOVE.L #$2037202d,-98(A6)
            MOVE.L #$20282d33,-94(A6)
            MOVE.W #$2900,-90(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t30>
            ADDA.L #-98, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L #$203d2000,-102(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t31>
            ADDA.L #-102, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -52(A6), D1            ;<OUTPUTLN, t13>
            MOVE.L #3, D0
            TRAP #15
            JSR NEWLN

            MOVE.L -36(A6), D6            ;<ADD, t11, t12, t32>
            MOVE.L -44(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -106(A6)
            MOVE.L -106(A6), D6           ;<ASSIGN, t32, t13>
            MOVE.L D6, -52(A6)
            MOVE.L #$2037202b,-116(A6)
            MOVE.L #$20282d33,-112(A6)
            MOVE.W #$2900,-108(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t33>
            ADDA.L #-116, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L #$203d2000,-120(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t34>
            ADDA.L #-120, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -52(A6), D1            ;<OUTPUTLN, t13>
            MOVE.L #3, D0
            TRAP #15
            JSR NEWLN

            MOVE.L A6, A7                 ;<RET, f1(cyclone)>
            MOVE.L (A7)+, A6
            RTS

START:      MOVE.L A7, A6
            JSR F1
            SIMHALT
            END START
