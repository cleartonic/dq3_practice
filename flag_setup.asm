; generic handler for setting up flags
; a and x are used for tables
; y is loaded from previous function for correct offset
;   for the relevant flags to set
org $C0FE00
FlagHandler:
phb
phx
phy
pha

; first set scratch ram
;;;;;;;;;;;;;;;; TO DO ;;;;;;;;;;;;;;;;

; sep #$30
; enter 8 bit mode


; a - number of bytes to move IN 16 BIT MODE, minus 1
; source address is: first 2 bytes of mvn, then ldx last 4 bytes
; destination address is: last 2 bytes of mvn, then ldy last 4 bytes

; LoopActivePartySetup:
lda #$005F
ldx !scratchram0
ldy #$36E0
mvn $C17E

; LoopPartyDataSetup:
lda #$01FF
ldx !scratchram1
ldy #$3925
mvn $C27E

; LoopEventFlagsSetup:
lda #$007F
ldx !scratchram2
ldy #$353A
mvn $C37E

; LoopEventBagSetup:
lda #$001F
ldx !scratchram3
ldy #$3725
mvn $C47E

; LoopEventBagCountSetup:
lda #$001F
ldx !scratchram4
ldy #$3825
mvn $C47E

; Fill gold
lda #$FFFF
sta $3696

stz !scratchram0
stz !scratchram1
stz !scratchram2
stz !scratchram3
stz !scratchram4

clc
pla
ply
plx
plb

; TRYING THIS OUT? setting x to 2 seems to fix warping issues
pha
lda #$0002
tax
pla


rts







; relocate first warp function to be Aliahan warp
org $C808C9
db $EC, $6B, $CA












; INTRO
; org $fed441
; pha

; lda $7E3945
; and #$0F
; sta $7E3945

; pla
; nop
; nop
; nop













; old code for setting preset flags
; lda #$0000
; ldx #$0000
; LoopActivePartySetup:
; lda $c1E800, x
; sta $7E36E0, x
; inx
; inx
; cpx #$0060
; bne LoopActivePartySetup

; lda #$0000
; ldx #$0000
; LoopPartyDataSetup:
; lda $C2D150, x
; sta $7E3925, x
; inx
; inx
; cpx #$0200
; bne LoopPartyDataSetup

; lda #$0000
; ldx #$0000
; LoopEventFlagsSetup:
; lda $C3F310, x
; sta $7E353A, x
; inx
; inx
; cpx #$0080
; bne LoopEventFlagsSetup














;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;; FLAG SETUP ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; steps to make a new flag
; - dump data from lua script into the three data asm files (party, party, events)
; - find function in C8F7E7 to replace in warp_setup.asm
; - create a new function below in C0F300 area 
; - setup scratchram with the appropriate x values used in the FlagHandler func
; -     get this from the google sheet using the formula
; -     and follow the first example
; - set up warp tiles from !nextwarptile using lua script data
;   - the function below will warp there immediately
;   - need to find the stairs warp using 001D9A and the first function called
;   -     example: C61A5C for aliahan 2nd floor
;   -     example: C619BC for ZOMA
;   -     c61cb2 for Isis in
;       NOTE - You also need to pay attention to which of the warptiles are getting called
;               Look at 7E9DXX area
;               You current function however is manually setting x = 0002, which should work
; - finally, in the first functions before FlagHandler, the Rura lists are hardcoded
; - they are 3 byte arrays 

; 4 - POST PYRA
org $C8F7E7 ; data used for indirect event function
db $00, $F3, $c0
org $C0F300
pha
; data offsets

lda #$E800
sta !scratchram0
lda #$D150
sta !scratchram1
lda #$F310
sta !scratchram2
lda #$F820
sta !scratchram3
lda #$F840
sta !scratchram4


; warp tile
lda #$000D
sta !nextwarptile
sta !nextwarptile2
; rura locations
lda #$0067
sta $3680
lda #$0000
sta $3682
; flags
pla
jsr FlagHandler
; warp
jml $c61cb2
rtl ; safety rtl



; 5 - POST K1
org $C8F7EC ; data used for indirect event function
db $40, $F3, $c0
org $C0F340

pha
; data offsets
lda #$E860
sta !scratchram0
lda #$D350
sta !scratchram1
lda #$F390
sta !scratchram2
lda #$F860
sta !scratchram3
lda #$F880
sta !scratchram4

; warp tile
lda #$0168
sta !nextwarptile
sta !nextwarptile2
; rura locations
lda #$00EF
sta $3680
lda #$0000
sta $3682
; flags
pla
jsr FlagHandler
; warp
jml $c61cb2
rtl ; safety rtl




; 6 - POST K2
org $C8F7F1 ; data used for indirect event function
db $80, $F3, $c0
org $C0F380

pha
; data offsets

lda #$E8C0
sta !scratchram0
lda #$D550
sta !scratchram1
lda #$F410
sta !scratchram2
lda #$F8A0
sta !scratchram3
lda #$F8C0
sta !scratchram4


; warp tile
lda #$00C7
sta !nextwarptile
sta !nextwarptile2
; rura locations
lda #$01EF
sta $3680
lda #$0000
sta $3682
; flags
pla
jsr FlagHandler
; warp
jml $c61cb2
rtl ; safety rtl










; 7 - SIOUX 2
org $C8F7F6 ; data used for indirect event function

db $C0, $F3, $c0
org $C0F3C0
pha
; data offsets
lda #$E920
sta !scratchram0
lda #$D750
sta !scratchram1
lda #$F490
sta !scratchram2
lda #$F8E0
sta !scratchram3
lda #$F900
sta !scratchram4


; warp tile
lda #$01EC
sta !nextwarptile
sta !nextwarptile2
; rura locations
lda #$5BEF
sta $3680
lda #$0000
sta $3682
; flags
pla
jsr FlagHandler
; warp
jml $c61cb2
rtl ; safety rtl








; 8 - POST GRIND
org $C8F7FB ; data used for indirect event function
db $00, $F4, $c0
org $C0F400
pha
; data offsets
lda #$E980
sta !scratchram0
lda #$D950
sta !scratchram1
lda #$F510
sta !scratchram2
lda #$F920
sta !scratchram3
lda #$F940
sta !scratchram4


; warp tile
lda #$0106
sta !nextwarptile
sta !nextwarptile2
; rura locations
lda #$5BEF
sta $3680
lda #$0000
sta $3682
; flags
pla
jsr FlagHandler
; warp
jml $c61cb2
rtl ; safety rtl









; 9 - SAMANOSA
org $C8F800 ; data used for indirect event function
db $40, $F4, $c0
org $C0F440
pha
; data offsets
lda #$E9E0
sta !scratchram0
lda #$DB50
sta !scratchram1
lda #$F590
sta !scratchram2
lda #$F960
sta !scratchram3
lda #$F980
sta !scratchram4


; warp tile
lda #$01F4
sta !nextwarptile
sta !nextwarptile2
; rura locations
lda #$7FEF
sta $3680
lda #$0000
sta $3682
; flags
pla
jsr FlagHandler
; warp
jml $c61cb2
rtl ; safety rtl

; 10 - POST TROLL
org $C8F805 ; data used for indirect event function
db $80, $F4, $c0
org $C0F480
pha
; data offsets
lda #$EA40
sta !scratchram0
lda #$DD50
sta !scratchram1
lda #$F610
sta !scratchram2
lda #$F9A0
sta !scratchram3
lda #$F9C0
sta !scratchram4



; warp tile
lda #$0093
sta !nextwarptile
sta !nextwarptile2
; rura locations
lda #$7FEF
sta $3680
lda #$0000
sta $3682
; flags
pla
jsr FlagHandler
; warp
jml $C619BC
rtl ; safety rtl




; 11 - SILV ORB
org $C8F80A ; data used for indirect event function
db $C0, $F4, $c0
org $C0F4C0
pha
; data offsets


lda #$EAA0
sta !scratchram0
lda #$DF50
sta !scratchram1
lda #$F690
sta !scratchram2
lda #$F9E0
sta !scratchram3
lda #$FA00
sta !scratchram4


; warp tile
lda #$0206
sta !nextwarptile
sta !nextwarptile2
; rura locations
lda #$7FFF
sta $3680
lda #$0000
sta $3682
; flags
pla
jsr FlagHandler
; warp
jml $c61cb2
rtl ; safety rtl










; 12 - RAMIA
org $C8F80F ; data used for indirect event function
db $00, $F5, $c0
org $C0F500
pha
; data offsets


lda #$EB00
sta !scratchram0
lda #$E150
sta !scratchram1
lda #$F710
sta !scratchram2
lda #$FA20
sta !scratchram3
lda #$FA40
sta !scratchram4

; warp tile
lda #$00EE
sta !nextwarptile
sta !nextwarptile2
; rura locations
lda #$7FFF
sta $3680
lda #$0000
sta $3682
; flags
pla
jsr FlagHandler
; warp
jml $c61cb2
rtl ; safety rtl








; 3 - POST BARA
org $C8F814 ; data used for indirect event function
db $40, $F5, $c0
org $C0F540
pha
; data offsets

lda #$EB60
sta !scratchram0
lda #$E350
sta !scratchram1
lda #$F790
sta !scratchram2
lda #$FA60
sta !scratchram3
lda #$FA80
sta !scratchram4


; warp tile
lda #$0043
sta !nextwarptile
sta !nextwarptile2
; rura locations
lda #$7FFF
sta $3680
lda #$0000
sta $3682
; flags
pla
jsr FlagHandler
; warp
jml $C61A5C
rtl ; safety rtl

; 2 - BARAMOS
org $C8F819 ; data used for indirect event function
db $80, $F5, $c0
org $C0F580
pha
; data offsets
lda #$EBC0
sta !scratchram0
lda #$E550
sta !scratchram1
lda #$F810
sta !scratchram2
lda #$FAA0
sta !scratchram3
lda #$FAC0
sta !scratchram4

; warp tile
lda #$006D
sta !nextwarptile
sta !nextwarptile2
; rura locations
lda #$7FFF
sta $3680
lda #$0000
sta $3682
; flags
pla
jsr FlagHandler
; warp
jml $C619BC
rtl ; safety rtl


; 1 - ZOMA
org $C8F81E ; data used for indirect event function
db $C0, $F5, $c0
org $C0F5C0
pha
; data offsets

lda #$EC20
sta !scratchram0
lda #$E750
sta !scratchram1
lda #$F890
sta !scratchram2
lda #$FAE0
sta !scratchram3
lda #$FB00
sta !scratchram4
; warp tile
lda #$00BD
sta !nextwarptile
sta !nextwarptile2
; rura locations
lda #$7FFF
sta $3680
lda #$0009
sta $3682
; flags
pla
jsr FlagHandler
; warp
jml $C619BC
rtl ; safety rtl




