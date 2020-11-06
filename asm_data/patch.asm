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

incsrc asm_data/active_party.asm
incsrc asm_data/party_data.asm
incsrc asm_data/event_flags.asm
incsrc asm_data/bag_items.asm
incsrc asm_data/menu_data.asm
incsrc asm_data/flag_setup.asm

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





