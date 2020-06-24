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
       

; -----------------------------------------------------------------------------
SETCOL      MACRO
; SETS COLOR INTO D1.L WITH THE REQUIRED FORMAT FOR SIM DRAW FUNCTIONS
; Input     - \1 RED
;           - \2 GREEN
;           - \3 BLUE
; Output    - COLOR IN D1.L AS $00BBGGRR
; Modifies  - D1.L, D0,L
; -----------------------------------------------------------------------------
            CLR.L   D1
            MOVE.L  \3, D1
            LSL.L   #8, D1
            LSL.L   #8, D1
            
            MOVE.L  \2, D0            
            LSL.L   #8, D0
            OR.L    D0, D1
            
            OR.L    \1, D1
            ENDM            
            
; -----------------------------------------------------------------------------
SETTXTCL:   
; [_INTERNAL API] SETS THE CURRENT TEXT COLOR
; Input    - RED:   +12(A7)
;          - GREEN: +8(A7)
;          - BLUE:  +4(A7)
; Output   - NONE
; Modifies - CURRENT TEXT COLOR, D1.L, D2.L, D0.L
; -----------------------------------------------------------------------------
            SETCOL  12(A7), 8(A7), 4(A7)            
            CLR.L   D2
            MOVE.L  #21, D0
            TRAP    #15
            RTS
            
; -----------------------------------------------------------------------------
INITSCRN:   
; [_INTERNAL API] 
; Input    - WIDTH:   +8(A7)
;          - HEIGHT:  +4(A7)
; Output   - NONE
; Modifies - CURRENT TEXT COLOR, D1.L, D2.L, D0.L
; -----------------------------------------------------------------------------
            MOVE.L  4(A7), D1
            LSL.L   #8,D1
            LSL.L   #8,D1
            OR.L    8(A7), D1
            MOVE.L  #33, D0
            TRAP    #15






; -----------------------------------------------------------------------------
SETTXTPR:   
; [_INTERNAL API] SETS THE CURRENT TEXT SIZE
; Input    - RED:   +24(A7)
;          - GREEN: +20(A7)
;          - BLUE:  +16(A7)
;          - SIZE:  +12(A7)
;          - FONT:  +8(A7)
;          - STYLE: +4(A7)
; Output   - NONE
; Modifies - CURRENT TEXT SIZE, D1.L, D2.L, D0.L
; -----------------------------------------------------------------------------
            SETCOL  24(A7), 20(A7), 16(A7)            
            MOVE.L  8(A7), D2              ; FONT
            LSL.L   #8, D2
            LSL.L   #8, D2
            LSL.L   #8, D2
            
            MOVE.L  12(A7), D0              ; SIZE
            AND.L   #$000000FF, D0
            LSL.L   #8, D0
            LSL.L   #8, D0
            OR.L    D0, D2
            
            MOVE.L  4(A7), D0              ; STYLE
            AND.L   #$000000FF, D0
            OR.L    D0, D2
            MOVE.L  #21, D0
            TRAP    #15
            RTS





*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~8~
