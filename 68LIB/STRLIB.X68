; -----------------------------------------------------------------------------
STRCPY:  
; COPIES THE CONTENT POINTED BY A2 INTO A1
; Input    - A1.L ADDRESS OF DST
;          - A2.L ADDRESS OF SRC
; Output   - (A1) CONTAINS THE STRING IN (A2). 
;           IF SIZE (A1) < SIZE (A2) THEN (A2) IS TRUNCATED TO FIT (A1)
; Modifies - A1.L, A2.L
; -----------------------------------------------------------------------------
.LOOP       CMP.B   #0, (A1)
            BEQ     .EXIT
            MOVE.B  (A2),(A1)
            CMP.B   #0,(A1)
            BEQ     .EXIT
            ADDA    #1,A1
            ADDA    #1,A2
            BRA     .LOOP
.EXIT:      RTS

*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~8~
