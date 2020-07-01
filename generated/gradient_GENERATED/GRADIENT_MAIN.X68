            ORG $1000
            INCLUDE "../../68LIB/CYCLONE.X68"
F11: 
            MOVE.L A6, -(A7)              ;<PMB, f11(draw_board)>
            MOVE.L A7, A6
            SUB.L #124, A7
            MOVE.L 8(A6), -4(A6)          ;<ASSIGN, t35, t36>

            MOVE.L -4(A6), -8(A6)         ;<ASSIGN, t36, t37>

            MOVE.L 12(A6), D5             ;<DIV, t33, t36, t49>
            MOVE.L -4(A6), D6
            DIVS D6, D5
            AND.L #$0000FFFF, D5
            MOVE.L D5, -12(A6)
            MOVE.L -12(A6), -16(A6)       ;<ASSIGN, t49, t38>

            MOVE.L #255, D5               ;<DIV, 255, t35, t50>
            MOVE.L 8(A6), D6
            DIVS D6, D5
            AND.L #$0000FFFF, D5
            MOVE.L D5, -20(A6)
            MOVE.L -20(A6), -24(A6)       ;<ASSIGN, t50, t39>

            MOVE.L #0, -28(A6)            ;<ASSIGN, 0, t40>
E0: 
            MOVE.L #-1, D6                ;<EQ, -1, 0, e1>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E1

            MOVE.L #0, -(A7)              ;<PARAM, 0>
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            JSR SETSTRK                   ;<CALL, f3>
            ADD.L #12, A7
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            MOVE.L 12(A6), -(A7)          ;<PARAM, t33>
            MOVE.L 16(A6), -(A7)          ;<PARAM, t34>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            JSR SETSTRK                   ;<CALL, f3>
            ADD.L #12, A7
            MOVE.L -28(A6), D5            ;<MOD, t40, 3, t51>
            MOVE.L #3, D6
            DIVS D6, D5
            LSR.L  #8, D5
            LSR.L  #8, D5
            MOVE.L D5, -44(A6)
            MOVE.L -44(A6), -48(A6)       ;<ASSIGN, t51, t44>

            MOVE.L #0, -52(A6)            ;<ASSIGN, 0, t45>
E2: 
            MOVE.L #-1, -56(A6)           ;<ASSIGN, -1, t52>
            MOVE.L -52(A6), D6            ;<LT, t45, t36, e4>
            MOVE.L -4(A6), D5
            CMP.L D5, D6
            BLT E4

            MOVE.L #0, -56(A6)            ;<ASSIGN, 0, t52>
E4: 
            MOVE.L -56(A6), D6            ;<EQ, t52, 0, e3>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E3

            MOVE.L #0, -60(A6)            ;<ASSIGN, 0, t46>
E5: 
            MOVE.L #-1, -64(A6)           ;<ASSIGN, -1, t53>
            MOVE.L -60(A6), D6            ;<LT, t46, t37, e7>
            MOVE.L -8(A6), D5
            CMP.L D5, D6
            BLT E7

            MOVE.L #0, -64(A6)            ;<ASSIGN, 0, t53>
E7: 
            MOVE.L -64(A6), D6            ;<EQ, t53, 0, e6>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E6

            MOVE.L #-1, -68(A6)           ;<ASSIGN, -1, t54>
            MOVE.L -48(A6), D6            ;<EQ, t44, 0, e8>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E8

            MOVE.L #0, -68(A6)            ;<ASSIGN, 0, t54>
E8: 
            MOVE.L -68(A6), D6            ;<EQ, t54, 0, e9>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E9

            MOVE.L -52(A6), D6            ;<MULT, t45, t39, t55>
            MOVE.L -24(A6), D5
            MULS D6, D5
            MOVE.L D5, -72(A6)
            MOVE.L -72(A6), -(A7)         ;<PARAM, t55>
            MOVE.L -60(A6), D6            ;<MULT, t46, t39, t56>
            MOVE.L -24(A6), D5
            MULS D6, D5
            MOVE.L D5, -76(A6)
            MOVE.L -76(A6), -(A7)         ;<PARAM, t56>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7
            JMP E10                       ;<GOTO, e10>
E9: 
            MOVE.L #-1, -80(A6)           ;<ASSIGN, -1, t57>
            MOVE.L -48(A6), D6            ;<EQ, t44, 1, e11>
            MOVE.L #1, D5
            CMP.L D5, D6
            BEQ E11

            MOVE.L #0, -80(A6)            ;<ASSIGN, 0, t57>
E11: 
            MOVE.L -80(A6), D6            ;<EQ, t57, 0, e12>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E12

            MOVE.L 8(A6), D6              ;<SUB, t35, t46, t58>
            MOVE.L -60(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -84(A6)
            MOVE.L -84(A6), D6            ;<MULT, t58, t39, t59>
            MOVE.L -24(A6), D5
            MULS D6, D5
            MOVE.L D5, -88(A6)
            MOVE.L -88(A6), -(A7)         ;<PARAM, t59>
            MOVE.L 8(A6), D6              ;<SUB, t35, t45, t60>
            MOVE.L -52(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -92(A6)
            MOVE.L -92(A6), D6            ;<MULT, t60, t39, t61>
            MOVE.L -24(A6), D5
            MULS D6, D5
            MOVE.L D5, -96(A6)
            MOVE.L -96(A6), -(A7)         ;<PARAM, t61>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7
            JMP E13                       ;<GOTO, e13>
E12: 
            MOVE.L -60(A6), D6            ;<MULT, t46, t39, t62>
            MOVE.L -24(A6), D5
            MULS D6, D5
            MOVE.L D5, -100(A6)
            MOVE.L -100(A6), -(A7)        ;<PARAM, t62>
            MOVE.L -52(A6), D6            ;<MULT, t45, t39, t63>
            MOVE.L -24(A6), D5
            MULS D6, D5
            MOVE.L D5, -104(A6)
            MOVE.L -104(A6), -(A7)        ;<PARAM, t63>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7
E13: 
E10: 
            MOVE.L -60(A6), D6            ;<MULT, t46, t38, t64>
            MOVE.L -16(A6), D5
            MULS D6, D5
            MOVE.L D5, -108(A6)
            MOVE.L -108(A6), -(A7)        ;<PARAM, t64>
            MOVE.L -52(A6), D6            ;<MULT, t45, t38, t65>
            MOVE.L -16(A6), D5
            MULS D6, D5
            MOVE.L D5, -112(A6)
            MOVE.L -112(A6), -(A7)        ;<PARAM, t65>
            MOVE.L -16(A6), -(A7)         ;<PARAM, t38>
            MOVE.L -16(A6), -(A7)         ;<PARAM, t38>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L -60(A6), D6            ;<ADD, t46, 1, t66>
            MOVE.L #1, D5
            ADD.L D6, D5
            MOVE.L D5, -116(A6)
            MOVE.L -116(A6), -60(A6)      ;<ASSIGN, t66, t46>

            JMP E5                        ;<GOTO, e5>
E6: 
            MOVE.L -52(A6), D6            ;<ADD, t45, 1, t67>
            MOVE.L #1, D5
            ADD.L D6, D5
            MOVE.L D5, -120(A6)
            MOVE.L -120(A6), -52(A6)      ;<ASSIGN, t67, t45>

            JMP E2                        ;<GOTO, e2>
E3: 
            JSR DBDRAW                    ;<CALL, f9>
            ADD.L #0, A7
            MOVE.L #500, -(A7)            ;<PARAM, 500>
            JSR DELAY                     ;<CALL, f10>
            ADD.L #4, A7
            MOVE.L -28(A6), D6            ;<ADD, t40, 1, t68>
            MOVE.L #1, D5
            ADD.L D6, D5
            MOVE.L D5, -124(A6)
            MOVE.L -124(A6), -28(A6)      ;<ASSIGN, t68, t40>

            JMP E0                        ;<GOTO, e0>
E1: 
            MOVE.L A6, A7                 ;<RET, f11(draw_board)>
            MOVE.L (A7)+, A6
            RTS
F12: 
            MOVE.L A6, -(A7)              ;<PMB, f12(cyclone)>
            MOVE.L A7, A6
            SUB.L #8, A7
            MOVE.L #640, -4(A6)           ;<ASSIGN, 640, t47>
            MOVE.L -4(A6), -8(A6)         ;<ASSIGN, t47, t48>

            MOVE.L -4(A6), -(A7)          ;<PARAM, t47>
            MOVE.L -8(A6), -(A7)          ;<PARAM, t48>
            JSR INITSCRN                  ;<CALL, f2>
            ADD.L #8, A7
            JSR DBENABLE                  ;<CALL, f8>
            ADD.L #0, A7
            MOVE.L -4(A6), -(A7)          ;<PARAM, t47>
            MOVE.L -8(A6), -(A7)          ;<PARAM, t48>
            MOVE.L #16, -(A7)             ;<PARAM, 16>
            JSR F11                       ;<CALL, f11>
            ADD.L #12, A7
            MOVE.L A6, A7                 ;<RET, f12(cyclone)>
            MOVE.L (A7)+, A6
            RTS

START:      MOVE.L A7, A6
            JSR F12
            SIMHALT
            END START
