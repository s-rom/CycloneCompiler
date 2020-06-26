            ORG $1000
            INCLUDE "../68LIB/PRNTLIB.X68"
            INCLUDE "../68LIB/STRLIB.X68"
F11: 
            MOVE.L A6, -(A7)              ;<PMB, f11(draw_board)>
            MOVE.L A7, A6
            SUB.L #228, A7

            MOVE.L 8(A6), D6              ;<ASSIGN, t35, t36>
            MOVE.L D6, -4(A6)
            MOVE.L -4(A6), D6             ;<ASSIGN, t36, t37>
            MOVE.L D6, -8(A6)
            MOVE.L 12(A6), D5             ;<DIV, t33, t36, t49>
            MOVE.L -4(A6), D6
            DIVS D6, D5
            AND.L #$0000FFFF, D5
            MOVE.L D5, -12(A6)
            MOVE.L -12(A6), D6            ;<ASSIGN, t49, t38>
            MOVE.L D6, -16(A6)
            MOVE.L #255, D6               ;<ASSIGN, 255, t50>
            MOVE.L D6, -20(A6)
            MOVE.L -20(A6), D5            ;<DIV, t50, t35, t51>
            MOVE.L 8(A6), D6
            DIVS D6, D5
            AND.L #$0000FFFF, D5
            MOVE.L D5, -24(A6)
            MOVE.L -24(A6), D6            ;<ASSIGN, t51, t39>
            MOVE.L D6, -28(A6)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t52>
            MOVE.L D6, -32(A6)
            MOVE.L -32(A6), D6            ;<ASSIGN, t52, t40>
            MOVE.L D6, -36(A6)
E0: 
            MOVE.L #-1, D6                ;<ASSIGN, -1, t53>
            MOVE.L D6, -52(A6)
            MOVE.L -52(A6), D6            ;<EQ, t53, 0, e1>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E1

            MOVE.L #0, D6                 ;<ASSIGN, 0, t54>
            MOVE.L D6, -56(A6)
            MOVE.L -56(A6), D6            ;<PARAM, t54>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t55>
            MOVE.L D6, -60(A6)
            MOVE.L -60(A6), D6            ;<PARAM, t55>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t56>
            MOVE.L D6, -64(A6)
            MOVE.L -64(A6), D6            ;<PARAM, t56>
            MOVE.L D6, -(A7)
            JSR SETSTRK                   ;<CALL, f3>
            ADD.L #12, A7

            MOVE.L #0, D6                 ;<ASSIGN, 0, t57>
            MOVE.L D6, -68(A6)
            MOVE.L -68(A6), D6            ;<PARAM, t57>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t58>
            MOVE.L D6, -72(A6)
            MOVE.L -72(A6), D6            ;<PARAM, t58>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t59>
            MOVE.L D6, -76(A6)
            MOVE.L -76(A6), D6            ;<PARAM, t59>
            MOVE.L D6, -(A7)
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7

            MOVE.L #0, D6                 ;<ASSIGN, 0, t60>
            MOVE.L D6, -80(A6)
            MOVE.L -80(A6), D6            ;<PARAM, t60>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t61>
            MOVE.L D6, -84(A6)
            MOVE.L -84(A6), D6            ;<PARAM, t61>
            MOVE.L D6, -(A7)
            MOVE.L 12(A6), D6             ;<PARAM, t33>
            MOVE.L D6, -(A7)
            MOVE.L 16(A6), D6             ;<PARAM, t34>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #255, D6               ;<ASSIGN, 255, t62>
            MOVE.L D6, -88(A6)
            MOVE.L -88(A6), D6            ;<PARAM, t62>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t63>
            MOVE.L D6, -92(A6)
            MOVE.L -92(A6), D6            ;<PARAM, t63>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t64>
            MOVE.L D6, -96(A6)
            MOVE.L -96(A6), D6            ;<PARAM, t64>
            MOVE.L D6, -(A7)
            JSR SETSTRK                   ;<CALL, f3>
            ADD.L #12, A7

            MOVE.L #3, D6                 ;<ASSIGN, 3, t65>
            MOVE.L D6, -100(A6)
            MOVE.L -36(A6), D5            ;<MOD, t40, t65, t66>
            MOVE.L -100(A6), D6
            DIVS D6, D5
            LSR.L  #8, D5
            LSR.L  #8, D5
            MOVE.L D5, -104(A6)
            MOVE.L -104(A6), D6           ;<ASSIGN, t66, t44>
            MOVE.L D6, -108(A6)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t67>
            MOVE.L D6, -112(A6)
            MOVE.L -112(A6), D6           ;<ASSIGN, t67, t45>
            MOVE.L D6, -116(A6)
E2: 
            MOVE.L #-1, D6                ;<ASSIGN, -1, t68>
            MOVE.L D6, -120(A6)
            MOVE.L -116(A6), D6           ;<LT, t45, t36, e4>
            MOVE.L -4(A6), D5
            CMP.L D5, D6
            BLT E4

            MOVE.L #0, D6                 ;<ASSIGN, 0, t68>
            MOVE.L D6, -120(A6)
E4: 
            MOVE.L -120(A6), D6           ;<EQ, t68, 0, e3>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E3

            MOVE.L #0, D6                 ;<ASSIGN, 0, t69>
            MOVE.L D6, -124(A6)
            MOVE.L -124(A6), D6           ;<ASSIGN, t69, t46>
            MOVE.L D6, -128(A6)
E5: 
            MOVE.L #-1, D6                ;<ASSIGN, -1, t70>
            MOVE.L D6, -132(A6)
            MOVE.L -128(A6), D6           ;<LT, t46, t37, e7>
            MOVE.L -8(A6), D5
            CMP.L D5, D6
            BLT E7

            MOVE.L #0, D6                 ;<ASSIGN, 0, t70>
            MOVE.L D6, -132(A6)
E7: 
            MOVE.L -132(A6), D6           ;<EQ, t70, 0, e6>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E6

            MOVE.L #0, D6                 ;<ASSIGN, 0, t71>
            MOVE.L D6, -136(A6)
            MOVE.L #-1, D6                ;<ASSIGN, -1, t72>
            MOVE.L D6, -140(A6)
            MOVE.L -108(A6), D6           ;<EQ, t44, t71, e8>
            MOVE.L -136(A6), D5
            CMP.L D5, D6
            BEQ E8

            MOVE.L #0, D6                 ;<ASSIGN, 0, t72>
            MOVE.L D6, -140(A6)
E8: 
            MOVE.L -140(A6), D6           ;<EQ, t72, 0, e9>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E9

            MOVE.L -116(A6), D6           ;<MULT, t45, t39, t73>
            MOVE.L -28(A6), D5
            MULS D6, D5
            MOVE.L D5, -144(A6)
            MOVE.L -144(A6), D6           ;<PARAM, t73>
            MOVE.L D6, -(A7)
            MOVE.L -128(A6), D6           ;<MULT, t46, t39, t74>
            MOVE.L -28(A6), D5
            MULS D6, D5
            MOVE.L D5, -148(A6)
            MOVE.L -148(A6), D6           ;<PARAM, t74>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t75>
            MOVE.L D6, -152(A6)
            MOVE.L -152(A6), D6           ;<PARAM, t75>
            MOVE.L D6, -(A7)
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7

            JMP E10                       ;<GOTO, e10>
E9: 
            MOVE.L #1, D6                 ;<ASSIGN, 1, t76>
            MOVE.L D6, -156(A6)
            MOVE.L #-1, D6                ;<ASSIGN, -1, t77>
            MOVE.L D6, -160(A6)
            MOVE.L -108(A6), D6           ;<EQ, t44, t76, e11>
            MOVE.L -156(A6), D5
            CMP.L D5, D6
            BEQ E11

            MOVE.L #0, D6                 ;<ASSIGN, 0, t77>
            MOVE.L D6, -160(A6)
E11: 
            MOVE.L -160(A6), D6           ;<EQ, t77, 0, e12>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E12

            MOVE.L 8(A6), D6              ;<SUB, t35, t46, t78>
            MOVE.L -128(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -164(A6)
            MOVE.L -164(A6), D6           ;<MULT, t78, t39, t79>
            MOVE.L -28(A6), D5
            MULS D6, D5
            MOVE.L D5, -168(A6)
            MOVE.L -168(A6), D6           ;<PARAM, t79>
            MOVE.L D6, -(A7)
            MOVE.L 8(A6), D6              ;<SUB, t35, t45, t80>
            MOVE.L -116(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -172(A6)
            MOVE.L -172(A6), D6           ;<MULT, t80, t39, t81>
            MOVE.L -28(A6), D5
            MULS D6, D5
            MOVE.L D5, -176(A6)
            MOVE.L -176(A6), D6           ;<PARAM, t81>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t82>
            MOVE.L D6, -180(A6)
            MOVE.L -180(A6), D6           ;<PARAM, t82>
            MOVE.L D6, -(A7)
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7

            JMP E13                       ;<GOTO, e13>
E12: 
            MOVE.L -128(A6), D6           ;<MULT, t46, t39, t83>
            MOVE.L -28(A6), D5
            MULS D6, D5
            MOVE.L D5, -184(A6)
            MOVE.L -184(A6), D6           ;<PARAM, t83>
            MOVE.L D6, -(A7)
            MOVE.L -116(A6), D6           ;<MULT, t45, t39, t84>
            MOVE.L -28(A6), D5
            MULS D6, D5
            MOVE.L D5, -188(A6)
            MOVE.L -188(A6), D6           ;<PARAM, t84>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t85>
            MOVE.L D6, -192(A6)
            MOVE.L -192(A6), D6           ;<PARAM, t85>
            MOVE.L D6, -(A7)
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7

E13: 
E10: 
            MOVE.L -128(A6), D6           ;<MULT, t46, t38, t86>
            MOVE.L -16(A6), D5
            MULS D6, D5
            MOVE.L D5, -196(A6)
            MOVE.L -196(A6), D6           ;<PARAM, t86>
            MOVE.L D6, -(A7)
            MOVE.L -116(A6), D6           ;<MULT, t45, t38, t87>
            MOVE.L -16(A6), D5
            MULS D6, D5
            MOVE.L D5, -200(A6)
            MOVE.L -200(A6), D6           ;<PARAM, t87>
            MOVE.L D6, -(A7)
            MOVE.L -16(A6), D6            ;<PARAM, t38>
            MOVE.L D6, -(A7)
            MOVE.L -16(A6), D6            ;<PARAM, t38>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #1, D6                 ;<ASSIGN, 1, t88>
            MOVE.L D6, -204(A6)
            MOVE.L -128(A6), D6           ;<ADD, t46, t88, t89>
            MOVE.L -204(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -208(A6)
            MOVE.L -208(A6), D6           ;<ASSIGN, t89, t46>
            MOVE.L D6, -128(A6)
            JMP E5                        ;<GOTO, e5>
E6: 
            MOVE.L #1, D6                 ;<ASSIGN, 1, t90>
            MOVE.L D6, -212(A6)
            MOVE.L -116(A6), D6           ;<ADD, t45, t90, t91>
            MOVE.L -212(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -216(A6)
            MOVE.L -216(A6), D6           ;<ASSIGN, t91, t45>
            MOVE.L D6, -116(A6)
            JMP E2                        ;<GOTO, e2>
E3: 
            JSR DBDRAW                    ;<CALL, f9>
            ADD.L #0, A7

            MOVE.L #500, D6               ;<ASSIGN, 500, t92>
            MOVE.L D6, -220(A6)
            MOVE.L -220(A6), D6           ;<PARAM, t92>
            MOVE.L D6, -(A7)
            JSR DELAY                     ;<CALL, f10>
            ADD.L #4, A7

            MOVE.L #1, D6                 ;<ASSIGN, 1, t93>
            MOVE.L D6, -224(A6)
            MOVE.L -36(A6), D6            ;<ADD, t40, t93, t94>
            MOVE.L -224(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -228(A6)
            MOVE.L -228(A6), D6           ;<ASSIGN, t94, t40>
            MOVE.L D6, -36(A6)
            JMP E0                        ;<GOTO, e0>
E1: 
            MOVE.L A6, A7                 ;<RET, f11(draw_board)>
            MOVE.L (A7)+, A6
            RTS
F12: 
            MOVE.L A6, -(A7)              ;<PMB, f12(cyclone)>
            MOVE.L A7, A6
            SUB.L #16, A7

            MOVE.L #640, D6               ;<ASSIGN, 640, t95>
            MOVE.L D6, -4(A6)
            MOVE.L -4(A6), D6             ;<ASSIGN, t95, t47>
            MOVE.L D6, -8(A6)
            MOVE.L -8(A6), D6             ;<ASSIGN, t47, t48>
            MOVE.L D6, -12(A6)
            MOVE.L -8(A6), D6             ;<PARAM, t47>
            MOVE.L D6, -(A7)
            MOVE.L -12(A6), D6            ;<PARAM, t48>
            MOVE.L D6, -(A7)
            JSR INITSCRN                  ;<CALL, f2>
            ADD.L #8, A7

            JSR DBENABLE                  ;<CALL, f8>
            ADD.L #0, A7

            MOVE.L -8(A6), D6             ;<PARAM, t47>
            MOVE.L D6, -(A7)
            MOVE.L -12(A6), D6            ;<PARAM, t48>
            MOVE.L D6, -(A7)
            MOVE.L #16, D6                ;<ASSIGN, 16, t96>
            MOVE.L D6, -16(A6)
            MOVE.L -16(A6), D6            ;<PARAM, t96>
            MOVE.L D6, -(A7)
            JSR F11                       ;<CALL, f11>
            ADD.L #12, A7

            MOVE.L A6, A7                 ;<RET, f12(cyclone)>
            MOVE.L (A7)+, A6
            RTS

START:      MOVE.L A7, A6
            JSR F12
            SIMHALT
            END START
