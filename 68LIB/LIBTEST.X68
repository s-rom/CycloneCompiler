	ORG    $1000

            INCLUDE "PRNTLIB.X68"
            INCLUDE "STRLIB.X68"

START:	MOVE.L  #-1, D1
            JSR     PRNTBOLN
            JSR     PRNTBOLN

	SIMHALT             
	END    START  



*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~8~
