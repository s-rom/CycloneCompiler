            ORG $1000
            INCLUDE "../68LIB/PRNTLIB.X68"
            INCLUDE "../68LIB/STRLIB.X68"
E0: 
            MOVE.L A6, -(A7)              ;<PMB, e0(cyclone)>
            MOVE.L A7, A6
            SUB.L #74, A7

            MOVE.L #$2020204e,-54(A6)
            MOVE.L #$6f207465,-50(A6)
            MOVE.L #$20766f79,-46(A6)
            MOVE.L #$2061206d,-42(A6)
            MOVE.L #$656e7469,-38(A6)
            MOVE.L #$722c2073,-34(A6)
            MOVE.L #$65207665,-30(A6)
            MOVE.L #$20626965,-26(A6)
            MOVE.L #$6e206672,-22(A6)
            MOVE.L #$6573636f,-18(A6)
            MOVE.L #$20657374,-14(A6)
            MOVE.L #$652063f3,-10(A6)
            MOVE.L #$6469676f,-6(A6)
            MOVE.W #$0000,-2(A6)
            MOVE.L A6, A1                 ;<OUTPUTLN, t4>
            ADDA.L #-54, A1
            MOVE.L #13, D0
            TRAP #15
            MOVE.L #$2020204d,-74(A6)
            MOVE.L #$6520616c,-70(A6)
            MOVE.L #$6567726f,-66(A6)
            MOVE.L #$20706f72,-62(A6)
            MOVE.L #$20656c00,-58(A6)
            MOVE.L A6, A1                 ;<OUTPUTLN, t5>
            ADDA.L #-74, A1
            MOVE.L #13, D0
            TRAP #15
            MOVE.L A6, A7                 ;<RET, e0(cyclone)>
            MOVE.L (A7)+, A6
            RTS

START:      MOVE.L A7, A6
            JSR E0
            SIMHALT
            END START
