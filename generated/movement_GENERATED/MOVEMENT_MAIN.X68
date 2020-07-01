            ORG $1000
            INCLUDE "../../68LIB/CYCLONE.X68"
F11: 
            MOVE.L A6, -(A7)              ;<PMB, f11(draw_background)>
            MOVE.L A7, A6
            SUB.L #4, A7
            MOVE.L #34, -(A7)             ;<PARAM, 34>
            MOVE.L #32, -(A7)             ;<PARAM, 32>
            MOVE.L #52, -(A7)             ;<PARAM, 52>
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            MOVE.L 8(A6), -(A7)           ;<PARAM, t33>
            MOVE.L 12(A6), -(A7)          ;<PARAM, t34>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #3, -4(A6)             ;<ASSIGN, 3, t35>
            MOVE.L #196, -(A7)            ;<PARAM, 196>
            MOVE.L #194, -(A7)            ;<PARAM, 194>
            MOVE.L #100, -(A7)            ;<PARAM, 100>
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7
            MOVE.L #513, -(A7)            ;<PARAM, 513>
            MOVE.L #67, -(A7)             ;<PARAM, 67>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #176, -(A7)            ;<PARAM, 176>
            MOVE.L #232, -(A7)            ;<PARAM, 232>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #420, -(A7)            ;<PARAM, 420>
            MOVE.L #133, -(A7)            ;<PARAM, 133>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #196, -(A7)            ;<PARAM, 196>
            MOVE.L #203, -(A7)            ;<PARAM, 203>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #136, -(A7)            ;<PARAM, 136>
            MOVE.L #78, -(A7)             ;<PARAM, 78>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #458, -(A7)            ;<PARAM, 458>
            MOVE.L #116, -(A7)            ;<PARAM, 116>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #221, -(A7)            ;<PARAM, 221>
            MOVE.L #26, -(A7)             ;<PARAM, 26>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #587, -(A7)            ;<PARAM, 587>
            MOVE.L #330, -(A7)            ;<PARAM, 330>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #20, -(A7)             ;<PARAM, 20>
            MOVE.L #75, -(A7)             ;<PARAM, 75>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #578, -(A7)            ;<PARAM, 578>
            MOVE.L #492, -(A7)            ;<PARAM, 492>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #85, -(A7)             ;<PARAM, 85>
            MOVE.L #140, -(A7)            ;<PARAM, 140>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #71, -(A7)             ;<PARAM, 71>
            MOVE.L #517, -(A7)            ;<PARAM, 517>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #252, -(A7)            ;<PARAM, 252>
            MOVE.L #52, -(A7)             ;<PARAM, 52>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #438, -(A7)            ;<PARAM, 438>
            MOVE.L #46, -(A7)             ;<PARAM, 46>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #135, -(A7)            ;<PARAM, 135>
            MOVE.L #107, -(A7)            ;<PARAM, 107>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #283, -(A7)            ;<PARAM, 283>
            MOVE.L #137, -(A7)            ;<PARAM, 137>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #162, -(A7)            ;<PARAM, 162>
            MOVE.L #112, -(A7)            ;<PARAM, 112>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #414, -(A7)            ;<PARAM, 414>
            MOVE.L #478, -(A7)            ;<PARAM, 478>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #564, -(A7)            ;<PARAM, 564>
            MOVE.L #42, -(A7)             ;<PARAM, 42>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #596, -(A7)            ;<PARAM, 596>
            MOVE.L #369, -(A7)            ;<PARAM, 369>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #452, -(A7)            ;<PARAM, 452>
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #171, -(A7)            ;<PARAM, 171>
            MOVE.L #65, -(A7)             ;<PARAM, 65>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #226, -(A7)            ;<PARAM, 226>
            MOVE.L #213, -(A7)            ;<PARAM, 213>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #333, -(A7)            ;<PARAM, 333>
            MOVE.L #160, -(A7)            ;<PARAM, 160>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #96, -(A7)             ;<PARAM, 96>
            MOVE.L #294, -(A7)            ;<PARAM, 294>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #96, -(A7)             ;<PARAM, 96>
            MOVE.L #430, -(A7)            ;<PARAM, 430>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #486, -(A7)            ;<PARAM, 486>
            MOVE.L #180, -(A7)            ;<PARAM, 180>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #7, -(A7)              ;<PARAM, 7>
            MOVE.L #476, -(A7)            ;<PARAM, 476>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #537, -(A7)            ;<PARAM, 537>
            MOVE.L #507, -(A7)            ;<PARAM, 507>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #51, -(A7)             ;<PARAM, 51>
            MOVE.L #208, -(A7)            ;<PARAM, 208>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #38, -(A7)             ;<PARAM, 38>
            MOVE.L #437, -(A7)            ;<PARAM, 437>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #399, -(A7)            ;<PARAM, 399>
            MOVE.L #329, -(A7)            ;<PARAM, 329>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #151, -(A7)            ;<PARAM, 151>
            MOVE.L #22, -(A7)             ;<PARAM, 22>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #134, -(A7)            ;<PARAM, 134>
            MOVE.L #583, -(A7)            ;<PARAM, 583>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #587, -(A7)            ;<PARAM, 587>
            MOVE.L #389, -(A7)            ;<PARAM, 389>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #43, -(A7)             ;<PARAM, 43>
            MOVE.L #204, -(A7)            ;<PARAM, 204>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #524, -(A7)            ;<PARAM, 524>
            MOVE.L #328, -(A7)            ;<PARAM, 328>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #189, -(A7)            ;<PARAM, 189>
            MOVE.L #263, -(A7)            ;<PARAM, 263>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #440, -(A7)            ;<PARAM, 440>
            MOVE.L #334, -(A7)            ;<PARAM, 334>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #27, -(A7)             ;<PARAM, 27>
            MOVE.L #326, -(A7)            ;<PARAM, 326>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #201, -(A7)            ;<PARAM, 201>
            MOVE.L #582, -(A7)            ;<PARAM, 582>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #386, -(A7)            ;<PARAM, 386>
            MOVE.L #441, -(A7)            ;<PARAM, 441>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            MOVE.L #4, -(A7)              ;<PARAM, 4>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #35, -(A7)             ;<PARAM, 35>
            MOVE.L #93, -(A7)             ;<PARAM, 93>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #126, -(A7)            ;<PARAM, 126>
            MOVE.L #365, -(A7)            ;<PARAM, 365>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #522, -(A7)            ;<PARAM, 522>
            MOVE.L #353, -(A7)            ;<PARAM, 353>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #530, -(A7)            ;<PARAM, 530>
            MOVE.L #117, -(A7)            ;<PARAM, 117>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #351, -(A7)            ;<PARAM, 351>
            MOVE.L #286, -(A7)            ;<PARAM, 286>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #537, -(A7)            ;<PARAM, 537>
            MOVE.L #309, -(A7)            ;<PARAM, 309>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #370, -(A7)            ;<PARAM, 370>
            MOVE.L #537, -(A7)            ;<PARAM, 537>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #138, -(A7)            ;<PARAM, 138>
            MOVE.L #140, -(A7)            ;<PARAM, 140>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #8, -(A7)              ;<PARAM, 8>
            MOVE.L #189, -(A7)            ;<PARAM, 189>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #279, -(A7)            ;<PARAM, 279>
            MOVE.L #53, -(A7)             ;<PARAM, 53>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #578, -(A7)            ;<PARAM, 578>
            MOVE.L #181, -(A7)            ;<PARAM, 181>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #372, -(A7)            ;<PARAM, 372>
            MOVE.L #155, -(A7)            ;<PARAM, 155>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #492, -(A7)            ;<PARAM, 492>
            MOVE.L #218, -(A7)            ;<PARAM, 218>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #517, -(A7)            ;<PARAM, 517>
            MOVE.L #512, -(A7)            ;<PARAM, 512>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #371, -(A7)            ;<PARAM, 371>
            MOVE.L #505, -(A7)            ;<PARAM, 505>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            MOVE.L #3, -(A7)              ;<PARAM, 3>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #449, -(A7)            ;<PARAM, 449>
            MOVE.L #148, -(A7)            ;<PARAM, 148>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            MOVE.L #2, -(A7)              ;<PARAM, 2>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #459, -(A7)            ;<PARAM, 459>
            MOVE.L #408, -(A7)            ;<PARAM, 408>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #1, -(A7)              ;<PARAM, 1>
            MOVE.L #297, -(A7)            ;<PARAM, 297>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            MOVE.L #5, -(A7)              ;<PARAM, 5>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L A6, A7                 ;<RET, f11(draw_background)>
            MOVE.L (A7)+, A6
            RTS
F12: 
            MOVE.L A6, -(A7)              ;<PMB, f12(cyclone)>
            MOVE.L A7, A6
            SUB.L #88, A7
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #255, -(A7)            ;<PARAM, 255>
            MOVE.L #14, -(A7)             ;<PARAM, 14>
            MOVE.L #6, -(A7)              ;<PARAM, 6>
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            JSR SETTXTPR                  ;<CALL, f1>
            ADD.L #24, A7
            MOVE.L #640, -4(A6)           ;<ASSIGN, 640, t36>
            MOVE.L -4(A6), -8(A6)         ;<ASSIGN, t36, t37>

            MOVE.L #10, -12(A6)           ;<ASSIGN, 10, t38>
            MOVE.L -4(A6), -(A7)          ;<PARAM, t36>
            MOVE.L -8(A6), -(A7)          ;<PARAM, t37>
            JSR INITSCRN                  ;<CALL, f2>
            ADD.L #8, A7
            JSR DBENABLE                  ;<CALL, f8>
            ADD.L #0, A7
            MOVE.L -8(A6), D5             ;<DIV, t37, 2, t42>
            MOVE.L #2, D6
            DIVS D6, D5
            AND.L #$0000FFFF, D5
            MOVE.L D5, -16(A6)
            MOVE.L -16(A6), -20(A6)       ;<ASSIGN, t42, t39>

            MOVE.L #0, -24(A6)            ;<ASSIGN, 0, t40>
            MOVE.L #5, -28(A6)            ;<ASSIGN, 5, t41>
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            MOVE.L #0, -(A7)              ;<PARAM, 0>
            JSR SETSTRK                   ;<CALL, f3>
            ADD.L #12, A7
E0: 
            MOVE.L #-1, D6                ;<EQ, -1, 0, e1>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E1

            MOVE.L -4(A6), -(A7)          ;<PARAM, t36>
            MOVE.L -8(A6), -(A7)          ;<PARAM, t37>
            JSR F11                       ;<CALL, f11>
            ADD.L #8, A7
            MOVE.L #95, -(A7)             ;<PARAM, 95>
            MOVE.L #205, -(A7)            ;<PARAM, 205>
            MOVE.L #225, -(A7)            ;<PARAM, 225>
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7
            MOVE.L -24(A6), D6            ;<SUB, t40, t38, t43>
            MOVE.L -12(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -32(A6)
            MOVE.L -32(A6), -(A7)         ;<PARAM, t43>
            MOVE.L -20(A6), -(A7)         ;<PARAM, t39>
            MOVE.L -12(A6), -(A7)         ;<PARAM, t38>
            MOVE.L -12(A6), -(A7)         ;<PARAM, t38>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #118, -(A7)            ;<PARAM, 118>
            MOVE.L #66, -(A7)             ;<PARAM, 66>
            MOVE.L #138, -(A7)            ;<PARAM, 138>
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7
            MOVE.L -24(A6), -(A7)         ;<PARAM, t40>
            MOVE.L -20(A6), -(A7)         ;<PARAM, t39>
            MOVE.L -12(A6), -(A7)         ;<PARAM, t38>
            MOVE.L -12(A6), -(A7)         ;<PARAM, t38>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L -24(A6), D6            ;<SUB, t40, t38, t44>
            MOVE.L -12(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -36(A6)
            MOVE.L -36(A6), -(A7)         ;<PARAM, t44>
            MOVE.L -20(A6), D6            ;<SUB, t39, t38, t45>
            MOVE.L -12(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -40(A6)
            MOVE.L -40(A6), -(A7)         ;<PARAM, t45>
            MOVE.L -12(A6), -(A7)         ;<PARAM, t38>
            MOVE.L -12(A6), -(A7)         ;<PARAM, t38>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L -24(A6), D6            ;<SUB, t40, t38, t46>
            MOVE.L -12(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -44(A6)
            MOVE.L -44(A6), -(A7)         ;<PARAM, t46>
            MOVE.L -20(A6), D6            ;<ADD, t39, t38, t47>
            MOVE.L -12(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -48(A6)
            MOVE.L -48(A6), -(A7)         ;<PARAM, t47>
            MOVE.L -12(A6), -(A7)         ;<PARAM, t38>
            MOVE.L -12(A6), -(A7)         ;<PARAM, t38>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #2, D6                 ;<MULT, 2, t38, t48>
            MOVE.L -12(A6), D5
            MULS D6, D5
            MOVE.L D5, -52(A6)
            MOVE.L -24(A6), D6            ;<SUB, t40, t48, t49>
            MOVE.L -52(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -56(A6)
            MOVE.L -56(A6), -(A7)         ;<PARAM, t49>
            MOVE.L #2, D6                 ;<MULT, 2, t38, t50>
            MOVE.L -12(A6), D5
            MULS D6, D5
            MOVE.L D5, -60(A6)
            MOVE.L -20(A6), D6            ;<SUB, t39, t50, t51>
            MOVE.L -60(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -64(A6)
            MOVE.L -64(A6), -(A7)         ;<PARAM, t51>
            MOVE.L -12(A6), -(A7)         ;<PARAM, t38>
            MOVE.L -12(A6), -(A7)         ;<PARAM, t38>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L #2, D6                 ;<MULT, 2, t38, t52>
            MOVE.L -12(A6), D5
            MULS D6, D5
            MOVE.L D5, -68(A6)
            MOVE.L -24(A6), D6            ;<SUB, t40, t52, t53>
            MOVE.L -68(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -72(A6)
            MOVE.L -72(A6), -(A7)         ;<PARAM, t53>
            MOVE.L #2, D6                 ;<MULT, 2, t38, t54>
            MOVE.L -12(A6), D5
            MULS D6, D5
            MOVE.L D5, -76(A6)
            MOVE.L -20(A6), D6            ;<ADD, t39, t54, t55>
            MOVE.L -76(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -80(A6)
            MOVE.L -80(A6), -(A7)         ;<PARAM, t55>
            MOVE.L -12(A6), -(A7)         ;<PARAM, t38>
            MOVE.L -12(A6), -(A7)         ;<PARAM, t38>
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7
            MOVE.L -24(A6), D6            ;<ADD, t40, t41, t56>
            MOVE.L -28(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -84(A6)
            MOVE.L -84(A6), D5            ;<MOD, t56, t36, t57>
            MOVE.L -4(A6), D6
            DIVS D6, D5
            LSR.L  #8, D5
            LSR.L  #8, D5
            MOVE.L D5, -88(A6)
            MOVE.L -88(A6), -24(A6)       ;<ASSIGN, t57, t40>

            JSR DBDRAW                    ;<CALL, f9>
            ADD.L #0, A7
            MOVE.L #33, -(A7)             ;<PARAM, 33>
            JSR DELAY                     ;<CALL, f10>
            ADD.L #4, A7
            JMP E0                        ;<GOTO, e0>
E1: 
            MOVE.L A6, A7                 ;<RET, f12(cyclone)>
            MOVE.L (A7)+, A6
            RTS

START:      MOVE.L A7, A6
            JSR F12
            SIMHALT
            END START
