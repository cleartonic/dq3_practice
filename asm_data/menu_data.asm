;;;;; DEBUG MENU ;;;;;

; WARP
org $FED009
db $a7, $91, $a2, $a0, $01, $01, $01

; OUTSIDE - 8
org $FED011
db $9f, $a5, $a4, $a3, $99, $94, $95, $01

; NIGHT - 9
org $FED01A
db $9e, $99, $97, $98, $a4, $01, $01, $01, $01
; KEY - 3
org $FED024
db $9b, $95, $a9
; LEVEL - 6
org $FED028
db $9c, $95, $a6, $95, $9c, $01
; NULL - 5
org $FED02F
db $9e, $a5, $9c, $9c, $01
; TYPE - 4
org $FED035 
db $a4, $a9, $a0, $95
; GIL - 3
org $FED03A
db $97, $99, $9c

; PRESETS
org $FED03E
db $a0, $a2, $95, $a3, $95, $a4, $a3

; STATUS - 7
org $FED046
db $a3, $a4, $91, $a4, $a5, $a3, $01

; DATA - 8
org $FED04E
db $94, $91, $a4, $91, $01, $01, $01, $01
; FILBAG - 6
org $FED057
db $96, $99, $9c, $92, $91, $97
; SETENEMY - 8
org $FED05E
db $a3, $95, $a4, $95, $9e, $95, $9d, $a9
; GOFIGHT - 7
org $FED067
db $97, $9f, $96, $99, $97, $98, $a4
; VIEWENEM - 8
org $FED06F
db $a6, $99, $95, $a7, $95, $9e, $95, $9d
; HEAL - 6
org $FED078
db $98, $95, $91, $9c, $01, $01
; PROGSTART - 9
org $FED07F
db $a0, $a2, $9f, $97, $a3, $a4, $91, $a2, $a4
; SONG - 4
org $FED089
db $a3, $9f, $9e, $97
; COLLIDE - 7 collision
org $FED08E
db $93, $9f, $9c, $9c, $99, $94, $95
; NO ENKAS enka disable - 10
org $FED096
db $9e, $9f, $01, $95, $9e, $9b, $91, $a3, $01, $01
; FLOOR SETUP - 11
org $FED0A1
db $96, $9c, $9f, $9f, $a2, $01, $a3, $95, $a4, $a5, $a0
; COORD - 9
org $FED0AD
db $93, $9f, $9f, $a2, $94, $01, $A2, $01, $01
; SPRITE - 6
org $FED0B7
db $a3, $a0, $a2, $99, $a4, $95
; ROM DATA - 8
org $FED0BE
db $a2, $9f, $9d, $01, $94, $91, $a4, $91
; CREDIT - 6
org $FED0C7
db $93, $a2, $95, $94, $99, $a4
; XSTAFF - 6
org $FED0CE
db $a8, $a3, $a4, $91, $96, $96



;;;;; FLAG SHOP ;;;;;
; 1) -> Zoma text 

; db $a0, $9f, $a3, $a4, $70, $a0, $a9, $a2, $91

; db $a0, $9f, $a3, $a4, $70, $9b, $88

; db $a0, $9f, $a3, $a4, $70, $9b, $89

; db $a3, $99, $9f, $a5, $a8, $70, $89

; db $a0, $9f, $a3, $a4, $70, $97, $a2, $99, $9e, $94

; db $a3, $91, $9d, $91, $9e, $9f, $a3, $91

; db $a0, $9f, $a3, $a4, $70, $a4, $a2, $9f, $9c, $9c

; db $a3, $99, $9c, $a6, $70, $9f, $a2, $92

; db $a2, $91, $9d, $99, $91

org $FEE628
db $a0, $9f, $a3, $a4, $01, $a0, $a9, $a2, $91, $AC
; org $FEE631
db $a0, $9f, $a3, $a4, $01, $9b, $88, $01, $01, $01, $01, $01, $AC
; org $FEE63E
db $a0, $9f, $a3, $a4, $01, $9b, $89, $01, $01, $01, $01, $01, $AC
; org $FEE64A
db $a3, $99, $9f, $a5, $a8, $01, $89, $01, $01, $01, $01, $AC
; org $FEE655
db $a0, $9f, $a3, $a4, $01, $97, $a2, $99, $9e, $94, $AC
; org $FEE662
db $a3, $91, $9d, $91, $9e, $9f, $a3, $91, $01, $01, $01, $AC
; org $FEE66F 
db $a0, $9f, $a3, $a4, $01, $a4, $a2, $9f, $9c, $9c, $01, $AC
; org $FEE67B
db $a3, $99, $9c, $a6, $01, $9f, $a2, $92, $01, $01, $01, $01, $AC
; org $FEE686
db $a2, $91, $9d, $99, $91, $01, $01, $01, $AC
; org $FEE692
db $a0, $9f, $a3, $a4, $01, $92, $91, $a2, $91, $01, $01, $AC
; org $FEE69E
db $92, $91, $a2, $91, $9d, $9f, $a3, $01, $01, $01, $01, $01, $AC
; org $FEE6AB
db $91, $9c, $a4, $91, $a2, $01, $9b, $a3, $01, $93, $a5, $a4, $AC

db $91, $9c, $a4, $91, $a2, $01, $9b, $a3, $AC

padbyte $AC
pad $FEE6D0
db $01, $AC, $01, $AC, $A6, $87
