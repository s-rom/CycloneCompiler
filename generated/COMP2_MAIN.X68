            ORG $1000
            INCLUDE "../68LIB/PRNTLIB.X68"
E0: 
                                          ;<PMB, e0(cyclone)>

            MOVE.L #$4573746f,-22(A7)
            MOVE.L #$20746572,-18(A7)
            MOVE.L #$6d696e61,-14(A7)
            MOVE.L #$20656e20,-10(A7)
            MOVE.L #$6ced6e69,-6(A7)
            MOVE.W #$6100,-2(A7)
            MOVE.L A7, A1                 ;<OUTPUTLN, t4>
            ADDA.L #-22, A1
            MOVE.L #13, D0
            TRAP #15
            MOVE.L #0, D6                 ;<ASSIGN, 0, t5>
            MOVE.L D6, -26(A7)
            MOVE.L -26(A7), D1            ;<OUTPUTLN, t5>
            JSR PRNTBOLN

            MOVE.L #8, D6                 ;<ASSIGN, 8, t6>
            MOVE.L D6, -30(A7)
            MOVE.L -30(A7), D1            ;<OUTPUT, t6>
            MOVE.L #3, D0
            TRAP #15
            MOVE.L #$3a20486f,-38(A7)
            MOVE.L #$6c610000,-34(A7)
            MOVE.L A7, A1                 ;<OUTPUT, t7>
            ADDA.L #-38, A1
            MOVE.L #14, D0
            TRAP #15
            RTS

START:      JSR E0
            SIMHALT
            END START
