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
	.globl _load_enemy
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
	C$combat.c$3$0_0$104	= .
	.globl	C$combat.c$3$0_0$104
;src/combat.c:3: void init_combat(uint8_t combat_group,struct slot sl1,struct slot sl2,struct slot sl3){
;	---------------------------------
; Function init_combat
; ---------------------------------
_init_combat::
	add	sp, #-5
	ld	c, a
	C$combat.c$5$5_0$107	= .
	.globl	C$combat.c$5$5_0$107
;src/combat.c:5: for(i=0;i<MAX_COMBAT_GROUP_SIZE;i++){
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_combat_groups
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#4
	ld	(hl), #0x00
00108$:
	C$combat.c$7$3_0$105	= .
	.globl	C$combat.c$7$3_0$105
;src/combat.c:7: if(combat_groups[combat_group][i]!=0){
	pop	de
	push	de
	ldhl	sp,	#4
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	or	a, a
	jp	Z, 00109$
	C$combat.c$8$4_0$106	= .
	.globl	C$combat.c$8$4_0$106
;src/combat.c:8: load_enemy(combat_groups[combat_group][i],i);
	inc	hl
	ld	e, (hl)
	ld	a, c
	call	_load_enemy
	C$combat.c$9$4_0$106	= .
	.globl	C$combat.c$9$4_0$106
;src/combat.c:9: switch(i){
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
	ldhl	sp,	#4
	ld	a, (hl)
	dec	a
	jp	Z,00102$
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x02
	jp	Z,00103$
	jp	00109$
	C$combat.c$10$5_0$107	= .
	.globl	C$combat.c$10$5_0$107
;src/combat.c:10: case 0:
00101$:
	C$combat.c$11$5_0$107	= .
	.globl	C$combat.c$11$5_0$107
;src/combat.c:11: sl1.id = combat_groups[combat_group][i];
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl), a
	C$combat.c$12$5_0$107	= .
	.globl	C$combat.c$12$5_0$107
;src/combat.c:12: sl1.max_hp = e_con[sl1.id]/4*10;
	ld	c, (hl)
	ld	hl, #_e_con
	ld	b, #0x00
	add	hl, bc
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#2
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	bit	7, b
	jr	Z, 00112$
	dec	hl
	inc	bc
	inc	bc
	inc	bc
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00112$:
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	ld	a, c
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	ldhl	sp,	#24
	ld	(hl), a
	C$combat.c$13$5_0$107	= .
	.globl	C$combat.c$13$5_0$107
;src/combat.c:13: sl1.hp = sl1.max_hp;
	ld	a, (hl+)
	ld	(hl), a
	C$combat.c$14$5_0$107	= .
	.globl	C$combat.c$14$5_0$107
;src/combat.c:14: sl1.max_mp = e_int[sl1.id]/5*10;
	ldhl	sp,	#7
	ld	c, (hl)
	ld	hl, #_e_int
	ld	b, #0x00
	add	hl, bc
	ld	e, (hl)
	ld	d, #0x00
	ld	bc, #0x0005
	call	__divsint
	ld	a, c
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	ldhl	sp,	#26
	ld	(hl), a
	C$combat.c$15$5_0$107	= .
	.globl	C$combat.c$15$5_0$107
;src/combat.c:15: sl1.mp = sl1.max_mp;
	ld	a, (hl+)
	ld	(hl), a
	C$combat.c$16$5_0$107	= .
	.globl	C$combat.c$16$5_0$107
;src/combat.c:16: sl1.e_str = e_str[sl1.id];
	ldhl	sp,	#7
	ld	c, (hl)
	ld	hl, #_e_str
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
	C$combat.c$17$5_0$107	= .
	.globl	C$combat.c$17$5_0$107
;src/combat.c:17: sl1.e_agi = e_agi[sl1.id];
	ldhl	sp,	#7
	ld	c, (hl)
	ld	hl, #_e_agi
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#29
	ld	(hl), a
	C$combat.c$18$5_0$107	= .
	.globl	C$combat.c$18$5_0$107
;src/combat.c:18: sl1.e_int = e_int[sl1.id];
	ldhl	sp,	#7
	ld	c, (hl)
	ld	hl, #_e_int
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#30
	ld	(hl), a
	C$combat.c$19$5_0$107	= .
	.globl	C$combat.c$19$5_0$107
;src/combat.c:19: break;
	jp	00109$
	C$combat.c$21$5_0$107	= .
	.globl	C$combat.c$21$5_0$107
;src/combat.c:21: case 1:
00102$:
	C$combat.c$22$5_0$107	= .
	.globl	C$combat.c$22$5_0$107
;src/combat.c:22: sl2.id = combat_groups[combat_group][i];
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#31
	ld	(hl), a
	C$combat.c$23$5_0$107	= .
	.globl	C$combat.c$23$5_0$107
;src/combat.c:23: sl2.max_hp = e_con[sl2.id]/4*10;
	ld	c, (hl)
	ld	hl, #_e_con
	ld	b, #0x00
	add	hl, bc
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	bit	7, b
	jr	Z, 00113$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
00113$:
	sra	h
	rr	l
	sra	h
	rr	l
	ld	a, l
	ld	c, a
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	ldhl	sp,	#48
	ld	(hl), a
	C$combat.c$24$5_0$107	= .
	.globl	C$combat.c$24$5_0$107
;src/combat.c:24: sl2.hp = sl2.max_hp;
	ld	a, (hl+)
	ld	(hl), a
	C$combat.c$25$5_0$107	= .
	.globl	C$combat.c$25$5_0$107
;src/combat.c:25: sl2.max_mp = e_int[sl2.id]/5*10;
	ldhl	sp,	#31
	ld	c, (hl)
	ld	hl, #_e_int
	ld	b, #0x00
	add	hl, bc
	ld	e, (hl)
	ld	d, #0x00
	ld	bc, #0x0005
	call	__divsint
	ld	a, c
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	ldhl	sp,	#50
	ld	(hl), a
	C$combat.c$26$5_0$107	= .
	.globl	C$combat.c$26$5_0$107
;src/combat.c:26: sl2.mp = sl2.max_mp;
	ld	a, (hl+)
	ld	(hl), a
	C$combat.c$27$5_0$107	= .
	.globl	C$combat.c$27$5_0$107
;src/combat.c:27: sl2.e_str = e_str[sl2.id];
	ldhl	sp,	#31
	ld	c, (hl)
	ld	hl, #_e_str
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#52
	ld	(hl), a
	C$combat.c$28$5_0$107	= .
	.globl	C$combat.c$28$5_0$107
;src/combat.c:28: sl2.e_agi = e_agi[sl2.id];
	ldhl	sp,	#31
	ld	c, (hl)
	ld	hl, #_e_agi
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#53
	ld	(hl), a
	C$combat.c$29$5_0$107	= .
	.globl	C$combat.c$29$5_0$107
;src/combat.c:29: sl2.e_int = e_int[sl2.id];
	ldhl	sp,	#31
	ld	c, (hl)
	ld	hl, #_e_int
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#54
	ld	(hl), a
	C$combat.c$30$5_0$107	= .
	.globl	C$combat.c$30$5_0$107
;src/combat.c:30: break;
	jr	00109$
	C$combat.c$32$5_0$107	= .
	.globl	C$combat.c$32$5_0$107
;src/combat.c:32: case 2:
00103$:
	C$combat.c$33$5_0$107	= .
	.globl	C$combat.c$33$5_0$107
;src/combat.c:33: sl3.id = combat_groups[combat_group][i];
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#55
	ld	(hl), a
	C$combat.c$34$5_0$107	= .
	.globl	C$combat.c$34$5_0$107
;src/combat.c:34: sl3.max_hp = e_con[sl3.id]/4*10;
	ld	c, (hl)
	ld	hl, #_e_con
	ld	b, #0x00
	add	hl, bc
	ld	l, (hl)
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	c, l
	ld	b, h
	bit	7, h
	jr	Z, 00114$
	inc	hl
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
00114$:
	sra	b
	rr	c
	sra	b
	rr	c
	ld	a, c
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	ldhl	sp,	#72
	ld	(hl), a
	C$combat.c$35$5_0$107	= .
	.globl	C$combat.c$35$5_0$107
;src/combat.c:35: sl3.hp = sl3.max_hp;
	ld	a, (hl+)
	ld	(hl), a
	C$combat.c$36$5_0$107	= .
	.globl	C$combat.c$36$5_0$107
;src/combat.c:36: sl3.max_mp = e_int[sl3.id]/5*10;
	ldhl	sp,	#55
	ld	c, (hl)
	ld	hl, #_e_int
	ld	b, #0x00
	add	hl, bc
	ld	e, (hl)
	ld	d, #0x00
	ld	bc, #0x0005
	call	__divsint
	ld	a, c
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	ldhl	sp,	#74
	ld	(hl), a
	C$combat.c$37$5_0$107	= .
	.globl	C$combat.c$37$5_0$107
;src/combat.c:37: sl3.mp = sl3.max_mp;
	ld	a, (hl+)
	ld	(hl), a
	C$combat.c$38$5_0$107	= .
	.globl	C$combat.c$38$5_0$107
;src/combat.c:38: sl3.e_str = e_str[sl3.id];
	ldhl	sp,	#55
	ld	c, (hl)
	ld	hl, #_e_str
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#76
	ld	(hl), a
	C$combat.c$39$5_0$107	= .
	.globl	C$combat.c$39$5_0$107
;src/combat.c:39: sl3.e_agi = e_agi[sl3.id];
	ldhl	sp,	#55
	ld	c, (hl)
	ld	hl, #_e_agi
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#77
	ld	(hl), a
	C$combat.c$40$5_0$107	= .
	.globl	C$combat.c$40$5_0$107
;src/combat.c:40: sl3.e_int = e_int[sl3.id];
	ldhl	sp,	#55
	ld	c, (hl)
	ld	hl, #_e_int
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#78
	ld	(hl), a
	C$combat.c$43$3_0$105	= .
	.globl	C$combat.c$43$3_0$105
;src/combat.c:43: }
00109$:
	C$combat.c$5$2_0$104	= .
	.globl	C$combat.c$5$2_0$104
;src/combat.c:5: for(i=0;i<MAX_COMBAT_GROUP_SIZE;i++){
	ldhl	sp,	#4
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x03
	jp	C, 00108$
	C$combat.c$46$2_0$104	= .
	.globl	C$combat.c$46$2_0$104
;src/combat.c:46: }
	add	sp, #5
	pop	hl
	add	sp, #72
	jp	(hl)
	G$combat_view_upd$0$0	= .
	.globl	G$combat_view_upd$0$0
	C$combat.c$47$2_0$110	= .
	.globl	C$combat.c$47$2_0$110
;src/combat.c:47: void combat_view_upd(uint8_t joypad_current, uint8_t joypad_previous ){
;	---------------------------------
; Function combat_view_upd
; ---------------------------------
_combat_view_upd::
	C$combat.c$49$2_0$110	= .
	.globl	C$combat.c$49$2_0$110
;src/combat.c:49: }
	C$combat.c$49$2_0$110	= .
	.globl	C$combat.c$49$2_0$110
	XG$combat_view_upd$0$0	= .
	.globl	XG$combat_view_upd$0$0
	ret
	.area _CODE
G$combat_groups$0_0$0 == .
_combat_groups:
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.area _INITIALIZER
	.area _CABS (ABS)
