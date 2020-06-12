            ORG $1000
E0: 
                                          ;<PMB, e0(cyclone)>

            MOVE.L #'abcd',-6(A7)
            MOVE.W #0,-2(A7)
            MOVE.W #''<<16,-2(A7)
            MOVE.L A7, A1
            ADDA.L #-6, A1
            MOVE.L #14, D0
            TRAP #15
            RTS

START:      JSR E0
            SIMHALT
            END START
