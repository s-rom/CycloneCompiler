            ORG $1000
            INCLUDE "../68LIB/PRNTLIB.X68"
            INCLUDE "../68LIB/STRLIB.X68"
F2: 
            MOVE.L A6, -(A7)              ;<PMB, f2(print_n_spaces)>
            MOVE.L A7, A6
            SUB.L #26, A7

            MOVE.W #$2000,-2(A6)
            MOVE.L A6, A1                 ;<ASSIGN, t28, t14>
            MOVE.L A6, A2
            ADDA #-4, A1
            ADDA #-2, A2
            JSR STRCPY
            MOVE.L #0, D6                 ;<ASSIGN, 0, t29>
            MOVE.L D6, -8(A6)
            MOVE.L -8(A6), D6             ;<ASSIGN, t29, t15>
            MOVE.L D6, -12(A6)
E0: 
            MOVE.L #-1, D6                ;<ASSIGN, -1, t30>
            MOVE.L D6, -16(A6)
            MOVE.L -12(A6), D6            ;<LT, t15, t13, e2>
            MOVE.L 8(A6), D5
            CMP.L D5, D6
            BLT E2

            MOVE.L #0, D6                 ;<ASSIGN, 0, t30>
            MOVE.L D6, -16(A6)
E2: 
            MOVE.L -16(A6), D6            ;<EQ, t30, 0, e1>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E1

            MOVE.W #$2000,-18(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t31>
            ADDA.L #-18, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L #1, D6                 ;<ASSIGN, 1, t32>
            MOVE.L D6, -22(A6)
            MOVE.L -12(A6), D6            ;<ADD, t15, t32, t33>
            MOVE.L -22(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -26(A6)
            MOVE.L -26(A6), D6            ;<ASSIGN, t33, t15>
            MOVE.L D6, -12(A6)
            JMP E0                        ;<GOTO, e0>
E1: 
            MOVE.L A6, A7                 ;<RET, f2(print_n_spaces)>
            MOVE.L (A7)+, A6
            RTS
F3: 
            MOVE.L A6, -(A7)              ;<PMB, f3(pyramid)>
            MOVE.L A7, A6
            SUB.L #158, A7

            MOVE.L #0, D6                 ;<ASSIGN, 0, t34>
            MOVE.L D6, -4(A6)
            MOVE.L -4(A6), D6             ;<ASSIGN, t34, t17>
            MOVE.L D6, -8(A6)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t35>
            MOVE.L D6, -16(A6)
            MOVE.L -16(A6), D6            ;<ASSIGN, t35, t19>
            MOVE.L D6, -20(A6)
            MOVE.L #$6f200000,-28(A6)
            MOVE.L A6, A1                 ;<ASSIGN, t36, t21>
            MOVE.L A6, A2
            ADDA #-32, A1
            ADDA #-28, A2
            JSR STRCPY
            MOVE.L #6, D6                 ;<ASSIGN, 6, t37>
            MOVE.L D6, -36(A6)
            MOVE.L -36(A6), D6            ;<ASSIGN, t37, t22>
            MOVE.L D6, -40(A6)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t38>
            MOVE.L D6, -44(A6)
            MOVE.L -44(A6), D6            ;<ASSIGN, t38, t23>
            MOVE.L D6, -48(A6)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t39>
            MOVE.L D6, -52(A6)
            MOVE.L -52(A6), D6            ;<ASSIGN, t39, t24>
            MOVE.L D6, -56(A6)
            MOVE.L #255, D6               ;<ASSIGN, 255, t40>
            MOVE.L D6, -60(A6)
            MOVE.L -60(A6), D6            ;<ASSIGN, t40, t25>
            MOVE.L D6, -64(A6)
E3: 
            MOVE.L #-1, D6                ;<ASSIGN, -1, t41>
            MOVE.L D6, -68(A6)
            MOVE.L -8(A6), D6             ;<LE, t17, t16, e5>
            MOVE.L 8(A6), D5
            CMP.L D5, D6
            BLE E5

            MOVE.L #0, D6                 ;<ASSIGN, 0, t41>
            MOVE.L D6, -68(A6)
E5: 
            MOVE.L -68(A6), D6            ;<EQ, t41, 0, e4>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E4

            MOVE.L 8(A6), D6              ;<SUB, t16, t17, t42>
            MOVE.L -8(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -72(A6)
            MOVE.L -72(A6), D6            ;<ASSIGN, t42, t19>
            MOVE.L D6, -20(A6)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t43>
            MOVE.L D6, -76(A6)
            MOVE.L -20(A6), D6            ;<ADD, t19, t43, t44>
            MOVE.L -76(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -80(A6)
            MOVE.L -80(A6), D6            ;<PARAM, t44>
            MOVE.L D6, -(A7)
            JSR F2                        ;<CALL, f2>
            ADD.L #4, A7

            MOVE.L #0, D6                 ;<ASSIGN, 0, t45>
            MOVE.L D6, -84(A6)
            MOVE.L -84(A6), D6            ;<ASSIGN, t45, t18>
            MOVE.L D6, -12(A6)
E6: 
            MOVE.L #-1, D6                ;<ASSIGN, -1, t46>
            MOVE.L D6, -88(A6)
            MOVE.L -12(A6), D6            ;<LT, t18, t17, e8>
            MOVE.L -8(A6), D5
            CMP.L D5, D6
            BLT E8

            MOVE.L #0, D6                 ;<ASSIGN, 0, t46>
            MOVE.L D6, -88(A6)
E8: 
            MOVE.L -88(A6), D6            ;<EQ, t46, 0, e7>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E7

            MOVE.L #2, D6                 ;<ASSIGN, 2, t47>
            MOVE.L D6, -92(A6)
            MOVE.L -12(A6), D5            ;<MOD, t18, t47, t48>
            MOVE.L -92(A6), D6
            DIVS D6, D5
            LSR.L  #8, D5
            LSR.L  #8, D5
            MOVE.L D5, -96(A6)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t49>
            MOVE.L D6, -100(A6)
            MOVE.L -8(A6), D5             ;<MOD, t17, t49, t50>
            MOVE.L -100(A6), D6
            DIVS D6, D5
            LSR.L  #8, D5
            LSR.L  #8, D5
            MOVE.L D5, -104(A6)
            MOVE.L #-1, D6                ;<ASSIGN, -1, t51>
            MOVE.L D6, -108(A6)
            MOVE.L -104(A6), D6           ;<EQ, t50, t48, e9>
            MOVE.L -96(A6), D5
            CMP.L D5, D6
            BEQ E9

            MOVE.L #0, D6                 ;<ASSIGN, 0, t51>
            MOVE.L D6, -108(A6)
E9: 
            MOVE.L -108(A6), D6           ;<EQ, t51, 0, e10>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E10

            MOVE.L #160, D6               ;<ASSIGN, 160, t52>
            MOVE.L D6, -112(A6)
            MOVE.L -112(A6), D6           ;<ASSIGN, t52, t23>
            MOVE.L D6, -48(A6)
            MOVE.L #54, D6                ;<ASSIGN, 54, t53>
            MOVE.L D6, -116(A6)
            MOVE.L -116(A6), D6           ;<ASSIGN, t53, t24>
            MOVE.L D6, -56(A6)
            MOVE.L #210, D6               ;<ASSIGN, 210, t54>
            MOVE.L D6, -120(A6)
            MOVE.L -120(A6), D6           ;<ASSIGN, t54, t25>
            MOVE.L D6, -64(A6)
            JMP E11                       ;<GOTO, e11>
E10: 
            MOVE.L #215, D6               ;<ASSIGN, 215, t55>
            MOVE.L D6, -124(A6)
            MOVE.L -124(A6), D6           ;<ASSIGN, t55, t23>
            MOVE.L D6, -48(A6)
            MOVE.L #155, D6               ;<ASSIGN, 155, t56>
            MOVE.L D6, -128(A6)
            MOVE.L -128(A6), D6           ;<ASSIGN, t56, t24>
            MOVE.L D6, -56(A6)
            MOVE.L #235, D6               ;<ASSIGN, 235, t57>
            MOVE.L D6, -132(A6)
            MOVE.L -132(A6), D6           ;<ASSIGN, t57, t25>
            MOVE.L D6, -64(A6)
E11: 
            MOVE.L -48(A6), D6            ;<PARAM, t23>
            MOVE.L D6, -(A7)
            MOVE.L -56(A6), D6            ;<PARAM, t24>
            MOVE.L D6, -(A7)
            MOVE.L -64(A6), D6            ;<PARAM, t25>
            MOVE.L D6, -(A7)
            MOVE.L #14, D6                ;<ASSIGN, 14, t58>
            MOVE.L D6, -136(A6)
            MOVE.L -136(A6), D6           ;<PARAM, t58>
            MOVE.L D6, -(A7)
            MOVE.L -40(A6), D6            ;<PARAM, t22>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t59>
            MOVE.L D6, -140(A6)
            MOVE.L -140(A6), D6           ;<PARAM, t59>
            MOVE.L D6, -(A7)
            JSR SETTXTPR                  ;<CALL, f1>
            ADD.L #24, A7

            MOVE.L A6, A1                 ;<OUTPUT, t21>
            ADDA.L #-32, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L #1, D6                 ;<ASSIGN, 1, t60>
            MOVE.L D6, -144(A6)
            MOVE.L -12(A6), D6            ;<ADD, t18, t60, t61>
            MOVE.L -144(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -148(A6)
            MOVE.L -148(A6), D6           ;<ASSIGN, t61, t18>
            MOVE.L D6, -12(A6)
            JMP E6                        ;<GOTO, e6>
E7: 
            MOVE.L #1, D6                 ;<ASSIGN, 1, t62>
            MOVE.L D6, -152(A6)
            MOVE.L -8(A6), D6             ;<ADD, t17, t62, t63>
            MOVE.L -152(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -156(A6)
            MOVE.L -156(A6), D6           ;<ASSIGN, t63, t17>
            MOVE.L D6, -8(A6)
            MOVE.W #$0000,-158(A6)
            MOVE.L A6, A1                 ;<OUTPUTLN, t64>
            ADDA.L #-158, A1
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
            SUB.L #164, A7

            MOVE.L #6, D6                 ;<ASSIGN, 6, t65>
            MOVE.L D6, -4(A6)
            MOVE.L -4(A6), D6             ;<ASSIGN, t65, t26>
            MOVE.L D6, -8(A6)
            MOVE.L #255, D6               ;<ASSIGN, 255, t66>
            MOVE.L D6, -12(A6)
            MOVE.L -12(A6), D6            ;<PARAM, t66>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t67>
            MOVE.L D6, -16(A6)
            MOVE.L -16(A6), D6            ;<PARAM, t67>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t68>
            MOVE.L D6, -20(A6)
            MOVE.L -20(A6), D6            ;<PARAM, t68>
            MOVE.L D6, -(A7)
            MOVE.L #14, D6                ;<ASSIGN, 14, t69>
            MOVE.L D6, -24(A6)
            MOVE.L -24(A6), D6            ;<PARAM, t69>
            MOVE.L D6, -(A7)
            MOVE.L -8(A6), D6             ;<PARAM, t26>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t70>
            MOVE.L D6, -28(A6)
            MOVE.L -28(A6), D6            ;<PARAM, t70>
            MOVE.L D6, -(A7)
            JSR SETTXTPR                  ;<CALL, f1>
            ADD.L #24, A7

            MOVE.L #$496e7472,-64(A6)
            MOVE.L #$6f647563,-60(A6)
            MOVE.L #$6520756e,-56(A6)
            MOVE.L #$20656e74,-52(A6)
            MOVE.L #$65726f20,-48(A6)
            MOVE.L #$656e7472,-44(A6)
            MOVE.L #$65203120,-40(A6)
            MOVE.L #$79203136,-36(A6)
            MOVE.L #$3a200000,-32(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t71>
            ADDA.L #-64, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L #4, D0                 ;<READ_INT, t72>
            TRAP #15
            MOVE.L D1, -68(A6)

            MOVE.L -68(A6), D6            ;<ASSIGN, t72, t27>
            MOVE.L D6, -72(A6)
            MOVE.L #16, D6                ;<ASSIGN, 16, t73>
            MOVE.L D6, -76(A6)
            MOVE.L #-1, D6                ;<ASSIGN, -1, t74>
            MOVE.L D6, -80(A6)
            MOVE.L -72(A6), D6            ;<GT, t27, t73, e12>
            MOVE.L -76(A6), D5
            CMP.L D5, D6
            BGT E12

            MOVE.L #0, D6                 ;<ASSIGN, 0, t74>
            MOVE.L D6, -80(A6)
E12: 
            MOVE.L #0, D6                 ;<ASSIGN, 0, t75>
            MOVE.L D6, -84(A6)
            MOVE.L #-1, D6                ;<ASSIGN, -1, t76>
            MOVE.L D6, -88(A6)
            MOVE.L -72(A6), D6            ;<LE, t27, t75, e13>
            MOVE.L -84(A6), D5
            CMP.L D5, D6
            BLE E13

            MOVE.L #0, D6                 ;<ASSIGN, 0, t76>
            MOVE.L D6, -88(A6)
E13: 
            MOVE.L -88(A6), D6            ;<OR, t76, t74, t77>
            MOVE.L -80(A6), D5
            OR.L D6, D5
            MOVE.L D5, -92(A6)
            MOVE.L -92(A6), D6            ;<EQ, t77, 0, e14>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E14

            MOVE.L #$4efa6d65,-112(A6)
            MOVE.L #$726f2069,-108(A6)
            MOVE.L #$6e76e16c,-104(A6)
            MOVE.L #$69646f20,-100(A6)
            MOVE.L #$3a200000,-96(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t78>
            ADDA.L #-112, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -72(A6), D1            ;<OUTPUT, t27>
            MOVE.L #3, D0
            TRAP #15
            MOVE.L #$2e20506f,-132(A6)
            MOVE.L #$72206465,-128(A6)
            MOVE.L #$66656374,-124(A6)
            MOVE.L #$6f206e20,-120(A6)
            MOVE.L #$3d203800,-116(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t79>
            ADDA.L #-132, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.W #$0000,-134(A6)
            MOVE.L A6, A1                 ;<OUTPUTLN, t80>
            ADDA.L #-134, A1
            MOVE.L #13, D0
            TRAP #15
            MOVE.L #8, D6                 ;<ASSIGN, 8, t81>
            MOVE.L D6, -138(A6)
            MOVE.L -138(A6), D6           ;<ASSIGN, t81, t27>
            MOVE.L D6, -72(A6)
E14: 
            MOVE.L #$506972e1,-152(A6)
            MOVE.L #$6d696465,-148(A6)
            MOVE.L #$20646520,-144(A6)
            MOVE.W #$0000,-140(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t82>
            ADDA.L #-152, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -72(A6), D1            ;<OUTPUT, t27>
            MOVE.L #3, D0
            TRAP #15
            MOVE.L #$206e6976,-162(A6)
            MOVE.L #$656c6573,-158(A6)
            MOVE.W #$0000,-154(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t83>
            ADDA.L #-162, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.W #$0000,-164(A6)
            MOVE.L A6, A1                 ;<OUTPUTLN, t84>
            ADDA.L #-164, A1
            MOVE.L #13, D0
            TRAP #15
            MOVE.L -72(A6), D6            ;<PARAM, t27>
            MOVE.L D6, -(A7)
            JSR F3                        ;<CALL, f3>
            ADD.L #4, A7

            MOVE.L A6, A7                 ;<RET, f4(cyclone)>
            MOVE.L (A7)+, A6
            RTS

START:      MOVE.L A7, A6
            JSR F4
            SIMHALT
            END START
