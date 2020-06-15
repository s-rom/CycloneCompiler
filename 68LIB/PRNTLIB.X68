; -----------------------------------------------------------------------------
PRINTB:   
; PRINTS A BOOL VARIABLE
; Input    - D1.L FFFFFFFF (#-1) or 00000000 (#0)
;          - D0.L TRAP NUMBER #14 or #13
; Output   - PRINTS 'true' or 'false' to the screen
; Modifies - D0.L, D1.L, A1.L
; -----------------------------------------------------------------------------
            LEA.L   .TRSTR, A1
            CMP.L   #0, D1
            BNE     .PRINT
            LEA.L   .FSSTR, A1       
.PRINT:     TRAP    #15
            BRA     .END

.TRSTR      DC.B 'true',0
            DS.W 0

.FSSTR      DC.B 'false',0
            DS.W 0

.END:       
            RTS

; -----------------------------------------------------------------------------
PRNTBOOL:   
; PRINTS A BOOL VARIABLE
; Input    - D1.L FFFFFFFF (#-1) or 00000000 (#0)
; Output   - PRINTS 'true' or 'false' to the screen
; Modifies - D0.L, D1.L, A1.L
; -----------------------------------------------------------------------------
            MOVE.L  #14, D0
            JSR     PRINTB
            RTS


; -----------------------------------------------------------------------------
PRNTBOLN:   
; PRINTS A BOOL VARIABLE ENDING WITH LF,CR
; Input    - D1.L FFFFFFFF (#-1) or 00000000 (#0)
; Output   - PRINTS 'true' or 'false' to the screen
; Modifies - D0.L, D1.L, A1.L
; -----------------------------------------------------------------------------
            MOVE.L  #13, D0
            JSR     PRINTB
            RTS

; -----------------------------------------------------------------------------
NEWLN:   
; INSERTS A NEW LINE 
; Input    - NONE
; Output   - INCREASES THE CURSOR'S CURRENT ROW
; Modifies - D0.L, D1.L
; -----------------------------------------------------------------------------
            MOVE.L  #11,D0
            MOVE.W  #$00FF,D1
            TRAP    #15
            AND.L   #$0000000F,D1
            ADDQ.L  #1, D1
            TRAP    #15
            RTS






*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~8~
