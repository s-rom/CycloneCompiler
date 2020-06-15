	ORG    $1000

            INCLUDE "PRNTLIB.X68"
            INCLUDE "STRLIB.X68"
            

START:	MOVE.L  #700, -(A7)
            MOVE.L  #700, -(A7)
            JSR     INITSCRN
            
            ADD.L   #8, A7
            MOVE.L  #174, -(A7)             ; RED
            MOVE.L  #1, -(A7)               ; GREEN
            MOVE.L  #110, -(A7)             ; BLUE
            
            JSR     SETTXTCL
            LEA     MSG, A1
            MOVE.L  #14, D0
            TRAP    #15
           
            
	SIMHALT
             
MSG:        DC.B 'Hola que tal',0
            DS.W 0  
            END    START  








*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~8~
