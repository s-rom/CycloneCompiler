            ORG $1000
            INCLUDE "../../68LIB/CYCLONE.X68"
F1: 
            MOVE.L A6, -(A7)              ;<PMB, f1(cyclone)>
            MOVE.L A7, A6
            SUB.L #258, A7
            MOVE.L #6, -4(A6)             ;<ASSIGN, 6, t10>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #12, -(A7)             ;<PARAM, 12>
            MOVE.L -4(A6), -(A7)          ;<PARAM, t10>
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            JSR SETTXTPR                  ;<CALL, f0>
            ADD.L #24, A7
            MOVE.L #$48656c6c,-18(A6)
            MOVE.L #$6f2c2057,-14(A6)
            MOVE.L #$6f726c64,-10(A6)
            MOVE.W #$2100,-6(A6)
            MOVE.L A6, A1                 ;<ASSIGN, t13, t11>
            MOVE.L A6, A2
            ADDA #-32, A1
            ADDA #-18, A2
            JSR STRCPY
            MOVE.L #$FFFFFFFF,-38(A6)
            MOVE.W #$FFFF,-34(A6)
            MOVE.B #$00, -33(A6)
            MOVE.L #$4d45544f,-98(A6)
            MOVE.L #$444f2031,-94(A6)
            MOVE.L #$202d2061,-90(A6)
            MOVE.L #$7369676e,-86(A6)
            MOVE.L #$616369f3,-82(A6)
            MOVE.L #$6e20696d,-78(A6)
            MOVE.L #$706ced63,-74(A6)
            MOVE.L #$6974613a,-70(A6)
            MOVE.L #$20737472,-66(A6)
            MOVE.L #$696e6720,-62(A6)
            MOVE.L #$6d736720,-58(A6)
            MOVE.L #$3d204865,-54(A6)
            MOVE.L #$6c6c6f2c,-50(A6)
            MOVE.L #$20576f72,-46(A6)
            MOVE.L #$6c642100,-42(A6)
            MOVE.L A6, A1                 ;<OUTPUTLN, t14>
            ADDA.L #-98, A1
            MOVE.L #13, D0
            TRAP #15
            MOVE.L #$4d45544f,-146(A6)
            MOVE.L #$444f2032,-142(A6)
            MOVE.L #$202d2061,-138(A6)
            MOVE.L #$7369676e,-134(A6)
            MOVE.L #$616369f3,-130(A6)
            MOVE.L #$6e206578,-126(A6)
            MOVE.L #$706ced63,-122(A6)
            MOVE.L #$6974613a,-118(A6)
            MOVE.L #$20737472,-114(A6)
            MOVE.L #$696e6720,-110(A6)
            MOVE.L #$6d73675b,-106(A6)
            MOVE.L #$355d0000,-102(A6)
            MOVE.L A6, A1                 ;<OUTPUTLN, t15>
            ADDA.L #-146, A1
            MOVE.L #13, D0
            TRAP #15
            MOVE.L #$4f706572,-178(A6)
            MOVE.L #$6163696f,-174(A6)
            MOVE.L #$6e207065,-170(A6)
            MOVE.L #$726d6974,-166(A6)
            MOVE.L #$6964613a,-162(A6)
            MOVE.L #$20737263,-158(A6)
            MOVE.L #$203d206d,-154(A6)
            MOVE.L #$73670000,-150(A6)
            MOVE.L A6, A1                 ;<OUTPUTLN, t16>
            ADDA.L #-178, A1
            MOVE.L #13, D0
            TRAP #15
            MOVE.L #$2d2d2d2d,-212(A6)
            MOVE.L #$2d2d2d2d,-208(A6)
            MOVE.L #$2d2d2d2d,-204(A6)
            MOVE.L #$2d2d2d2d,-200(A6)
            MOVE.L #$2d2d2d2d,-196(A6)
            MOVE.L #$2d2d2d2d,-192(A6)
            MOVE.L #$2d2d2d2d,-188(A6)
            MOVE.L #$2d2d2d2d,-184(A6)
            MOVE.W #$0000,-180(A6)
            MOVE.L A6, A1                 ;<OUTPUTLN, t17>
            ADDA.L #-212, A1
            MOVE.L #13, D0
            TRAP #15
            MOVE.L A6, A1                 ;<ASSIGN, t11, t12>
            MOVE.L A6, A2
            ADDA #-38, A1
            ADDA #-32, A2
            JSR STRCPY
            MOVE.L #$62797465,-234(A6)
            MOVE.L #$73286d73,-230(A6)
            MOVE.L #$67293a20,-226(A6)
            MOVE.L #$31342c20,-222(A6)
            MOVE.L #$6d73673a,-218(A6)
            MOVE.W #$2000,-214(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t18>
            ADDA.L #-234, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L A6, A1                 ;<OUTPUTLN, t11>
            ADDA.L #-32, A1
            MOVE.L #13, D0
            TRAP #15
            MOVE.L #$62797465,-258(A6)
            MOVE.L #$73286473,-254(A6)
            MOVE.L #$74293a20,-250(A6)
            MOVE.L #$352b312c,-246(A6)
            MOVE.L #$20647374,-242(A6)
            MOVE.L #$3a200000,-238(A6)
            MOVE.L A6, A1                 ;<OUTPUT, t19>
            ADDA.L #-258, A1
            MOVE.L #14, D0
            TRAP #15
            MOVE.L A6, A1                 ;<OUTPUTLN, t12>
            ADDA.L #-38, A1
            MOVE.L #13, D0
            TRAP #15
            MOVE.L A6, A7                 ;<RET, f1(cyclone)>
            MOVE.L (A7)+, A6
            RTS

START:      MOVE.L A7, A6
            JSR F1
            SIMHALT
            END START
