            ORG $1000
            INCLUDE "../68LIB/PRNTLIB.X68"
            INCLUDE "../68LIB/STRLIB.X68"
F6: 
            MOVE.L A6, -(A7)              ;<PMB, f6(draw_chessboard)>
            MOVE.L A7, A6
            SUB.L #116, A7

            MOVE.L 8(A6), D6              ;<ASSIGN, t27, t28>
            MOVE.L D6, -4(A6)
            MOVE.L -4(A6), D6             ;<ASSIGN, t28, t29>
            MOVE.L D6, -8(A6)
            MOVE.L 12(A6), D5             ;<DIV, t25, t28, t37>
            MOVE.L -4(A6), D6
            DIVS D6, D5
            AND.L #$0000FFFF, D5
            MOVE.L D5, -12(A6)
            MOVE.L -12(A6), D6            ;<ASSIGN, t37, t30>
            MOVE.L D6, -16(A6)
            MOVE.L #255, D6               ;<ASSIGN, 255, t38>
            MOVE.L D6, -20(A6)
            MOVE.L -20(A6), D6            ;<PARAM, t38>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t39>
            MOVE.L D6, -24(A6)
            MOVE.L -24(A6), D6            ;<PARAM, t39>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t40>
            MOVE.L D6, -28(A6)
            MOVE.L -28(A6), D6            ;<PARAM, t40>
            MOVE.L D6, -(A7)
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7

            MOVE.L #255, D6               ;<ASSIGN, 255, t41>
            MOVE.L D6, -32(A6)
            MOVE.L -32(A6), D6            ;<PARAM, t41>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t42>
            MOVE.L D6, -36(A6)
            MOVE.L -36(A6), D6            ;<PARAM, t42>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t43>
            MOVE.L D6, -40(A6)
            MOVE.L -40(A6), D6            ;<PARAM, t43>
            MOVE.L D6, -(A7)
            JSR SETSTRK                   ;<CALL, f3>
            ADD.L #12, A7

            MOVE.L #0, D6                 ;<ASSIGN, 0, t44>
            MOVE.L D6, -44(A6)
            MOVE.L -44(A6), D6            ;<ASSIGN, t44, t31>
            MOVE.L D6, -48(A6)
E0: 
            MOVE.L #-1, D6                ;<ASSIGN, -1, t45>
            MOVE.L D6, -52(A6)
            MOVE.L -48(A6), D6            ;<LT, t31, t28, e2>
            MOVE.L -4(A6), D5
            CMP.L D5, D6
            BLT E2

            MOVE.L #0, D6                 ;<ASSIGN, 0, t45>
            MOVE.L D6, -52(A6)
E2: 
            MOVE.L -52(A6), D6            ;<EQ, t45, 0, e1>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E1

            MOVE.L #0, D6                 ;<ASSIGN, 0, t46>
            MOVE.L D6, -56(A6)
            MOVE.L -56(A6), D6            ;<ASSIGN, t46, t32>
            MOVE.L D6, -60(A6)
E3: 
            MOVE.L #-1, D6                ;<ASSIGN, -1, t47>
            MOVE.L D6, -64(A6)
            MOVE.L -60(A6), D6            ;<LT, t32, t29, e5>
            MOVE.L -8(A6), D5
            CMP.L D5, D6
            BLT E5

            MOVE.L #0, D6                 ;<ASSIGN, 0, t47>
            MOVE.L D6, -64(A6)
E5: 
            MOVE.L -64(A6), D6            ;<EQ, t47, 0, e4>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E4

            MOVE.L #2, D6                 ;<ASSIGN, 2, t48>
            MOVE.L D6, -68(A6)
            MOVE.L -48(A6), D5            ;<MOD, t31, t48, t49>
            MOVE.L -68(A6), D6
            DIVS D6, D5
            LSR.L  #8, D5
            LSR.L  #8, D5
            MOVE.L D5, -72(A6)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t50>
            MOVE.L D6, -76(A6)
            MOVE.L -60(A6), D5            ;<MOD, t32, t50, t51>
            MOVE.L -76(A6), D6
            DIVS D6, D5
            LSR.L  #8, D5
            LSR.L  #8, D5
            MOVE.L D5, -80(A6)
            MOVE.L #-1, D6                ;<ASSIGN, -1, t52>
            MOVE.L D6, -84(A6)
            MOVE.L -80(A6), D6            ;<EQ, t51, t49, e6>
            MOVE.L -72(A6), D5
            CMP.L D5, D6
            BEQ E6

            MOVE.L #0, D6                 ;<ASSIGN, 0, t52>
            MOVE.L D6, -84(A6)
E6: 
            MOVE.L -84(A6), D6            ;<EQ, t52, 0, e7>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E7

            MOVE.L -60(A6), D6            ;<MULT, t32, t30, t53>
            MOVE.L -16(A6), D5
            MULS D6, D5
            MOVE.L D5, -88(A6)
            MOVE.L -88(A6), D6            ;<ASSIGN, t53, t33>
            MOVE.L D6, -92(A6)
            MOVE.L -48(A6), D6            ;<MULT, t31, t30, t54>
            MOVE.L -16(A6), D5
            MULS D6, D5
            MOVE.L D5, -96(A6)
            MOVE.L -96(A6), D6            ;<ASSIGN, t54, t34>
            MOVE.L D6, -100(A6)
            MOVE.L -92(A6), D6            ;<PARAM, t33>
            MOVE.L D6, -(A7)
            MOVE.L -100(A6), D6           ;<PARAM, t34>
            MOVE.L D6, -(A7)
            MOVE.L -16(A6), D6            ;<PARAM, t30>
            MOVE.L D6, -(A7)
            MOVE.L -16(A6), D6            ;<PARAM, t30>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

E7: 
            MOVE.L #1, D6                 ;<ASSIGN, 1, t55>
            MOVE.L D6, -104(A6)
            MOVE.L -60(A6), D6            ;<ADD, t32, t55, t56>
            MOVE.L -104(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -108(A6)
            MOVE.L -108(A6), D6           ;<ASSIGN, t56, t32>
            MOVE.L D6, -60(A6)
            JMP E3                        ;<GOTO, e3>
E4: 
            MOVE.L #1, D6                 ;<ASSIGN, 1, t57>
            MOVE.L D6, -112(A6)
            MOVE.L -48(A6), D6            ;<ADD, t31, t57, t58>
            MOVE.L -112(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -116(A6)
            MOVE.L -116(A6), D6           ;<ASSIGN, t58, t31>
            MOVE.L D6, -48(A6)
            JMP E0                        ;<GOTO, e0>
E1: 
            MOVE.L A6, A7                 ;<RET, f6(draw_chessboard)>
            MOVE.L (A7)+, A6
            RTS
F7: 
            MOVE.L A6, -(A7)              ;<PMB, f7(cyclone)>
            MOVE.L A7, A6
            SUB.L #16, A7

            MOVE.L #640, D6               ;<ASSIGN, 640, t59>
            MOVE.L D6, -4(A6)
            MOVE.L -4(A6), D6             ;<ASSIGN, t59, t35>
            MOVE.L D6, -8(A6)
            MOVE.L -8(A6), D6             ;<ASSIGN, t35, t36>
            MOVE.L D6, -12(A6)
            MOVE.L -8(A6), D6             ;<PARAM, t35>
            MOVE.L D6, -(A7)
            MOVE.L -12(A6), D6            ;<PARAM, t36>
            MOVE.L D6, -(A7)
            JSR INITSCRN                  ;<CALL, f2>
            ADD.L #8, A7

            MOVE.L -8(A6), D6             ;<PARAM, t35>
            MOVE.L D6, -(A7)
            MOVE.L -12(A6), D6            ;<PARAM, t36>
            MOVE.L D6, -(A7)
            MOVE.L #8, D6                 ;<ASSIGN, 8, t60>
            MOVE.L D6, -16(A6)
            MOVE.L -16(A6), D6            ;<PARAM, t60>
            MOVE.L D6, -(A7)
            JSR F6                        ;<CALL, f6>
            ADD.L #8, A7

            MOVE.L A6, A7                 ;<RET, f7(cyclone)>
            MOVE.L (A7)+, A6
            RTS

START:      MOVE.L A7, A6
            JSR F7
            SIMHALT
            END START
