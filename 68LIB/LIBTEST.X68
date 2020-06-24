	ORG    $1000

            INCLUDE "PRNTLIB.X68"
            INCLUDE "STRLIB.X68"
            
            OPT MEX
START:	MOVE.L  #255, -(A7)             ; RED
            MOVE.L  #255, -(A7)             ; GREEN
            MOVE.L  #255, -(A7)             ; BLUE
            MOVE.L  #14, -(A7)              ; SIZE
            MOVE.L  #6,-(A7)                ; FONT = CONSOLAS
            MOVE.L  #0,-(A7)                ; STYLE
            JSR     SETTXTPR
            
            MOVE.L  #$00FFFFFF,D1
            MOVE.L  #21, D0
            MOVE.L  #$060C0000, D2
            TRAP    #15
            
            
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
