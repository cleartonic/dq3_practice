hirom

!scratchram0 = $3800
!scratchram1 = $3802
!scratchram2 = $3804
!scratchram3 = $3806
!scratchram4 = $3808
!nextwarptile = $9D59
!nextwarptile2 = $9D5B
; !nextwarptile3 = $9D5D
; !nextwarptile4 = $9D5F
; !nextwarptile5 = $9D61
; !nextwarptile6 = $9D63
; !nextwarptile7 = $9D65
; !nextwarptile8 = $9D67
; !nextwarptile9 = $9D69
; !nextwarptile10 = $9D6B
; !nextwarptile11 = $9D6D
; !nextwarptile12 = $9D6F

incsrc active_party.asm
incsrc party_data.asm
incsrc event_flags.asm
incsrc bag_items.asm

if !japanese == 1
    print "JAPANESE"
    incsrc menu_data_j.asm
else
    print "ENGLISH"
    incsrc menu_data.asm
endif

incsrc flag_setup.asm

; enable debug menu
org $c6fffa
nop
nop
nop
nop
nop

org $C1FFFE
db $FF, $FF

org $c4653a
db $80 ; changes this to bmi instead of bpl

org $c76e91
nop
nop





