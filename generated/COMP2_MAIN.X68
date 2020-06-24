            ORG $1000
            INCLUDE "../68LIB/PRNTLIB.X68"
            INCLUDE "../68LIB/STRLIB.X68"
F0: 
            MOVE.L A6, -(A7)              ;<PMB, f0(cyclone)>
            MOVE.L A7, A6
            SUB.L #44, A7

            MOVE.L #$496e7472,-22(A6)
            MOVE.L #$6f647563,-18(A6)
            MOVE.L #$6520756e,-14(A6)
            MOVE.L #$206efa6d,-10(A6)
            MOVE.L #$65726f3a,-6(A6)
            MOVE.W #$2000,-2(A6)
            MOVE.L A6, A1                 ;<OUTPUTLN, t5>
            ADDA.L #-22, A1
            MOVE.L #13, D0
            TRAP #15
            MOVE.L #4, D0                 ;<READ_INT, t6>
            TRAP #15
            MOVE.L D1, -26(A6)

            MOVE.L -26(A6), D6            ;<ASSIGN, t6, t4>
            MOVE.L D6, -30(A6)
            MOVE.L #$496e7472,-44(A6)
            MOVE.L #$6f647563,-40(A6)
            MOVE.L #$69646f3a,-36(A6)
            MOVE.W #$2000,-32(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t7>
            ADDA.L #-44, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -30(A6), D1            ;<OUTPUT, t4>
            MOVE.L #3, D0
            TRAP #15
            MOVE.L A6, A7                 ;<RET, f0(cyclone)>
            MOVE.L (A7)+, A6
            RTS

START:      MOVE.L A7, A6
            JSR F0
            SIMHALT
            END START
