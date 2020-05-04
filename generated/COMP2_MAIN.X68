            ORG $1000
E0: 
                                          ;<PMB, e0(add)>

            MOVE.L 8(A7), D6              ;<ADD, t4, t5, t9>
            MOVE.L 4(A7), D5
            ADD.L D6, D5
            MOVE.L D5, -4(A7)
            MOVE.L -4(A7), D6             ;<ASSIGN, t9, t6>
            MOVE.L D6, -8(A7)
            MOVE.L -8(A7), D7             ;<RET, t6, e0(add)>
            RTS
            RTS
E1: 
                                          ;<PMB, e1(cyclone)>

            MOVE.L #7, D6                 ;<ASSIGN, 7, t10>
            MOVE.L D6, -4(A7)
            MOVE.L -4(A7), D6             ;<ASSIGN, t10, t7>
            MOVE.L D6, -8(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t11>
            MOVE.L D6, -12(A7)
            MOVE.L -12(A7), D6            ;<ASSIGN, t11, t8>
            MOVE.L D6, -16(A7)
            MOVE.L -8(A7), D6             ;<PARAM, t7>
            MOVE.L D6, -(A7)
            MOVE.L -16(A7), D6            ;<PARAM, t8>
            MOVE.L D6, -(A7)
            JSR E0            ;<CALL, e0>

            RTS

START:      JSR E1
            SIMHALT
            END START
