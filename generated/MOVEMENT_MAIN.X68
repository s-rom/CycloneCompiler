            ORG $1000
            INCLUDE "../68LIB/PRNTLIB.X68"
            INCLUDE "../68LIB/STRLIB.X68"
F11: 
            MOVE.L A6, -(A7)              ;<PMB, f11(cyclone)>
            MOVE.L A7, A6
            SUB.L #212, A7

            MOVE.L #255, D6               ;<ASSIGN, 255, t39>
            MOVE.L D6, -4(A6)
            MOVE.L -4(A6), D6             ;<PARAM, t39>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t40>
            MOVE.L D6, -8(A6)
            MOVE.L -8(A6), D6             ;<PARAM, t40>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t41>
            MOVE.L D6, -12(A6)
            MOVE.L -12(A6), D6            ;<PARAM, t41>
            MOVE.L D6, -(A7)
            MOVE.L #14, D6                ;<ASSIGN, 14, t42>
            MOVE.L D6, -16(A6)
            MOVE.L -16(A6), D6            ;<PARAM, t42>
            MOVE.L D6, -(A7)
            MOVE.L #6, D6                 ;<ASSIGN, 6, t43>
            MOVE.L D6, -20(A6)
            MOVE.L -20(A6), D6            ;<PARAM, t43>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t44>
            MOVE.L D6, -24(A6)
            MOVE.L -24(A6), D6            ;<PARAM, t44>
            MOVE.L D6, -(A7)
            JSR SETTXTPR                  ;<CALL, f1>
            ADD.L #24, A7

            MOVE.L #640, D6               ;<ASSIGN, 640, t45>
            MOVE.L D6, -28(A6)
            MOVE.L -28(A6), D6            ;<ASSIGN, t45, t33>
            MOVE.L D6, -32(A6)
            MOVE.L -32(A6), D6            ;<ASSIGN, t33, t34>
            MOVE.L D6, -36(A6)
            MOVE.L #10, D6                ;<ASSIGN, 10, t46>
            MOVE.L D6, -40(A6)
            MOVE.L -40(A6), D6            ;<ASSIGN, t46, t35>
            MOVE.L D6, -44(A6)
            MOVE.L -32(A6), D6            ;<PARAM, t33>
            MOVE.L D6, -(A7)
            MOVE.L -36(A6), D6            ;<PARAM, t34>
            MOVE.L D6, -(A7)
            JSR INITSCRN                  ;<CALL, f2>
            ADD.L #8, A7

            JSR DBENABLE                  ;<CALL, f8>
            ADD.L #0, A7

            MOVE.L #2, D6                 ;<ASSIGN, 2, t47>
            MOVE.L D6, -48(A6)
            MOVE.L -36(A6), D5            ;<DIV, t34, t47, t48>
            MOVE.L -48(A6), D6
            DIVS D6, D5
            AND.L #$0000FFFF, D5
            MOVE.L D5, -52(A6)
            MOVE.L -52(A6), D6            ;<ASSIGN, t48, t36>
            MOVE.L D6, -56(A6)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t49>
            MOVE.L D6, -60(A6)
            MOVE.L -60(A6), D6            ;<ASSIGN, t49, t37>
            MOVE.L D6, -64(A6)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t50>
            MOVE.L D6, -68(A6)
            MOVE.L -68(A6), D6            ;<ASSIGN, t50, t38>
            MOVE.L D6, -72(A6)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t51>
            MOVE.L D6, -76(A6)
            MOVE.L -76(A6), D6            ;<PARAM, t51>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t52>
            MOVE.L D6, -80(A6)
            MOVE.L -80(A6), D6            ;<PARAM, t52>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t53>
            MOVE.L D6, -84(A6)
            MOVE.L -84(A6), D6            ;<PARAM, t53>
            MOVE.L D6, -(A7)
            JSR SETSTRK                   ;<CALL, f3>
            ADD.L #12, A7

E0: 
            MOVE.L #-1, D6                ;<ASSIGN, -1, t54>
            MOVE.L D6, -88(A6)
            MOVE.L -88(A6), D6            ;<EQ, t54, 0, e1>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E1

            MOVE.L #34, D6                ;<ASSIGN, 34, t55>
            MOVE.L D6, -92(A6)
            MOVE.L -92(A6), D6            ;<PARAM, t55>
            MOVE.L D6, -(A7)
            MOVE.L #32, D6                ;<ASSIGN, 32, t56>
            MOVE.L D6, -96(A6)
            MOVE.L -96(A6), D6            ;<PARAM, t56>
            MOVE.L D6, -(A7)
            MOVE.L #52, D6                ;<ASSIGN, 52, t57>
            MOVE.L D6, -100(A6)
            MOVE.L -100(A6), D6           ;<PARAM, t57>
            MOVE.L D6, -(A7)
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7

            MOVE.L #0, D6                 ;<ASSIGN, 0, t58>
            MOVE.L D6, -104(A6)
            MOVE.L -104(A6), D6           ;<PARAM, t58>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t59>
            MOVE.L D6, -108(A6)
            MOVE.L -108(A6), D6           ;<PARAM, t59>
            MOVE.L D6, -(A7)
            MOVE.L -32(A6), D6            ;<PARAM, t33>
            MOVE.L D6, -(A7)
            MOVE.L -36(A6), D6            ;<PARAM, t34>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #95, D6                ;<ASSIGN, 95, t60>
            MOVE.L D6, -112(A6)
            MOVE.L -112(A6), D6           ;<PARAM, t60>
            MOVE.L D6, -(A7)
            MOVE.L #205, D6               ;<ASSIGN, 205, t61>
            MOVE.L D6, -116(A6)
            MOVE.L -116(A6), D6           ;<PARAM, t61>
            MOVE.L D6, -(A7)
            MOVE.L #225, D6               ;<ASSIGN, 225, t62>
            MOVE.L D6, -120(A6)
            MOVE.L -120(A6), D6           ;<PARAM, t62>
            MOVE.L D6, -(A7)
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7

            MOVE.L -64(A6), D6            ;<SUB, t37, t35, t63>
            MOVE.L -44(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -124(A6)
            MOVE.L -124(A6), D6           ;<PARAM, t63>
            MOVE.L D6, -(A7)
            MOVE.L -56(A6), D6            ;<PARAM, t36>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t35>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t35>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #118, D6               ;<ASSIGN, 118, t64>
            MOVE.L D6, -128(A6)
            MOVE.L -128(A6), D6           ;<PARAM, t64>
            MOVE.L D6, -(A7)
            MOVE.L #66, D6                ;<ASSIGN, 66, t65>
            MOVE.L D6, -132(A6)
            MOVE.L -132(A6), D6           ;<PARAM, t65>
            MOVE.L D6, -(A7)
            MOVE.L #138, D6               ;<ASSIGN, 138, t66>
            MOVE.L D6, -136(A6)
            MOVE.L -136(A6), D6           ;<PARAM, t66>
            MOVE.L D6, -(A7)
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7

            MOVE.L -64(A6), D6            ;<PARAM, t37>
            MOVE.L D6, -(A7)
            MOVE.L -56(A6), D6            ;<PARAM, t36>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t35>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t35>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L -64(A6), D6            ;<SUB, t37, t35, t67>
            MOVE.L -44(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -140(A6)
            MOVE.L -140(A6), D6           ;<PARAM, t67>
            MOVE.L D6, -(A7)
            MOVE.L -56(A6), D6            ;<SUB, t36, t35, t68>
            MOVE.L -44(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -144(A6)
            MOVE.L -144(A6), D6           ;<PARAM, t68>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t35>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t35>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L -64(A6), D6            ;<SUB, t37, t35, t69>
            MOVE.L -44(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -148(A6)
            MOVE.L -148(A6), D6           ;<PARAM, t69>
            MOVE.L D6, -(A7)
            MOVE.L -56(A6), D6            ;<ADD, t36, t35, t70>
            MOVE.L -44(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -152(A6)
            MOVE.L -152(A6), D6           ;<PARAM, t70>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t35>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t35>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #2, D6                 ;<ASSIGN, 2, t71>
            MOVE.L D6, -156(A6)
            MOVE.L -156(A6), D6           ;<MULT, t71, t35, t72>
            MOVE.L -44(A6), D5
            MULS D6, D5
            MOVE.L D5, -160(A6)
            MOVE.L -64(A6), D6            ;<SUB, t37, t72, t73>
            MOVE.L -160(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -164(A6)
            MOVE.L -164(A6), D6           ;<PARAM, t73>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t74>
            MOVE.L D6, -168(A6)
            MOVE.L -168(A6), D6           ;<MULT, t74, t35, t75>
            MOVE.L -44(A6), D5
            MULS D6, D5
            MOVE.L D5, -172(A6)
            MOVE.L -56(A6), D6            ;<SUB, t36, t75, t76>
            MOVE.L -172(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -176(A6)
            MOVE.L -176(A6), D6           ;<PARAM, t76>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t35>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t35>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #2, D6                 ;<ASSIGN, 2, t77>
            MOVE.L D6, -180(A6)
            MOVE.L -180(A6), D6           ;<MULT, t77, t35, t78>
            MOVE.L -44(A6), D5
            MULS D6, D5
            MOVE.L D5, -184(A6)
            MOVE.L -64(A6), D6            ;<SUB, t37, t78, t79>
            MOVE.L -184(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -188(A6)
            MOVE.L -188(A6), D6           ;<PARAM, t79>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t80>
            MOVE.L D6, -192(A6)
            MOVE.L -192(A6), D6           ;<MULT, t80, t35, t81>
            MOVE.L -44(A6), D5
            MULS D6, D5
            MOVE.L D5, -196(A6)
            MOVE.L -56(A6), D6            ;<ADD, t36, t81, t82>
            MOVE.L -196(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -200(A6)
            MOVE.L -200(A6), D6           ;<PARAM, t82>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t35>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t35>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L -64(A6), D6            ;<ADD, t37, t38, t83>
            MOVE.L -72(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -204(A6)
            MOVE.L -204(A6), D5           ;<MOD, t83, t33, t84>
            MOVE.L -32(A6), D6
            DIVS D6, D5
            LSR.L  #8, D5
            LSR.L  #8, D5
            MOVE.L D5, -208(A6)
            MOVE.L -208(A6), D6           ;<ASSIGN, t84, t37>
            MOVE.L D6, -64(A6)
            JSR DBDRAW                    ;<CALL, f9>
            ADD.L #0, A7

            MOVE.L #33, D6                ;<ASSIGN, 33, t85>
            MOVE.L D6, -212(A6)
            MOVE.L -212(A6), D6           ;<PARAM, t85>
            MOVE.L D6, -(A7)
            JSR DELAY                     ;<CALL, f10>
            ADD.L #4, A7

            JMP E0                        ;<GOTO, e0>
E1: 
            MOVE.L A6, A7                 ;<RET, f11(cyclone)>
            MOVE.L (A7)+, A6
            RTS

START:      MOVE.L A7, A6
            JSR F11
            SIMHALT
            END START
