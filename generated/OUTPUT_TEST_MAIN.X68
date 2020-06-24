            ORG $1000
            INCLUDE "../68LIB/PRNTLIB.X68"
            INCLUDE "../68LIB/STRLIB.X68"
F2: 
            MOVE.L A6, -(A7)              ;<PMB, f2(cyclone)>
            MOVE.L A7, A6
            SUB.L #74, A7

            MOVE.L #6, D6                 ;<ASSIGN, 6, t15>
            MOVE.L D6, -4(A6)
            MOVE.L -4(A6), D6             ;<ASSIGN, t15, t13>
            MOVE.L D6, -8(A6)
            MOVE.L #255, D6               ;<ASSIGN, 255, t16>
            MOVE.L D6, -12(A6)
            MOVE.L -12(A6), D6            ;<PARAM, t16>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t17>
            MOVE.L D6, -16(A6)
            MOVE.L -16(A6), D6            ;<PARAM, t17>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t18>
            MOVE.L D6, -20(A6)
            MOVE.L -20(A6), D6            ;<PARAM, t18>
            MOVE.L D6, -(A7)
            MOVE.L #14, D6                ;<ASSIGN, 14, t19>
            MOVE.L D6, -24(A6)
            MOVE.L -24(A6), D6            ;<PARAM, t19>
            MOVE.L D6, -(A7)
            MOVE.L -8(A6), D6             ;<PARAM, t13>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t20>
            MOVE.L D6, -28(A6)
            MOVE.L -28(A6), D6            ;<PARAM, t20>
            MOVE.L D6, -(A7)
            JSR SETTXTPR                  ;<CALL, f1>
            ADD.L #24, A7

            MOVE.L #8, D6                 ;<ASSIGN, 8, t21>
            MOVE.L D6, -32(A6)
            MOVE.L -32(A6), D6            ;<ASSIGN, t21, t14>
            MOVE.L D6, -36(A6)
            MOVE.L #$506972e1,-50(A6)
            MOVE.L #$6d696465,-46(A6)
            MOVE.L #$20646520,-42(A6)
            MOVE.W #$0000,-38(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t22>
            ADDA.L #-50, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L -36(A6), D1            ;<OUTPUT, t14>
            MOVE.L #3, D0
            TRAP #15
            MOVE.L #$206e6976,-60(A6)
            MOVE.L #$656c6573,-56(A6)
            MOVE.W #$0000,-52(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t23>
            ADDA.L #-60, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L #$434f4e53,-72(A6)
            MOVE.L #$4f4c4153,-68(A6)
            MOVE.L #$20280000,-64(A6)
            MOVE.L A6, A1                 ;<OUTPUTLN, t24>
            ADDA.L #-72, A1
            MOVE.L #13, D0
            TRAP #15
            MOVE.L -8(A6), D1             ;<OUTPUTLN, t13>
            MOVE.L #3, D0
            TRAP #15
            JSR NEWLN

            MOVE.W #$2900,-74(A6)
            MOVE.L A6, A1                 ;<OUTPUTLN, t25>
            ADDA.L #-74, A1
            MOVE.L #13, D0
            TRAP #15
            MOVE.L A6, A7                 ;<RET, f2(cyclone)>
            MOVE.L (A7)+, A6
            RTS

START:      MOVE.L A7, A6
            JSR F2
            SIMHALT
            END START
