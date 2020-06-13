            ORG $1000
E0: 
                                          ;<PMB, e0(cyclone)>

            MOVE.L #6, D6                 ;<ASSIGN, 6, t5>
            MOVE.L D6, -4(A7)
            MOVE.L -4(A7), D6             ;<ASSIGN, t5, t4>
            MOVE.L D6, -6(A7)
            MOVE.L A7, A1                 ;<OUTPUT, t4>
            ADDA.L #-6, A1
            MOVE.L #14, D0
            TRAP #15
            RTS

START:      JSR E0
            SIMHALT
            END START
