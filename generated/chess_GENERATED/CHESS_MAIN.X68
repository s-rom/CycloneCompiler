            ORG $1000
            INCLUDE "../../68LIB/CYCLONE.X68"
F6: 
            MOVE.L A6, -(A7)              ;<PMB, f6(draw_chessboard)>
            MOVE.L A7, A6
            SUB.L #68, A7
            MOVE.L 8(A6), -4(A6)          ;<ASSIGN, t27, t28>

            MOVE.L -4(A6), -8(A6)         ;<ASSIGN, t28, t29>

            MOVE.L 12(A6), D5             ;<DIV, t25, t28, t37>
            MOVE.L -4(A6), D6
            DIVS D6, D5
            AND.L #$0000FFFF, D5
            MOVE.L D5, -12(A6)
            MOVE.L -12(A6), -16(A6)       ;<ASSIGN, t37, t30>

            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            JSR SETSTRK                   ;<CALL, f3>
            ADD.L #12, A7
            MOVE.L #0, -20(A6)            ;<ASSIGN, 0, t31>
E0: 
            MOVE.L #-1, -24(A6)           ;<ASSIGN, -1, t38>
            MOVE.L -20(A6), D6            ;<LT, t31, t28, e2>
            MOVE.L -4(A6), D5
            CMP.L D5, D6
            BLT E2

            MOVE.L #0, -24(A6)            ;<ASSIGN, 0, t38>
E2: 
            MOVE.L -24(A6), D6            ;<EQ, t38, 0, e1>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E1

            MOVE.L #0, -28(A6)            ;<ASSIGN, 0, t32>
E3: 
            MOVE.L #-1, -32(A6)           ;<ASSIGN, -1, t39>
            MOVE.L -28(A6), D6            ;<LT, t32, t29, e5>
            MOVE.L -8(A6), D5
            CMP.L D5, D6
            BLT E5

            MOVE.L #0, -32(A6)            ;<ASSIGN, 0, t39>
E5: 
            MOVE.L -32(A6), D6            ;<EQ, t39, 0, e4>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E4

            MOVE.L -20(A6), D5            ;<MOD, t31, 2, t40>
            MOVE.L #2, D6
            DIVS D6, D5
            LSR.L  #8, D5
            LSR.L  #8, D5
            MOVE.L D5, -36(A6)
            MOVE.L -28(A6), D5            ;<MOD, t32, 2, t41>
            MOVE.L #2, D6
            DIVS D6, D5
            LSR.L  #8, D5
            LSR.L  #8, D5
            MOVE.L D5, -40(A6)
            MOVE.L #-1, -44(A6)           ;<ASSIGN, -1, t42>
            MOVE.L -40(A6), D6            ;<EQ, t41, t40, e6>
            MOVE.L -36(A6), D5
            CMP.L D5, D6
            BEQ E6

            MOVE.L #0, -44(A6)            ;<ASSIGN, 0, t42>
E6: 
            MOVE.L -44(A6), D6            ;<EQ, t42, 0, e7>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E7

            MOVE.L -28(A6), D6            ;<MULT, t32, t30, t43>
            MOVE.L -16(A6), D5
            MULS D6, D5
            MOVE.L D5, -48(A6)
            MOVE.L -48(A6), -52(A6)       ;<ASSIGN, t43, t33>

            MOVE.L -20(A6), D6            ;<MULT, t31, t30, t44>
            MOVE.L -16(A6), D5
            MULS D6, D5
            MOVE.L D5, -56(A6)
            MOVE.L -56(A6), -60(A6)       ;<ASSIGN, t44, t34>

            MOVE.L -52(A6), -(A7)         ;<PARAM, t33>
            MOVE.L -60(A6), -(A7)         ;<PARAM, t34>
            MOVE.L -16(A6), -(A7)         ;<PARAM, t30>
            MOVE.L -16(A6), -(A7)         ;<PARAM, t30>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
E7: 
            MOVE.L -28(A6), D6            ;<ADD, t32, 1, t45>
            MOVE.L #1, D5
            ADD.L D6, D5
            MOVE.L D5, -64(A6)
            MOVE.L -64(A6), -28(A6)       ;<ASSIGN, t45, t32>

            JMP E3                        ;<GOTO, e3>
E4: 
            MOVE.L -20(A6), D6            ;<ADD, t31, 1, t46>
            MOVE.L #1, D5
            ADD.L D6, D5
            MOVE.L D5, -68(A6)
            MOVE.L -68(A6), -20(A6)       ;<ASSIGN, t46, t31>

            JMP E0                        ;<GOTO, e0>
E1: 
            MOVE.L A6, A7                 ;<RET, f6(draw_chessboard)>
            MOVE.L (A7)+, A6
            RTS
F7: 
            MOVE.L A6, -(A7)              ;<PMB, f7(cyclone)>
            MOVE.L A7, A6
            SUB.L #8, A7
            MOVE.L #640, -4(A6)           ;<ASSIGN, 640, t35>
            MOVE.L -4(A6), -8(A6)         ;<ASSIGN, t35, t36>

            MOVE.L -4(A6), -(A7)          ;<PARAM, t35>
            MOVE.L -8(A6), -(A7)          ;<PARAM, t36>
            JSR INITSCRN                  ;<CALL, f2>
            ADD.L #8, A7
            MOVE.L -4(A6), -(A7)          ;<PARAM, t35>
            MOVE.L -8(A6), -(A7)          ;<PARAM, t36>
            MOVE.L #8, -(A7)              ;<PARAM, 8>
            JSR F6                        ;<CALL, f6>
            ADD.L #8, A7
            MOVE.L A6, A7                 ;<RET, f7(cyclone)>
            MOVE.L (A7)+, A6
            RTS

START:      MOVE.L A7, A6
            JSR F7
            SIMHALT
            END START
