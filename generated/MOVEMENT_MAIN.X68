            ORG $1000
            INCLUDE "../68LIB/PRNTLIB.X68"
            INCLUDE "../68LIB/STRLIB.X68"
F11: 
            MOVE.L A6, -(A7)              ;<PMB, f11(draw_background)>
            MOVE.L A7, A6
            SUB.L #1000, A7

            MOVE.L #34, D6                ;<ASSIGN, 34, t42>
            MOVE.L D6, -4(A6)
            MOVE.L -4(A6), D6             ;<PARAM, t42>
            MOVE.L D6, -(A7)
            MOVE.L #32, D6                ;<ASSIGN, 32, t43>
            MOVE.L D6, -8(A6)
            MOVE.L -8(A6), D6             ;<PARAM, t43>
            MOVE.L D6, -(A7)
            MOVE.L #52, D6                ;<ASSIGN, 52, t44>
            MOVE.L D6, -12(A6)
            MOVE.L -12(A6), D6            ;<PARAM, t44>
            MOVE.L D6, -(A7)
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7

            MOVE.L #0, D6                 ;<ASSIGN, 0, t45>
            MOVE.L D6, -16(A6)
            MOVE.L -16(A6), D6            ;<PARAM, t45>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t46>
            MOVE.L D6, -20(A6)
            MOVE.L -20(A6), D6            ;<PARAM, t46>
            MOVE.L D6, -(A7)
            MOVE.L 8(A6), D6              ;<PARAM, t33>
            MOVE.L D6, -(A7)
            MOVE.L 12(A6), D6             ;<PARAM, t34>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #3, D6                 ;<ASSIGN, 3, t47>
            MOVE.L D6, -24(A6)
            MOVE.L -24(A6), D6            ;<ASSIGN, t47, t35>
            MOVE.L D6, -28(A6)
            MOVE.L #196, D6               ;<ASSIGN, 196, t48>
            MOVE.L D6, -32(A6)
            MOVE.L -32(A6), D6            ;<PARAM, t48>
            MOVE.L D6, -(A7)
            MOVE.L #194, D6               ;<ASSIGN, 194, t49>
            MOVE.L D6, -36(A6)
            MOVE.L -36(A6), D6            ;<PARAM, t49>
            MOVE.L D6, -(A7)
            MOVE.L #100, D6               ;<ASSIGN, 100, t50>
            MOVE.L D6, -40(A6)
            MOVE.L -40(A6), D6            ;<PARAM, t50>
            MOVE.L D6, -(A7)
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7

            MOVE.L #513, D6               ;<ASSIGN, 513, t51>
            MOVE.L D6, -44(A6)
            MOVE.L -44(A6), D6            ;<PARAM, t51>
            MOVE.L D6, -(A7)
            MOVE.L #67, D6                ;<ASSIGN, 67, t52>
            MOVE.L D6, -48(A6)
            MOVE.L -48(A6), D6            ;<PARAM, t52>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t53>
            MOVE.L D6, -52(A6)
            MOVE.L -52(A6), D6            ;<PARAM, t53>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t54>
            MOVE.L D6, -56(A6)
            MOVE.L -56(A6), D6            ;<PARAM, t54>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #176, D6               ;<ASSIGN, 176, t55>
            MOVE.L D6, -60(A6)
            MOVE.L -60(A6), D6            ;<PARAM, t55>
            MOVE.L D6, -(A7)
            MOVE.L #232, D6               ;<ASSIGN, 232, t56>
            MOVE.L D6, -64(A6)
            MOVE.L -64(A6), D6            ;<PARAM, t56>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t57>
            MOVE.L D6, -68(A6)
            MOVE.L -68(A6), D6            ;<PARAM, t57>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t58>
            MOVE.L D6, -72(A6)
            MOVE.L -72(A6), D6            ;<PARAM, t58>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #420, D6               ;<ASSIGN, 420, t59>
            MOVE.L D6, -76(A6)
            MOVE.L -76(A6), D6            ;<PARAM, t59>
            MOVE.L D6, -(A7)
            MOVE.L #133, D6               ;<ASSIGN, 133, t60>
            MOVE.L D6, -80(A6)
            MOVE.L -80(A6), D6            ;<PARAM, t60>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t61>
            MOVE.L D6, -84(A6)
            MOVE.L -84(A6), D6            ;<PARAM, t61>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t62>
            MOVE.L D6, -88(A6)
            MOVE.L -88(A6), D6            ;<PARAM, t62>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #196, D6               ;<ASSIGN, 196, t63>
            MOVE.L D6, -92(A6)
            MOVE.L -92(A6), D6            ;<PARAM, t63>
            MOVE.L D6, -(A7)
            MOVE.L #203, D6               ;<ASSIGN, 203, t64>
            MOVE.L D6, -96(A6)
            MOVE.L -96(A6), D6            ;<PARAM, t64>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t65>
            MOVE.L D6, -100(A6)
            MOVE.L -100(A6), D6           ;<PARAM, t65>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t66>
            MOVE.L D6, -104(A6)
            MOVE.L -104(A6), D6           ;<PARAM, t66>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #136, D6               ;<ASSIGN, 136, t67>
            MOVE.L D6, -108(A6)
            MOVE.L -108(A6), D6           ;<PARAM, t67>
            MOVE.L D6, -(A7)
            MOVE.L #78, D6                ;<ASSIGN, 78, t68>
            MOVE.L D6, -112(A6)
            MOVE.L -112(A6), D6           ;<PARAM, t68>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t69>
            MOVE.L D6, -116(A6)
            MOVE.L -116(A6), D6           ;<PARAM, t69>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t70>
            MOVE.L D6, -120(A6)
            MOVE.L -120(A6), D6           ;<PARAM, t70>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #458, D6               ;<ASSIGN, 458, t71>
            MOVE.L D6, -124(A6)
            MOVE.L -124(A6), D6           ;<PARAM, t71>
            MOVE.L D6, -(A7)
            MOVE.L #116, D6               ;<ASSIGN, 116, t72>
            MOVE.L D6, -128(A6)
            MOVE.L -128(A6), D6           ;<PARAM, t72>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t73>
            MOVE.L D6, -132(A6)
            MOVE.L -132(A6), D6           ;<PARAM, t73>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t74>
            MOVE.L D6, -136(A6)
            MOVE.L -136(A6), D6           ;<PARAM, t74>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #221, D6               ;<ASSIGN, 221, t75>
            MOVE.L D6, -140(A6)
            MOVE.L -140(A6), D6           ;<PARAM, t75>
            MOVE.L D6, -(A7)
            MOVE.L #26, D6                ;<ASSIGN, 26, t76>
            MOVE.L D6, -144(A6)
            MOVE.L -144(A6), D6           ;<PARAM, t76>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t77>
            MOVE.L D6, -148(A6)
            MOVE.L -148(A6), D6           ;<PARAM, t77>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t78>
            MOVE.L D6, -152(A6)
            MOVE.L -152(A6), D6           ;<PARAM, t78>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #587, D6               ;<ASSIGN, 587, t79>
            MOVE.L D6, -156(A6)
            MOVE.L -156(A6), D6           ;<PARAM, t79>
            MOVE.L D6, -(A7)
            MOVE.L #330, D6               ;<ASSIGN, 330, t80>
            MOVE.L D6, -160(A6)
            MOVE.L -160(A6), D6           ;<PARAM, t80>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t81>
            MOVE.L D6, -164(A6)
            MOVE.L -164(A6), D6           ;<PARAM, t81>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t82>
            MOVE.L D6, -168(A6)
            MOVE.L -168(A6), D6           ;<PARAM, t82>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #20, D6                ;<ASSIGN, 20, t83>
            MOVE.L D6, -172(A6)
            MOVE.L -172(A6), D6           ;<PARAM, t83>
            MOVE.L D6, -(A7)
            MOVE.L #75, D6                ;<ASSIGN, 75, t84>
            MOVE.L D6, -176(A6)
            MOVE.L -176(A6), D6           ;<PARAM, t84>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t85>
            MOVE.L D6, -180(A6)
            MOVE.L -180(A6), D6           ;<PARAM, t85>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t86>
            MOVE.L D6, -184(A6)
            MOVE.L -184(A6), D6           ;<PARAM, t86>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #578, D6               ;<ASSIGN, 578, t87>
            MOVE.L D6, -188(A6)
            MOVE.L -188(A6), D6           ;<PARAM, t87>
            MOVE.L D6, -(A7)
            MOVE.L #492, D6               ;<ASSIGN, 492, t88>
            MOVE.L D6, -192(A6)
            MOVE.L -192(A6), D6           ;<PARAM, t88>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t89>
            MOVE.L D6, -196(A6)
            MOVE.L -196(A6), D6           ;<PARAM, t89>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t90>
            MOVE.L D6, -200(A6)
            MOVE.L -200(A6), D6           ;<PARAM, t90>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #85, D6                ;<ASSIGN, 85, t91>
            MOVE.L D6, -204(A6)
            MOVE.L -204(A6), D6           ;<PARAM, t91>
            MOVE.L D6, -(A7)
            MOVE.L #140, D6               ;<ASSIGN, 140, t92>
            MOVE.L D6, -208(A6)
            MOVE.L -208(A6), D6           ;<PARAM, t92>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t93>
            MOVE.L D6, -212(A6)
            MOVE.L -212(A6), D6           ;<PARAM, t93>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t94>
            MOVE.L D6, -216(A6)
            MOVE.L -216(A6), D6           ;<PARAM, t94>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #71, D6                ;<ASSIGN, 71, t95>
            MOVE.L D6, -220(A6)
            MOVE.L -220(A6), D6           ;<PARAM, t95>
            MOVE.L D6, -(A7)
            MOVE.L #517, D6               ;<ASSIGN, 517, t96>
            MOVE.L D6, -224(A6)
            MOVE.L -224(A6), D6           ;<PARAM, t96>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t97>
            MOVE.L D6, -228(A6)
            MOVE.L -228(A6), D6           ;<PARAM, t97>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t98>
            MOVE.L D6, -232(A6)
            MOVE.L -232(A6), D6           ;<PARAM, t98>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #252, D6               ;<ASSIGN, 252, t99>
            MOVE.L D6, -236(A6)
            MOVE.L -236(A6), D6           ;<PARAM, t99>
            MOVE.L D6, -(A7)
            MOVE.L #52, D6                ;<ASSIGN, 52, t100>
            MOVE.L D6, -240(A6)
            MOVE.L -240(A6), D6           ;<PARAM, t100>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t101>
            MOVE.L D6, -244(A6)
            MOVE.L -244(A6), D6           ;<PARAM, t101>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t102>
            MOVE.L D6, -248(A6)
            MOVE.L -248(A6), D6           ;<PARAM, t102>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #438, D6               ;<ASSIGN, 438, t103>
            MOVE.L D6, -252(A6)
            MOVE.L -252(A6), D6           ;<PARAM, t103>
            MOVE.L D6, -(A7)
            MOVE.L #46, D6                ;<ASSIGN, 46, t104>
            MOVE.L D6, -256(A6)
            MOVE.L -256(A6), D6           ;<PARAM, t104>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t105>
            MOVE.L D6, -260(A6)
            MOVE.L -260(A6), D6           ;<PARAM, t105>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t106>
            MOVE.L D6, -264(A6)
            MOVE.L -264(A6), D6           ;<PARAM, t106>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #135, D6               ;<ASSIGN, 135, t107>
            MOVE.L D6, -268(A6)
            MOVE.L -268(A6), D6           ;<PARAM, t107>
            MOVE.L D6, -(A7)
            MOVE.L #107, D6               ;<ASSIGN, 107, t108>
            MOVE.L D6, -272(A6)
            MOVE.L -272(A6), D6           ;<PARAM, t108>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t109>
            MOVE.L D6, -276(A6)
            MOVE.L -276(A6), D6           ;<PARAM, t109>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t110>
            MOVE.L D6, -280(A6)
            MOVE.L -280(A6), D6           ;<PARAM, t110>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #283, D6               ;<ASSIGN, 283, t111>
            MOVE.L D6, -284(A6)
            MOVE.L -284(A6), D6           ;<PARAM, t111>
            MOVE.L D6, -(A7)
            MOVE.L #137, D6               ;<ASSIGN, 137, t112>
            MOVE.L D6, -288(A6)
            MOVE.L -288(A6), D6           ;<PARAM, t112>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t113>
            MOVE.L D6, -292(A6)
            MOVE.L -292(A6), D6           ;<PARAM, t113>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t114>
            MOVE.L D6, -296(A6)
            MOVE.L -296(A6), D6           ;<PARAM, t114>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #162, D6               ;<ASSIGN, 162, t115>
            MOVE.L D6, -300(A6)
            MOVE.L -300(A6), D6           ;<PARAM, t115>
            MOVE.L D6, -(A7)
            MOVE.L #112, D6               ;<ASSIGN, 112, t116>
            MOVE.L D6, -304(A6)
            MOVE.L -304(A6), D6           ;<PARAM, t116>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t117>
            MOVE.L D6, -308(A6)
            MOVE.L -308(A6), D6           ;<PARAM, t117>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t118>
            MOVE.L D6, -312(A6)
            MOVE.L -312(A6), D6           ;<PARAM, t118>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #414, D6               ;<ASSIGN, 414, t119>
            MOVE.L D6, -316(A6)
            MOVE.L -316(A6), D6           ;<PARAM, t119>
            MOVE.L D6, -(A7)
            MOVE.L #478, D6               ;<ASSIGN, 478, t120>
            MOVE.L D6, -320(A6)
            MOVE.L -320(A6), D6           ;<PARAM, t120>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t121>
            MOVE.L D6, -324(A6)
            MOVE.L -324(A6), D6           ;<PARAM, t121>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t122>
            MOVE.L D6, -328(A6)
            MOVE.L -328(A6), D6           ;<PARAM, t122>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #564, D6               ;<ASSIGN, 564, t123>
            MOVE.L D6, -332(A6)
            MOVE.L -332(A6), D6           ;<PARAM, t123>
            MOVE.L D6, -(A7)
            MOVE.L #42, D6                ;<ASSIGN, 42, t124>
            MOVE.L D6, -336(A6)
            MOVE.L -336(A6), D6           ;<PARAM, t124>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t125>
            MOVE.L D6, -340(A6)
            MOVE.L -340(A6), D6           ;<PARAM, t125>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t126>
            MOVE.L D6, -344(A6)
            MOVE.L -344(A6), D6           ;<PARAM, t126>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #596, D6               ;<ASSIGN, 596, t127>
            MOVE.L D6, -348(A6)
            MOVE.L -348(A6), D6           ;<PARAM, t127>
            MOVE.L D6, -(A7)
            MOVE.L #369, D6               ;<ASSIGN, 369, t128>
            MOVE.L D6, -352(A6)
            MOVE.L -352(A6), D6           ;<PARAM, t128>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t129>
            MOVE.L D6, -356(A6)
            MOVE.L -356(A6), D6           ;<PARAM, t129>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t130>
            MOVE.L D6, -360(A6)
            MOVE.L -360(A6), D6           ;<PARAM, t130>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #452, D6               ;<ASSIGN, 452, t131>
            MOVE.L D6, -364(A6)
            MOVE.L -364(A6), D6           ;<PARAM, t131>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t132>
            MOVE.L D6, -368(A6)
            MOVE.L -368(A6), D6           ;<PARAM, t132>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t133>
            MOVE.L D6, -372(A6)
            MOVE.L -372(A6), D6           ;<PARAM, t133>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t134>
            MOVE.L D6, -376(A6)
            MOVE.L -376(A6), D6           ;<PARAM, t134>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #171, D6               ;<ASSIGN, 171, t135>
            MOVE.L D6, -380(A6)
            MOVE.L -380(A6), D6           ;<PARAM, t135>
            MOVE.L D6, -(A7)
            MOVE.L #65, D6                ;<ASSIGN, 65, t136>
            MOVE.L D6, -384(A6)
            MOVE.L -384(A6), D6           ;<PARAM, t136>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t137>
            MOVE.L D6, -388(A6)
            MOVE.L -388(A6), D6           ;<PARAM, t137>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t138>
            MOVE.L D6, -392(A6)
            MOVE.L -392(A6), D6           ;<PARAM, t138>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #226, D6               ;<ASSIGN, 226, t139>
            MOVE.L D6, -396(A6)
            MOVE.L -396(A6), D6           ;<PARAM, t139>
            MOVE.L D6, -(A7)
            MOVE.L #213, D6               ;<ASSIGN, 213, t140>
            MOVE.L D6, -400(A6)
            MOVE.L -400(A6), D6           ;<PARAM, t140>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t141>
            MOVE.L D6, -404(A6)
            MOVE.L -404(A6), D6           ;<PARAM, t141>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t142>
            MOVE.L D6, -408(A6)
            MOVE.L -408(A6), D6           ;<PARAM, t142>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #333, D6               ;<ASSIGN, 333, t143>
            MOVE.L D6, -412(A6)
            MOVE.L -412(A6), D6           ;<PARAM, t143>
            MOVE.L D6, -(A7)
            MOVE.L #160, D6               ;<ASSIGN, 160, t144>
            MOVE.L D6, -416(A6)
            MOVE.L -416(A6), D6           ;<PARAM, t144>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t145>
            MOVE.L D6, -420(A6)
            MOVE.L -420(A6), D6           ;<PARAM, t145>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t146>
            MOVE.L D6, -424(A6)
            MOVE.L -424(A6), D6           ;<PARAM, t146>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #96, D6                ;<ASSIGN, 96, t147>
            MOVE.L D6, -428(A6)
            MOVE.L -428(A6), D6           ;<PARAM, t147>
            MOVE.L D6, -(A7)
            MOVE.L #294, D6               ;<ASSIGN, 294, t148>
            MOVE.L D6, -432(A6)
            MOVE.L -432(A6), D6           ;<PARAM, t148>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t149>
            MOVE.L D6, -436(A6)
            MOVE.L -436(A6), D6           ;<PARAM, t149>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t150>
            MOVE.L D6, -440(A6)
            MOVE.L -440(A6), D6           ;<PARAM, t150>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #96, D6                ;<ASSIGN, 96, t151>
            MOVE.L D6, -444(A6)
            MOVE.L -444(A6), D6           ;<PARAM, t151>
            MOVE.L D6, -(A7)
            MOVE.L #430, D6               ;<ASSIGN, 430, t152>
            MOVE.L D6, -448(A6)
            MOVE.L -448(A6), D6           ;<PARAM, t152>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t153>
            MOVE.L D6, -452(A6)
            MOVE.L -452(A6), D6           ;<PARAM, t153>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t154>
            MOVE.L D6, -456(A6)
            MOVE.L -456(A6), D6           ;<PARAM, t154>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #486, D6               ;<ASSIGN, 486, t155>
            MOVE.L D6, -460(A6)
            MOVE.L -460(A6), D6           ;<PARAM, t155>
            MOVE.L D6, -(A7)
            MOVE.L #180, D6               ;<ASSIGN, 180, t156>
            MOVE.L D6, -464(A6)
            MOVE.L -464(A6), D6           ;<PARAM, t156>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t157>
            MOVE.L D6, -468(A6)
            MOVE.L -468(A6), D6           ;<PARAM, t157>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t158>
            MOVE.L D6, -472(A6)
            MOVE.L -472(A6), D6           ;<PARAM, t158>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #7, D6                 ;<ASSIGN, 7, t159>
            MOVE.L D6, -476(A6)
            MOVE.L -476(A6), D6           ;<PARAM, t159>
            MOVE.L D6, -(A7)
            MOVE.L #476, D6               ;<ASSIGN, 476, t160>
            MOVE.L D6, -480(A6)
            MOVE.L -480(A6), D6           ;<PARAM, t160>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t161>
            MOVE.L D6, -484(A6)
            MOVE.L -484(A6), D6           ;<PARAM, t161>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t162>
            MOVE.L D6, -488(A6)
            MOVE.L -488(A6), D6           ;<PARAM, t162>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #537, D6               ;<ASSIGN, 537, t163>
            MOVE.L D6, -492(A6)
            MOVE.L -492(A6), D6           ;<PARAM, t163>
            MOVE.L D6, -(A7)
            MOVE.L #507, D6               ;<ASSIGN, 507, t164>
            MOVE.L D6, -496(A6)
            MOVE.L -496(A6), D6           ;<PARAM, t164>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t165>
            MOVE.L D6, -500(A6)
            MOVE.L -500(A6), D6           ;<PARAM, t165>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t166>
            MOVE.L D6, -504(A6)
            MOVE.L -504(A6), D6           ;<PARAM, t166>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #51, D6                ;<ASSIGN, 51, t167>
            MOVE.L D6, -508(A6)
            MOVE.L -508(A6), D6           ;<PARAM, t167>
            MOVE.L D6, -(A7)
            MOVE.L #208, D6               ;<ASSIGN, 208, t168>
            MOVE.L D6, -512(A6)
            MOVE.L -512(A6), D6           ;<PARAM, t168>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t169>
            MOVE.L D6, -516(A6)
            MOVE.L -516(A6), D6           ;<PARAM, t169>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t170>
            MOVE.L D6, -520(A6)
            MOVE.L -520(A6), D6           ;<PARAM, t170>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #38, D6                ;<ASSIGN, 38, t171>
            MOVE.L D6, -524(A6)
            MOVE.L -524(A6), D6           ;<PARAM, t171>
            MOVE.L D6, -(A7)
            MOVE.L #437, D6               ;<ASSIGN, 437, t172>
            MOVE.L D6, -528(A6)
            MOVE.L -528(A6), D6           ;<PARAM, t172>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t173>
            MOVE.L D6, -532(A6)
            MOVE.L -532(A6), D6           ;<PARAM, t173>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t174>
            MOVE.L D6, -536(A6)
            MOVE.L -536(A6), D6           ;<PARAM, t174>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #399, D6               ;<ASSIGN, 399, t175>
            MOVE.L D6, -540(A6)
            MOVE.L -540(A6), D6           ;<PARAM, t175>
            MOVE.L D6, -(A7)
            MOVE.L #329, D6               ;<ASSIGN, 329, t176>
            MOVE.L D6, -544(A6)
            MOVE.L -544(A6), D6           ;<PARAM, t176>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t177>
            MOVE.L D6, -548(A6)
            MOVE.L -548(A6), D6           ;<PARAM, t177>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t178>
            MOVE.L D6, -552(A6)
            MOVE.L -552(A6), D6           ;<PARAM, t178>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #151, D6               ;<ASSIGN, 151, t179>
            MOVE.L D6, -556(A6)
            MOVE.L -556(A6), D6           ;<PARAM, t179>
            MOVE.L D6, -(A7)
            MOVE.L #22, D6                ;<ASSIGN, 22, t180>
            MOVE.L D6, -560(A6)
            MOVE.L -560(A6), D6           ;<PARAM, t180>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t181>
            MOVE.L D6, -564(A6)
            MOVE.L -564(A6), D6           ;<PARAM, t181>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t182>
            MOVE.L D6, -568(A6)
            MOVE.L -568(A6), D6           ;<PARAM, t182>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #134, D6               ;<ASSIGN, 134, t183>
            MOVE.L D6, -572(A6)
            MOVE.L -572(A6), D6           ;<PARAM, t183>
            MOVE.L D6, -(A7)
            MOVE.L #583, D6               ;<ASSIGN, 583, t184>
            MOVE.L D6, -576(A6)
            MOVE.L -576(A6), D6           ;<PARAM, t184>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t185>
            MOVE.L D6, -580(A6)
            MOVE.L -580(A6), D6           ;<PARAM, t185>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t186>
            MOVE.L D6, -584(A6)
            MOVE.L -584(A6), D6           ;<PARAM, t186>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #587, D6               ;<ASSIGN, 587, t187>
            MOVE.L D6, -588(A6)
            MOVE.L -588(A6), D6           ;<PARAM, t187>
            MOVE.L D6, -(A7)
            MOVE.L #389, D6               ;<ASSIGN, 389, t188>
            MOVE.L D6, -592(A6)
            MOVE.L -592(A6), D6           ;<PARAM, t188>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t189>
            MOVE.L D6, -596(A6)
            MOVE.L -596(A6), D6           ;<PARAM, t189>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t190>
            MOVE.L D6, -600(A6)
            MOVE.L -600(A6), D6           ;<PARAM, t190>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #43, D6                ;<ASSIGN, 43, t191>
            MOVE.L D6, -604(A6)
            MOVE.L -604(A6), D6           ;<PARAM, t191>
            MOVE.L D6, -(A7)
            MOVE.L #204, D6               ;<ASSIGN, 204, t192>
            MOVE.L D6, -608(A6)
            MOVE.L -608(A6), D6           ;<PARAM, t192>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t193>
            MOVE.L D6, -612(A6)
            MOVE.L -612(A6), D6           ;<PARAM, t193>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t194>
            MOVE.L D6, -616(A6)
            MOVE.L -616(A6), D6           ;<PARAM, t194>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #524, D6               ;<ASSIGN, 524, t195>
            MOVE.L D6, -620(A6)
            MOVE.L -620(A6), D6           ;<PARAM, t195>
            MOVE.L D6, -(A7)
            MOVE.L #328, D6               ;<ASSIGN, 328, t196>
            MOVE.L D6, -624(A6)
            MOVE.L -624(A6), D6           ;<PARAM, t196>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t197>
            MOVE.L D6, -628(A6)
            MOVE.L -628(A6), D6           ;<PARAM, t197>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t198>
            MOVE.L D6, -632(A6)
            MOVE.L -632(A6), D6           ;<PARAM, t198>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #189, D6               ;<ASSIGN, 189, t199>
            MOVE.L D6, -636(A6)
            MOVE.L -636(A6), D6           ;<PARAM, t199>
            MOVE.L D6, -(A7)
            MOVE.L #263, D6               ;<ASSIGN, 263, t200>
            MOVE.L D6, -640(A6)
            MOVE.L -640(A6), D6           ;<PARAM, t200>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t201>
            MOVE.L D6, -644(A6)
            MOVE.L -644(A6), D6           ;<PARAM, t201>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t202>
            MOVE.L D6, -648(A6)
            MOVE.L -648(A6), D6           ;<PARAM, t202>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #440, D6               ;<ASSIGN, 440, t203>
            MOVE.L D6, -652(A6)
            MOVE.L -652(A6), D6           ;<PARAM, t203>
            MOVE.L D6, -(A7)
            MOVE.L #334, D6               ;<ASSIGN, 334, t204>
            MOVE.L D6, -656(A6)
            MOVE.L -656(A6), D6           ;<PARAM, t204>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t205>
            MOVE.L D6, -660(A6)
            MOVE.L -660(A6), D6           ;<PARAM, t205>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t206>
            MOVE.L D6, -664(A6)
            MOVE.L -664(A6), D6           ;<PARAM, t206>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #27, D6                ;<ASSIGN, 27, t207>
            MOVE.L D6, -668(A6)
            MOVE.L -668(A6), D6           ;<PARAM, t207>
            MOVE.L D6, -(A7)
            MOVE.L #326, D6               ;<ASSIGN, 326, t208>
            MOVE.L D6, -672(A6)
            MOVE.L -672(A6), D6           ;<PARAM, t208>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t209>
            MOVE.L D6, -676(A6)
            MOVE.L -676(A6), D6           ;<PARAM, t209>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t210>
            MOVE.L D6, -680(A6)
            MOVE.L -680(A6), D6           ;<PARAM, t210>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #201, D6               ;<ASSIGN, 201, t211>
            MOVE.L D6, -684(A6)
            MOVE.L -684(A6), D6           ;<PARAM, t211>
            MOVE.L D6, -(A7)
            MOVE.L #582, D6               ;<ASSIGN, 582, t212>
            MOVE.L D6, -688(A6)
            MOVE.L -688(A6), D6           ;<PARAM, t212>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t213>
            MOVE.L D6, -692(A6)
            MOVE.L -692(A6), D6           ;<PARAM, t213>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t214>
            MOVE.L D6, -696(A6)
            MOVE.L -696(A6), D6           ;<PARAM, t214>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #386, D6               ;<ASSIGN, 386, t215>
            MOVE.L D6, -700(A6)
            MOVE.L -700(A6), D6           ;<PARAM, t215>
            MOVE.L D6, -(A7)
            MOVE.L #441, D6               ;<ASSIGN, 441, t216>
            MOVE.L D6, -704(A6)
            MOVE.L -704(A6), D6           ;<PARAM, t216>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t217>
            MOVE.L D6, -708(A6)
            MOVE.L -708(A6), D6           ;<PARAM, t217>
            MOVE.L D6, -(A7)
            MOVE.L #4, D6                 ;<ASSIGN, 4, t218>
            MOVE.L D6, -712(A6)
            MOVE.L -712(A6), D6           ;<PARAM, t218>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #35, D6                ;<ASSIGN, 35, t219>
            MOVE.L D6, -716(A6)
            MOVE.L -716(A6), D6           ;<PARAM, t219>
            MOVE.L D6, -(A7)
            MOVE.L #93, D6                ;<ASSIGN, 93, t220>
            MOVE.L D6, -720(A6)
            MOVE.L -720(A6), D6           ;<PARAM, t220>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t221>
            MOVE.L D6, -724(A6)
            MOVE.L -724(A6), D6           ;<PARAM, t221>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t222>
            MOVE.L D6, -728(A6)
            MOVE.L -728(A6), D6           ;<PARAM, t222>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #126, D6               ;<ASSIGN, 126, t223>
            MOVE.L D6, -732(A6)
            MOVE.L -732(A6), D6           ;<PARAM, t223>
            MOVE.L D6, -(A7)
            MOVE.L #365, D6               ;<ASSIGN, 365, t224>
            MOVE.L D6, -736(A6)
            MOVE.L -736(A6), D6           ;<PARAM, t224>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t225>
            MOVE.L D6, -740(A6)
            MOVE.L -740(A6), D6           ;<PARAM, t225>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t226>
            MOVE.L D6, -744(A6)
            MOVE.L -744(A6), D6           ;<PARAM, t226>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #522, D6               ;<ASSIGN, 522, t227>
            MOVE.L D6, -748(A6)
            MOVE.L -748(A6), D6           ;<PARAM, t227>
            MOVE.L D6, -(A7)
            MOVE.L #353, D6               ;<ASSIGN, 353, t228>
            MOVE.L D6, -752(A6)
            MOVE.L -752(A6), D6           ;<PARAM, t228>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t229>
            MOVE.L D6, -756(A6)
            MOVE.L -756(A6), D6           ;<PARAM, t229>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t230>
            MOVE.L D6, -760(A6)
            MOVE.L -760(A6), D6           ;<PARAM, t230>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #530, D6               ;<ASSIGN, 530, t231>
            MOVE.L D6, -764(A6)
            MOVE.L -764(A6), D6           ;<PARAM, t231>
            MOVE.L D6, -(A7)
            MOVE.L #117, D6               ;<ASSIGN, 117, t232>
            MOVE.L D6, -768(A6)
            MOVE.L -768(A6), D6           ;<PARAM, t232>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t233>
            MOVE.L D6, -772(A6)
            MOVE.L -772(A6), D6           ;<PARAM, t233>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t234>
            MOVE.L D6, -776(A6)
            MOVE.L -776(A6), D6           ;<PARAM, t234>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #351, D6               ;<ASSIGN, 351, t235>
            MOVE.L D6, -780(A6)
            MOVE.L -780(A6), D6           ;<PARAM, t235>
            MOVE.L D6, -(A7)
            MOVE.L #286, D6               ;<ASSIGN, 286, t236>
            MOVE.L D6, -784(A6)
            MOVE.L -784(A6), D6           ;<PARAM, t236>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t237>
            MOVE.L D6, -788(A6)
            MOVE.L -788(A6), D6           ;<PARAM, t237>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t238>
            MOVE.L D6, -792(A6)
            MOVE.L -792(A6), D6           ;<PARAM, t238>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #537, D6               ;<ASSIGN, 537, t239>
            MOVE.L D6, -796(A6)
            MOVE.L -796(A6), D6           ;<PARAM, t239>
            MOVE.L D6, -(A7)
            MOVE.L #309, D6               ;<ASSIGN, 309, t240>
            MOVE.L D6, -800(A6)
            MOVE.L -800(A6), D6           ;<PARAM, t240>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t241>
            MOVE.L D6, -804(A6)
            MOVE.L -804(A6), D6           ;<PARAM, t241>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t242>
            MOVE.L D6, -808(A6)
            MOVE.L -808(A6), D6           ;<PARAM, t242>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #370, D6               ;<ASSIGN, 370, t243>
            MOVE.L D6, -812(A6)
            MOVE.L -812(A6), D6           ;<PARAM, t243>
            MOVE.L D6, -(A7)
            MOVE.L #537, D6               ;<ASSIGN, 537, t244>
            MOVE.L D6, -816(A6)
            MOVE.L -816(A6), D6           ;<PARAM, t244>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t245>
            MOVE.L D6, -820(A6)
            MOVE.L -820(A6), D6           ;<PARAM, t245>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t246>
            MOVE.L D6, -824(A6)
            MOVE.L -824(A6), D6           ;<PARAM, t246>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #138, D6               ;<ASSIGN, 138, t247>
            MOVE.L D6, -828(A6)
            MOVE.L -828(A6), D6           ;<PARAM, t247>
            MOVE.L D6, -(A7)
            MOVE.L #140, D6               ;<ASSIGN, 140, t248>
            MOVE.L D6, -832(A6)
            MOVE.L -832(A6), D6           ;<PARAM, t248>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t249>
            MOVE.L D6, -836(A6)
            MOVE.L -836(A6), D6           ;<PARAM, t249>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t250>
            MOVE.L D6, -840(A6)
            MOVE.L -840(A6), D6           ;<PARAM, t250>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #8, D6                 ;<ASSIGN, 8, t251>
            MOVE.L D6, -844(A6)
            MOVE.L -844(A6), D6           ;<PARAM, t251>
            MOVE.L D6, -(A7)
            MOVE.L #189, D6               ;<ASSIGN, 189, t252>
            MOVE.L D6, -848(A6)
            MOVE.L -848(A6), D6           ;<PARAM, t252>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t253>
            MOVE.L D6, -852(A6)
            MOVE.L -852(A6), D6           ;<PARAM, t253>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t254>
            MOVE.L D6, -856(A6)
            MOVE.L -856(A6), D6           ;<PARAM, t254>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #279, D6               ;<ASSIGN, 279, t255>
            MOVE.L D6, -860(A6)
            MOVE.L -860(A6), D6           ;<PARAM, t255>
            MOVE.L D6, -(A7)
            MOVE.L #53, D6                ;<ASSIGN, 53, t256>
            MOVE.L D6, -864(A6)
            MOVE.L -864(A6), D6           ;<PARAM, t256>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t257>
            MOVE.L D6, -868(A6)
            MOVE.L -868(A6), D6           ;<PARAM, t257>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t258>
            MOVE.L D6, -872(A6)
            MOVE.L -872(A6), D6           ;<PARAM, t258>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #578, D6               ;<ASSIGN, 578, t259>
            MOVE.L D6, -876(A6)
            MOVE.L -876(A6), D6           ;<PARAM, t259>
            MOVE.L D6, -(A7)
            MOVE.L #181, D6               ;<ASSIGN, 181, t260>
            MOVE.L D6, -880(A6)
            MOVE.L -880(A6), D6           ;<PARAM, t260>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t261>
            MOVE.L D6, -884(A6)
            MOVE.L -884(A6), D6           ;<PARAM, t261>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t262>
            MOVE.L D6, -888(A6)
            MOVE.L -888(A6), D6           ;<PARAM, t262>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #372, D6               ;<ASSIGN, 372, t263>
            MOVE.L D6, -892(A6)
            MOVE.L -892(A6), D6           ;<PARAM, t263>
            MOVE.L D6, -(A7)
            MOVE.L #155, D6               ;<ASSIGN, 155, t264>
            MOVE.L D6, -896(A6)
            MOVE.L -896(A6), D6           ;<PARAM, t264>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t265>
            MOVE.L D6, -900(A6)
            MOVE.L -900(A6), D6           ;<PARAM, t265>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t266>
            MOVE.L D6, -904(A6)
            MOVE.L -904(A6), D6           ;<PARAM, t266>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #492, D6               ;<ASSIGN, 492, t267>
            MOVE.L D6, -908(A6)
            MOVE.L -908(A6), D6           ;<PARAM, t267>
            MOVE.L D6, -(A7)
            MOVE.L #218, D6               ;<ASSIGN, 218, t268>
            MOVE.L D6, -912(A6)
            MOVE.L -912(A6), D6           ;<PARAM, t268>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t269>
            MOVE.L D6, -916(A6)
            MOVE.L -916(A6), D6           ;<PARAM, t269>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t270>
            MOVE.L D6, -920(A6)
            MOVE.L -920(A6), D6           ;<PARAM, t270>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #517, D6               ;<ASSIGN, 517, t271>
            MOVE.L D6, -924(A6)
            MOVE.L -924(A6), D6           ;<PARAM, t271>
            MOVE.L D6, -(A7)
            MOVE.L #512, D6               ;<ASSIGN, 512, t272>
            MOVE.L D6, -928(A6)
            MOVE.L -928(A6), D6           ;<PARAM, t272>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t273>
            MOVE.L D6, -932(A6)
            MOVE.L -932(A6), D6           ;<PARAM, t273>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t274>
            MOVE.L D6, -936(A6)
            MOVE.L -936(A6), D6           ;<PARAM, t274>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #371, D6               ;<ASSIGN, 371, t275>
            MOVE.L D6, -940(A6)
            MOVE.L -940(A6), D6           ;<PARAM, t275>
            MOVE.L D6, -(A7)
            MOVE.L #505, D6               ;<ASSIGN, 505, t276>
            MOVE.L D6, -944(A6)
            MOVE.L -944(A6), D6           ;<PARAM, t276>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t277>
            MOVE.L D6, -948(A6)
            MOVE.L -948(A6), D6           ;<PARAM, t277>
            MOVE.L D6, -(A7)
            MOVE.L #3, D6                 ;<ASSIGN, 3, t278>
            MOVE.L D6, -952(A6)
            MOVE.L -952(A6), D6           ;<PARAM, t278>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #449, D6               ;<ASSIGN, 449, t279>
            MOVE.L D6, -956(A6)
            MOVE.L -956(A6), D6           ;<PARAM, t279>
            MOVE.L D6, -(A7)
            MOVE.L #148, D6               ;<ASSIGN, 148, t280>
            MOVE.L D6, -960(A6)
            MOVE.L -960(A6), D6           ;<PARAM, t280>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t281>
            MOVE.L D6, -964(A6)
            MOVE.L -964(A6), D6           ;<PARAM, t281>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t282>
            MOVE.L D6, -968(A6)
            MOVE.L -968(A6), D6           ;<PARAM, t282>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #459, D6               ;<ASSIGN, 459, t283>
            MOVE.L D6, -972(A6)
            MOVE.L -972(A6), D6           ;<PARAM, t283>
            MOVE.L D6, -(A7)
            MOVE.L #408, D6               ;<ASSIGN, 408, t284>
            MOVE.L D6, -976(A6)
            MOVE.L -976(A6), D6           ;<PARAM, t284>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t285>
            MOVE.L D6, -980(A6)
            MOVE.L -980(A6), D6           ;<PARAM, t285>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t286>
            MOVE.L D6, -984(A6)
            MOVE.L -984(A6), D6           ;<PARAM, t286>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #1, D6                 ;<ASSIGN, 1, t287>
            MOVE.L D6, -988(A6)
            MOVE.L -988(A6), D6           ;<PARAM, t287>
            MOVE.L D6, -(A7)
            MOVE.L #297, D6               ;<ASSIGN, 297, t288>
            MOVE.L D6, -992(A6)
            MOVE.L -992(A6), D6           ;<PARAM, t288>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t289>
            MOVE.L D6, -996(A6)
            MOVE.L -996(A6), D6           ;<PARAM, t289>
            MOVE.L D6, -(A7)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t290>
            MOVE.L D6, -1000(A6)
            MOVE.L -1000(A6), D6          ;<PARAM, t290>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L A6, A7                 ;<RET, f11(draw_background)>
            MOVE.L (A7)+, A6
            RTS
F12: 
            MOVE.L A6, -(A7)              ;<PMB, f12(cyclone)>
            MOVE.L A7, A6
            SUB.L #192, A7

            MOVE.L #255, D6               ;<ASSIGN, 255, t291>
            MOVE.L D6, -4(A6)
            MOVE.L -4(A6), D6             ;<PARAM, t291>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t292>
            MOVE.L D6, -8(A6)
            MOVE.L -8(A6), D6             ;<PARAM, t292>
            MOVE.L D6, -(A7)
            MOVE.L #255, D6               ;<ASSIGN, 255, t293>
            MOVE.L D6, -12(A6)
            MOVE.L -12(A6), D6            ;<PARAM, t293>
            MOVE.L D6, -(A7)
            MOVE.L #14, D6                ;<ASSIGN, 14, t294>
            MOVE.L D6, -16(A6)
            MOVE.L -16(A6), D6            ;<PARAM, t294>
            MOVE.L D6, -(A7)
            MOVE.L #6, D6                 ;<ASSIGN, 6, t295>
            MOVE.L D6, -20(A6)
            MOVE.L -20(A6), D6            ;<PARAM, t295>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t296>
            MOVE.L D6, -24(A6)
            MOVE.L -24(A6), D6            ;<PARAM, t296>
            MOVE.L D6, -(A7)
            JSR SETTXTPR                  ;<CALL, f1>
            ADD.L #24, A7

            MOVE.L #640, D6               ;<ASSIGN, 640, t297>
            MOVE.L D6, -28(A6)
            MOVE.L -28(A6), D6            ;<ASSIGN, t297, t36>
            MOVE.L D6, -32(A6)
            MOVE.L -32(A6), D6            ;<ASSIGN, t36, t37>
            MOVE.L D6, -36(A6)
            MOVE.L #10, D6                ;<ASSIGN, 10, t298>
            MOVE.L D6, -40(A6)
            MOVE.L -40(A6), D6            ;<ASSIGN, t298, t38>
            MOVE.L D6, -44(A6)
            MOVE.L -32(A6), D6            ;<PARAM, t36>
            MOVE.L D6, -(A7)
            MOVE.L -36(A6), D6            ;<PARAM, t37>
            MOVE.L D6, -(A7)
            JSR INITSCRN                  ;<CALL, f2>
            ADD.L #8, A7

            JSR DBENABLE                  ;<CALL, f8>
            ADD.L #0, A7

            MOVE.L #2, D6                 ;<ASSIGN, 2, t299>
            MOVE.L D6, -48(A6)
            MOVE.L -36(A6), D5            ;<DIV, t37, t299, t300>
            MOVE.L -48(A6), D6
            DIVS D6, D5
            AND.L #$0000FFFF, D5
            MOVE.L D5, -52(A6)
            MOVE.L -52(A6), D6            ;<ASSIGN, t300, t39>
            MOVE.L D6, -56(A6)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t301>
            MOVE.L D6, -60(A6)
            MOVE.L -60(A6), D6            ;<ASSIGN, t301, t40>
            MOVE.L D6, -64(A6)
            MOVE.L #5, D6                 ;<ASSIGN, 5, t302>
            MOVE.L D6, -68(A6)
            MOVE.L -68(A6), D6            ;<ASSIGN, t302, t41>
            MOVE.L D6, -72(A6)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t303>
            MOVE.L D6, -76(A6)
            MOVE.L -76(A6), D6            ;<PARAM, t303>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t304>
            MOVE.L D6, -80(A6)
            MOVE.L -80(A6), D6            ;<PARAM, t304>
            MOVE.L D6, -(A7)
            MOVE.L #0, D6                 ;<ASSIGN, 0, t305>
            MOVE.L D6, -84(A6)
            MOVE.L -84(A6), D6            ;<PARAM, t305>
            MOVE.L D6, -(A7)
            JSR SETSTRK                   ;<CALL, f3>
            ADD.L #12, A7

E0: 
            MOVE.L #-1, D6                ;<ASSIGN, -1, t306>
            MOVE.L D6, -88(A6)
            MOVE.L -88(A6), D6            ;<EQ, t306, 0, e1>
            MOVE.L #0, D5
            CMP.L D5, D6
            BEQ E1

            MOVE.L -32(A6), D6            ;<PARAM, t36>
            MOVE.L D6, -(A7)
            MOVE.L -36(A6), D6            ;<PARAM, t37>
            MOVE.L D6, -(A7)
            JSR F11                       ;<CALL, f11>
            ADD.L #8, A7

            MOVE.L #95, D6                ;<ASSIGN, 95, t307>
            MOVE.L D6, -92(A6)
            MOVE.L -92(A6), D6            ;<PARAM, t307>
            MOVE.L D6, -(A7)
            MOVE.L #205, D6               ;<ASSIGN, 205, t308>
            MOVE.L D6, -96(A6)
            MOVE.L -96(A6), D6            ;<PARAM, t308>
            MOVE.L D6, -(A7)
            MOVE.L #225, D6               ;<ASSIGN, 225, t309>
            MOVE.L D6, -100(A6)
            MOVE.L -100(A6), D6           ;<PARAM, t309>
            MOVE.L D6, -(A7)
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7

            MOVE.L -64(A6), D6            ;<SUB, t40, t38, t310>
            MOVE.L -44(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -104(A6)
            MOVE.L -104(A6), D6           ;<PARAM, t310>
            MOVE.L D6, -(A7)
            MOVE.L -56(A6), D6            ;<PARAM, t39>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t38>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t38>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #118, D6               ;<ASSIGN, 118, t311>
            MOVE.L D6, -108(A6)
            MOVE.L -108(A6), D6           ;<PARAM, t311>
            MOVE.L D6, -(A7)
            MOVE.L #66, D6                ;<ASSIGN, 66, t312>
            MOVE.L D6, -112(A6)
            MOVE.L -112(A6), D6           ;<PARAM, t312>
            MOVE.L D6, -(A7)
            MOVE.L #138, D6               ;<ASSIGN, 138, t313>
            MOVE.L D6, -116(A6)
            MOVE.L -116(A6), D6           ;<PARAM, t313>
            MOVE.L D6, -(A7)
            JSR SETFILL                   ;<CALL, f4>
            ADD.L #12, A7

            MOVE.L -64(A6), D6            ;<PARAM, t40>
            MOVE.L D6, -(A7)
            MOVE.L -56(A6), D6            ;<PARAM, t39>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t38>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t38>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L -64(A6), D6            ;<SUB, t40, t38, t314>
            MOVE.L -44(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -120(A6)
            MOVE.L -120(A6), D6           ;<PARAM, t314>
            MOVE.L D6, -(A7)
            MOVE.L -56(A6), D6            ;<SUB, t39, t38, t315>
            MOVE.L -44(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -124(A6)
            MOVE.L -124(A6), D6           ;<PARAM, t315>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t38>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t38>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L -64(A6), D6            ;<SUB, t40, t38, t316>
            MOVE.L -44(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -128(A6)
            MOVE.L -128(A6), D6           ;<PARAM, t316>
            MOVE.L D6, -(A7)
            MOVE.L -56(A6), D6            ;<ADD, t39, t38, t317>
            MOVE.L -44(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -132(A6)
            MOVE.L -132(A6), D6           ;<PARAM, t317>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t38>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t38>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #2, D6                 ;<ASSIGN, 2, t318>
            MOVE.L D6, -136(A6)
            MOVE.L -136(A6), D6           ;<MULT, t318, t38, t319>
            MOVE.L -44(A6), D5
            MULS D6, D5
            MOVE.L D5, -140(A6)
            MOVE.L -64(A6), D6            ;<SUB, t40, t319, t320>
            MOVE.L -140(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -144(A6)
            MOVE.L -144(A6), D6           ;<PARAM, t320>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t321>
            MOVE.L D6, -148(A6)
            MOVE.L -148(A6), D6           ;<MULT, t321, t38, t322>
            MOVE.L -44(A6), D5
            MULS D6, D5
            MOVE.L D5, -152(A6)
            MOVE.L -56(A6), D6            ;<SUB, t39, t322, t323>
            MOVE.L -152(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -156(A6)
            MOVE.L -156(A6), D6           ;<PARAM, t323>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t38>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t38>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L #2, D6                 ;<ASSIGN, 2, t324>
            MOVE.L D6, -160(A6)
            MOVE.L -160(A6), D6           ;<MULT, t324, t38, t325>
            MOVE.L -44(A6), D5
            MULS D6, D5
            MOVE.L D5, -164(A6)
            MOVE.L -64(A6), D6            ;<SUB, t40, t325, t326>
            MOVE.L -164(A6), D5
            SUB.L D5, D6
            MOVE.L D6, -168(A6)
            MOVE.L -168(A6), D6           ;<PARAM, t326>
            MOVE.L D6, -(A7)
            MOVE.L #2, D6                 ;<ASSIGN, 2, t327>
            MOVE.L D6, -172(A6)
            MOVE.L -172(A6), D6           ;<MULT, t327, t38, t328>
            MOVE.L -44(A6), D5
            MULS D6, D5
            MOVE.L D5, -176(A6)
            MOVE.L -56(A6), D6            ;<ADD, t39, t328, t329>
            MOVE.L -176(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -180(A6)
            MOVE.L -180(A6), D6           ;<PARAM, t329>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t38>
            MOVE.L D6, -(A7)
            MOVE.L -44(A6), D6            ;<PARAM, t38>
            MOVE.L D6, -(A7)
            JSR DRAWRECT                  ;<CALL, f5>
            ADD.L #16, A7

            MOVE.L -64(A6), D6            ;<ADD, t40, t41, t330>
            MOVE.L -72(A6), D5
            ADD.L D6, D5
            MOVE.L D5, -184(A6)
            MOVE.L -184(A6), D5           ;<MOD, t330, t36, t331>
            MOVE.L -32(A6), D6
            DIVS D6, D5
            LSR.L  #8, D5
            LSR.L  #8, D5
            MOVE.L D5, -188(A6)
            MOVE.L -188(A6), D6           ;<ASSIGN, t331, t40>
            MOVE.L D6, -64(A6)
            JSR DBDRAW                    ;<CALL, f9>
            ADD.L #0, A7

            MOVE.L #33, D6                ;<ASSIGN, 33, t332>
            MOVE.L D6, -192(A6)
            MOVE.L -192(A6), D6           ;<PARAM, t332>
            MOVE.L D6, -(A7)
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
