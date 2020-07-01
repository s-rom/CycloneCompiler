            ORG $1000
            INCLUDE "../../68LIB/CYCLONE.X68"
F2: 
            MOVE.L A6, -(A7)              ;<PMB, f2(print_n_spaces)>
            MOVE.L A7, A6
            SUB.L #18, A7
            MOVE.W #$2000,-2(A6)
            MOVE.L A6, A1                 ;<ASSIGN, t28, t14>
            MOVE.L A6, A2
            ADDA #-4, A1
            ADDA #-2, A2
            JSR STRCPY
            MOVE.L #0, -8(A6)             ;<ASSIGN, 0, t15>
E0: 
            MOVE.L #-1, -12(A6)           ;<ASSIGN, -1, t29>
            MOVE.L -8(A6), D6             ;<LT, t15, t13, e2>
            MOVE.L 8(A6), D5
            CMP.L D5, D6
            BLT E2

            MOVE.L #0, -12(A6)            ;<ASSIGN, 0, t29>
E2: 
            MOVE.L -12(A6), D6            ;<EQ, t29, 0, e1>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E1

            MOVE.W #$2000,-14(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t30>
            ADDA.L #-14, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -8(A6), D6             ;<ADD, t15, 1, t31>
            MOVE.L #1, D5
            ADD.L D6, D5
            MOVE.L D5, -18(A6)
            MOVE.L -18(A6), -8(A6)        ;<ASSIGN, t31, t15>

            JMP E0                        ;<GOTO, e0>
E1: 
            MOVE.L A6, A7                 ;<RET, f2(print_n_spaces)>
            MOVE.L (A7)+, A6
            RTS
F3: 
            MOVE.L A6, -(A7)              ;<PMB, f3(pyramid)>
            MOVE.L A7, A6
            SUB.L #78, A7
            MOVE.L #0, -4(A6)             ;<ASSIGN, 0, t17>
            MOVE.L #0, -12(A6)            ;<ASSIGN, 0, t19>
            MOVE.L #$6f200000,-20(A6)
            MOVE.L A6, A1                 ;<ASSIGN, t32, t21>
            MOVE.L A6, A2
            ADDA #-24, A1
            ADDA #-20, A2
            JSR STRCPY
            MOVE.L #6, -28(A6)            ;<ASSIGN, 6, t22>
            MOVE.L #0, -32(A6)            ;<ASSIGN, 0, t23>
            MOVE.L #0, -36(A6)            ;<ASSIGN, 0, t24>
            MOVE.L #255, -40(A6)          ;<ASSIGN, 255, t25>
E3: 
            MOVE.L #-1, -44(A6)           ;<ASSIGN, -1, t33>
            MOVE.L -4(A6), D6             ;<LE, t17, t16, e5>
            MOVE.L 8(A6), D5
            CMP.L D5, D6
            BLE E5

            MOVE.L #0, -44(A6)            ;<ASSIGN, 0, t33>
E5: 
            MOVE.L -44(A6), D6            ;<EQ, t33, 0, e4>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E4

            MOVE.L 8(A6), D6              ;<SUB, t16, t17, t34>
            MOVE.L -4(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -48(A6)
            MOVE.L -48(A6), -12(A6)       ;<ASSIGN, t34, t19>

            MOVE.L -12(A6), D6            ;<ADD, t19, 2, t35>
            MOVE.L #2, D5
            ADD.L D6, D5
            MOVE.L D5, -52(A6)
            MOVE.L -52(A6), -(A7)         ;<PARAM, t35>
            JSR F2                        ;<CALL, f2>
            ADD.L #4, A7
            MOVE.L #0, -8(A6)             ;<ASSIGN, 0, t18>
E6: 
            MOVE.L #-1, -56(A6)           ;<ASSIGN, -1, t36>
            MOVE.L -8(A6), D6             ;<LT, t18, t17, e8>
            MOVE.L -4(A6), D5
            CMP.L D5, D6
            BLT E8

            MOVE.L #0, -56(A6)            ;<ASSIGN, 0, t36>
E8: 
            MOVE.L -56(A6), D6            ;<EQ, t36, 0, e7>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E7

            MOVE.L -8(A6), D5             ;<MOD, t18, 2, t37>
            MOVE.L #2, D6
            DIVS D6, D5
            LSR.L  #8, D5
            LSR.L  #8, D5
            MOVE.L D5, -60(A6)
            MOVE.L -4(A6), D5             ;<MOD, t17, 2, t38>
            MOVE.L #2, D6
            DIVS D6, D5
            LSR.L  #8, D5
            LSR.L  #8, D5
            MOVE.L D5, -64(A6)
            MOVE.L #-1, -68(A6)           ;<ASSIGN, -1, t39>
            MOVE.L -64(A6), D6            ;<EQ, t38, t37, e9>
            MOVE.L -60(A6), D5
            CMP.L D5, D6
            BEQ E9

            MOVE.L #0, -68(A6)            ;<ASSIGN, 0, t39>
E9: 
            MOVE.L -68(A6), D6            ;<EQ, t39, 0, e10>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E10

            MOVE.L #160, -32(A6)          ;<ASSIGN, 160, t23>
            MOVE.L #54, -36(A6)           ;<ASSIGN, 54, t24>
            MOVE.L #210, -40(A6)          ;<ASSIGN, 210, t25>
            JMP E11                       ;<GOTO, e11>
E10: 
            MOVE.L #215, -32(A6)          ;<ASSIGN, 215, t23>
            MOVE.L #155, -36(A6)          ;<ASSIGN, 155, t24>
            MOVE.L #235, -40(A6)          ;<ASSIGN, 235, t25>
E11: 
            MOVE.L -32(A6), -(A7)         ;<PARAM, t23>
            MOVE.L -36(A6), -(A7)         ;<PARAM, t24>
            MOVE.L -40(A6), -(A7)         ;<PARAM, t25>
            MOVE.L #14, -(A7)             ;<PARAM, 14>
            MOVE.L -28(A6), -(A7)         ;<PARAM, t22>
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            JSR SETTXTPR                  ;<CALL, f1>
            ADD.L #24, A7
            MOVE.L A6, A1                 ;<OUTPUT, t21>
            ADDA.L #-24, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -8(A6), D6             ;<ADD, t18, 1, t40>
            MOVE.L #1, D5
            ADD.L D6, D5
            MOVE.L D5, -72(A6)
            MOVE.L -72(A6), -8(A6)        ;<ASSIGN, t40, t18>

            JMP E6                        ;<GOTO, e6>
E7: 
            MOVE.L -4(A6), D6             ;<ADD, t17, 1, t41>
            MOVE.L #1, D5
            ADD.L D6, D5
            MOVE.L D5, -76(A6)
            MOVE.L -76(A6), -4(A6)        ;<ASSIGN, t41, t17>

            MOVE.W #$0000,-78(A6)
            MOVE.L A6, A1                 ;<OUTPUTLN, t42>
            ADDA.L #-78, A1
            MOVE.L #13, D0
            TRAP #15
            JMP E3                        ;<GOTO, e3>
E4: 
            MOVE.L A6, A7                 ;<RET, f3(pyramid)>
            MOVE.L (A7)+, A6
            RTS
F4: 
            MOVE.L A6, -(A7)              ;<PMB, f4(cyclone)>
            MOVE.L A7, A6
            SUB.L #128, A7
            MOVE.L #6, -4(A6)             ;<ASSIGN, 6, t26>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #14, -(A7)             ;<PARAM, 14>
            MOVE.L -4(A6), -(A7)          ;<PARAM, t26>
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            JSR SETTXTPR                  ;<CALL, f1>
            ADD.L #24, A7
            MOVE.L #$496e7472,-40(A6)
            MOVE.L #$6f647563,-36(A6)
            MOVE.L #$6520756e,-32(A6)
            MOVE.L #$20656e74,-28(A6)
            MOVE.L #$65726f20,-24(A6)
            MOVE.L #$656e7472,-20(A6)
            MOVE.L #$65203120,-16(A6)
            MOVE.L #$79203136,-12(A6)
            MOVE.L #$3a200000,-8(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t43>
            ADDA.L #-40, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L #4, D0                 ;<READ_INT, t44>
            TRAP #15
            MOVE.L D1, -44(A6)
            MOVE.L -44(A6), -48(A6)       ;<ASSIGN, t44, t27>

            MOVE.L #-1, -52(A6)           ;<ASSIGN, -1, t45>
            MOVE.L -48(A6), D6            ;<GT, t27, 16, e12>
            MOVE.L #16, D5
            CMP.L D5, D6
            BGT E12

            MOVE.L #0, -52(A6)            ;<ASSIGN, 0, t45>
E12: 
            MOVE.L #-1, -56(A6)           ;<ASSIGN, -1, t46>
            MOVE.L -48(A6), D6            ;<LE, t27, 0, e13>
            MOVE.L #0, D5
            CMP.L D5, D6
            BLE E13

            MOVE.L #0, -56(A6)            ;<ASSIGN, 0, t46>
E13: 
            MOVE.L -56(A6), D6            ;<OR, t46, t45, t47>
            MOVE.L -52(A6), D5
            OR.L D6, D5
            MOVE.L D5, -60(A6)
            MOVE.L -60(A6), D6            ;<EQ, t47, 0, e14>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E14

            MOVE.L #$4efa6d65,-80(A6)
            MOVE.L #$726f2069,-76(A6)
            MOVE.L #$6e76e16c,-72(A6)
            MOVE.L #$69646f20,-68(A6)
            MOVE.L #$3a200000,-64(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t48>
            ADDA.L #-80, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -48(A6), D1            ;<OUTPUT, t27>
            MOVE.L #3, D0
            TRAP #15
            MOVE.L #$2e20506f,-100(A6)
            MOVE.L #$72206465,-96(A6)
            MOVE.L #$66656374,-92(A6)
            MOVE.L #$6f206e20,-88(A6)
            MOVE.L #$3d203800,-84(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t49>
            ADDA.L #-100, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.W #$0000,-102(A6)
            MOVE.L A6, A1                 ;<OUTPUTLN, t50>
            ADDA.L #-102, A1
            MOVE.L #13, D0
            TRAP #15
            MOVE.L #8, -48(A6)            ;<ASSIGN, 8, t27>
E14: 
            MOVE.L #$506972e1,-116(A6)
            MOVE.L #$6d696465,-112(A6)
            MOVE.L #$20646520,-108(A6)
            MOVE.W #$0000,-104(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t51>
            ADDA.L #-116, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -48(A6), D1            ;<OUTPUT, t27>
            MOVE.L #3, D0
            TRAP #15
            MOVE.L #$206e6976,-126(A6)
            MOVE.L #$656c6573,-122(A6)
            MOVE.W #$0000,-118(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t52>
            ADDA.L #-126, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.W #$0000,-128(A6)
            MOVE.L A6, A1                 ;<OUTPUTLN, t53>
            ADDA.L #-128, A1
            MOVE.L #13, D0
            TRAP #15
            MOVE.L -48(A6), -(A7)         ;<PARAM, t27>
            JSR F3                        ;<CALL, f3>
            ADD.L #4, A7
            MOVE.L A6, A7                 ;<RET, f4(cyclone)>
            MOVE.L (A7)+, A6
            RTS

START:      MOVE.L A7, A6
            JSR F4
            SIMHALT
            END START
