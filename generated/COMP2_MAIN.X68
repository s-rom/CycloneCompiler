            ORG $1000
E0: 
                                          ;<PMB, e0(cyclone)>

            MOVE.L #"Hola que tal", D6    ;<ASSIGN, "Hola que tal", t5>
            MOVE.L D6, -4(A7)
            MOVE.L -4(A7), D6             ;<ASSIGN, t5, t4>
            MOVE.L D6, -8(A7)
            RTS

START:      JSR E0
            SIMHALT
            END START
