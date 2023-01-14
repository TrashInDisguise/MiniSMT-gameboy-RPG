;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (Linux)
;--------------------------------------------------------
	.module combat
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _combat_groups
	.globl _init_combat
	.globl _combat_view_upd
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	G$init_combat$0$0	= .
	.globl	G$init_combat$0$0
	C$combat.c$3$0_0$103	= .
	.globl	C$combat.c$3$0_0$103
;src/combat.c:3: void init_combat(uint8_t combat_group){
;	---------------------------------
; Function init_combat
; ---------------------------------
_init_combat::
	C$combat.c$5$0_0$103	= .
	.globl	C$combat.c$5$0_0$103
;src/combat.c:5: }
	C$combat.c$5$0_0$103	= .
	.globl	C$combat.c$5$0_0$103
	XG$init_combat$0$0	= .
	.globl	XG$init_combat$0$0
	ret
	G$combat_view_upd$0$0	= .
	.globl	G$combat_view_upd$0$0
	C$combat.c$6$0_0$105	= .
	.globl	C$combat.c$6$0_0$105
;src/combat.c:6: void combat_view_upd(){
;	---------------------------------
; Function combat_view_upd
; ---------------------------------
_combat_view_upd::
	C$combat.c$8$0_0$105	= .
	.globl	C$combat.c$8$0_0$105
;src/combat.c:8: }
	C$combat.c$8$0_0$105	= .
	.globl	C$combat.c$8$0_0$105
	XG$combat_view_upd$0$0	= .
	.globl	XG$combat_view_upd$0$0
	ret
	.area _CODE
G$combat_groups$0_0$0 == .
_combat_groups:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
