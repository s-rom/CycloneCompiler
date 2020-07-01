            ORG $1000
            INCLUDE "../../68LIB/CYCLONE.X68"
F1: 
            MOVE.L A6, -(A7)              ;<PMB, f1(cyclone)>
            MOVE.L A7, A6
            SUB.L #132, A7
            MOVE.L #6, -4(A6)             ;<ASSIGN, 6, t10>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #14, -(A7)             ;<PARAM, 14>
            MOVE.L -4(A6), -(A7)          ;<PARAM, t10>
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            JSR SETTXTPR                  ;<CALL, f0>
            ADD.L #24, A7
            MOVE.L #$496e7472,-26(A6)
            MOVE.L #$6f647563,-22(A6)
            MOVE.L #$6520756e,-18(A6)
            MOVE.L #$20656e74,-14(A6)
            MOVE.L #$65726f3a,-10(A6)
            MOVE.W #$2000,-6(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t13>
            ADDA.L #-26, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L #4, D0                 ;<READ_INT, t14>
            TRAP #15
            MOVE.L D1, -30(A6)
            MOVE.L -30(A6), -34(A6)       ;<ASSIGN, t14, t11>

            MOVE.L #$496e7472,-64(A6)
            MOVE.L #$6f647563,-60(A6)
            MOVE.L #$6520756e,-56(A6)
            MOVE.L #$20736567,-52(A6)
            MOVE.L #$756e646f,-48(A6)
            MOVE.L #$20656e74,-44(A6)
            MOVE.L #$65726f3a,-40(A6)
            MOVE.W #$2000,-36(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t15>
            ADDA.L #-64, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L #4, D0                 ;<READ_INT, t16>
            TRAP #15
            MOVE.L D1, -68(A6)
            MOVE.L -68(A6), -72(A6)       ;<ASSIGN, t16, t12>

            MOVE.L -34(A6), D1            ;<OUTPUT, t11>
            MOVE.L #3, D0
            TRAP #15
            MOVE.L #$202b2000,-76(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t17>
            ADDA.L #-76, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -72(A6), D1            ;<OUTPUT, t12>
            MOVE.L #3, D0
            TRAP #15
            MOVE.L #$203d2000,-80(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t18>
            ADDA.L #-80, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -34(A6), D6            ;<ADD, t11, t12, t19>
            MOVE.L -72(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -84(A6)
            MOVE.L -84(A6), D1            ;<OUTPUTLN, t19>
            MOVE.L #3, D0
            TRAP #15
            JSR NEWLN

            MOVE.L -34(A6), D1            ;<OUTPUT, t11>
            MOVE.L #3, D0
            TRAP #15
            MOVE.L #$202d2000,-88(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t20>
            ADDA.L #-88, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -72(A6), D1            ;<OUTPUT, t12>
            MOVE.L #3, D0
            TRAP #15
            MOVE.L #$203d2000,-92(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t21>
            ADDA.L #-92, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -34(A6), D6            ;<SUB, t11, t12, t22>
            MOVE.L -72(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -96(A6)
            MOVE.L -96(A6), D1            ;<OUTPUTLN, t22>
            MOVE.L #3, D0
            TRAP #15
            JSR NEWLN

            MOVE.L -34(A6), D1            ;<OUTPUT, t11>
            MOVE.L #3, D0
            TRAP #15
            MOVE.L #$202a2000,-100(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t23>
            ADDA.L #-100, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -72(A6), D1            ;<OUTPUT, t12>
            MOVE.L #3, D0
            TRAP #15
            MOVE.L #$203d2000,-104(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t24>
            ADDA.L #-104, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -34(A6), D6            ;<MULT, t11, t12, t25>
            MOVE.L -72(A6), D5
            MULS D6, D5
            MOVE.L D5, -108(A6)
            MOVE.L -108(A6), D1           ;<OUTPUTLN, t25>
            MOVE.L #3, D0
            TRAP #15
            JSR NEWLN

            MOVE.L -34(A6), D1            ;<OUTPUT, t11>
            MOVE.L #3, D0
            TRAP #15
            MOVE.L #$202f2000,-112(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t26>
            ADDA.L #-112, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -72(A6), D1            ;<OUTPUT, t12>
            MOVE.L #3, D0
            TRAP #15
            MOVE.L #$203d2000,-116(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t27>
            ADDA.L #-116, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -34(A6), D5            ;<DIV, t11, t12, t28>
            MOVE.L -72(A6), D6
            DIVS D6, D5
            AND.L #$0000FFFF, D5
            MOVE.L D5, -120(A6)
            MOVE.L -120(A6), D1           ;<OUTPUTLN, t28>
            MOVE.L #3, D0
            TRAP #15
            JSR NEWLN

            MOVE.L -34(A6), D1            ;<OUTPUT, t11>
            MOVE.L #3, D0
            TRAP #15
            MOVE.L #$20252000,-124(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t29>
            ADDA.L #-124, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -72(A6), D1            ;<OUTPUT, t12>
            MOVE.L #3, D0
            TRAP #15
            MOVE.L #$203d2000,-128(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t30>
            ADDA.L #-128, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -34(A6), D5            ;<MOD, t11, t12, t31>
            MOVE.L -72(A6), D6
            DIVS D6, D5
            LSR.L  #8, D5
            LSR.L  #8, D5
            MOVE.L D5, -132(A6)
            MOVE.L -132(A6), D1           ;<OUTPUTLN, t31>
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
