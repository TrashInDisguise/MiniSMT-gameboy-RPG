;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (Linux)
;--------------------------------------------------------
	.module enemies
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_sprite_data
	.globl _enemies_tileset
	.globl _enemies_names
	.globl _enemies
	.globl _load_enemy
	.globl _unload_enemy
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
	G$load_enemy$0$0	= .
	.globl	G$load_enemy$0$0
	C$enemies.c$48$0_0$101	= .
	.globl	C$enemies.c$48$0_0$101
;src/enemies.c:48: void load_enemy(uint8_t enemy_id, uint8_t enemy_slot){
;	---------------------------------
; Function load_enemy
; ---------------------------------
_load_enemy::
	add	sp, #-6
	ld	c, a
	ldhl	sp,	#4
	ld	(hl), e
	C$enemies.c$50$2_0$101	= .
	.globl	C$enemies.c$50$2_0$101
;src/enemies.c:50: uint8_t x = 0;
	ldhl	sp,	#0
	ld	(hl), #0x00
	C$enemies.c$51$1_0$101	= .
	.globl	C$enemies.c$51$1_0$101
;src/enemies.c:51: switch(enemy_slot){
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
	ldhl	sp,	#4
	ld	a, (hl)
	dec	a
	jr	Z, 00102$
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00103$
	jr	00104$
	C$enemies.c$52$2_0$102	= .
	.globl	C$enemies.c$52$2_0$102
;src/enemies.c:52: case 0:
00101$:
	C$enemies.c$53$2_0$102	= .
	.globl	C$enemies.c$53$2_0$102
;src/enemies.c:53: x = SLOT0_X;
	ldhl	sp,	#0
	ld	(hl), #0x28
	C$enemies.c$54$2_0$102	= .
	.globl	C$enemies.c$54$2_0$102
;src/enemies.c:54: break;
	jr	00129$
	C$enemies.c$55$2_0$102	= .
	.globl	C$enemies.c$55$2_0$102
;src/enemies.c:55: case 1:
00102$:
	C$enemies.c$56$2_0$102	= .
	.globl	C$enemies.c$56$2_0$102
;src/enemies.c:56: x = SLOT1_X;
	ldhl	sp,	#0
	ld	(hl), #0x4c
	C$enemies.c$57$2_0$102	= .
	.globl	C$enemies.c$57$2_0$102
;src/enemies.c:57: break;
	jr	00129$
	C$enemies.c$58$2_0$102	= .
	.globl	C$enemies.c$58$2_0$102
;src/enemies.c:58: case 2:
00103$:
	C$enemies.c$59$2_0$102	= .
	.globl	C$enemies.c$59$2_0$102
;src/enemies.c:59: x = SLOT2_X;
	ldhl	sp,	#0
	ld	(hl), #0x70
	C$enemies.c$60$2_0$102	= .
	.globl	C$enemies.c$60$2_0$102
;src/enemies.c:60: break;
	jr	00129$
	C$enemies.c$61$2_0$102	= .
	.globl	C$enemies.c$61$2_0$102
;src/enemies.c:61: default:
00104$:
	C$enemies.c$62$2_0$102	= .
	.globl	C$enemies.c$62$2_0$102
;src/enemies.c:62: enemy_slot = 0;
	ldhl	sp,	#4
	ld	(hl), #0x00
	C$enemies.c$65$2_0$101	= .
	.globl	C$enemies.c$65$2_0$101
;src/enemies.c:65: for (i=0;i<9;i++){
00129$:
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_enemies
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#5
	ld	(hl), #0x00
00116$:
	C$enemies.c$66$3_0$104	= .
	.globl	C$enemies.c$66$3_0$104
;src/enemies.c:66: set_sprite_data(ENEMIES_MEMORY_BASE_ADDRESS+(enemy_slot*9)+i,1,enemies_tileset+(enemies[enemy_id][i]*16));
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_enemies_tileset)
	ld	e, a
	ld	a, h
	adc	a, #>(_enemies_tileset)
	ldhl	sp,	#2
	ld	(hl), e
	inc	hl
	ld	(hl+), a
	ld	a, (hl)
	ld	e, a
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x65
	ldhl	sp,	#5
	ld	e, (hl)
	add	a, e
	ldhl	sp,	#2
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
	C$enemies.c$65$2_0$103	= .
	.globl	C$enemies.c$65$2_0$103
;src/enemies.c:65: for (i=0;i<9;i++){
	ldhl	sp,	#5
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x09
	jr	C, 00116$
	C$enemies.c$68$2_0$101	= .
	.globl	C$enemies.c$68$2_0$101
;src/enemies.c:68: for (i=0;i<3;i++){
	ld	b, #0x00
00118$:
	C$enemies.c$69$3_0$106	= .
	.globl	C$enemies.c$69$3_0$106
;src/enemies.c:69: j=i+enemy_slot*9;
	ld	a, b
	ldhl	sp,	#1
	add	a, (hl)
;src/enemies.c:70: set_sprite_tile(j,ENEMIES_MEMORY_BASE_ADDRESS+j);
	ld	e, a
	add	a, #0x65
	ld	c, a
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	ld	(hl), c
;src/enemies.c:71: move_sprite(j,x+i*8,SLOTS_Y);
	ld	a, b
	add	a, a
	add	a, a
	add	a, a
	ldhl	sp,	#0
	ld	c, (hl)
	add	a, c
	ldhl	sp,	#5
	ld	(hl), a
;../gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, de
;../gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x50
	ld	(hl+), a
	ld	e, l
	ld	d, h
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(de), a
	C$enemies.c$68$2_0$105	= .
	.globl	C$enemies.c$68$2_0$105
;src/enemies.c:68: for (i=0;i<3;i++){
	inc	b
	ld	a, b
	sub	a, #0x03
	jr	C, 00118$
	C$enemies.c$73$2_0$101	= .
	.globl	C$enemies.c$73$2_0$101
;src/enemies.c:73: for (i=0;i<3;i++){
	ld	(hl), #0x00
00120$:
	C$enemies.c$74$3_0$108	= .
	.globl	C$enemies.c$74$3_0$108
;src/enemies.c:74: j=i+enemy_slot*9;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#1
	add	a, (hl)
;src/enemies.c:75: set_sprite_tile(j+3,ENEMIES_MEMORY_BASE_ADDRESS+j+3);
	inc	hl
	ld	e, a
	add	a, #0x68
	ld	(hl+), a
	ld	a, e
	add	a, #0x03
	ld	(hl), a
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
;src/enemies.c:76: move_sprite(j+3,x+i*8,SLOTS_Y+8);
	ldhl	sp,	#5
	ld	a, (hl-)
	dec	hl
	add	a, a
	add	a, a
	add	a, a
	add	a, c
	ld	b, a
;../gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;../gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x58
	ld	(hl+), a
	ld	(hl), b
	C$enemies.c$73$2_0$107	= .
	.globl	C$enemies.c$73$2_0$107
;src/enemies.c:73: for (i=0;i<3;i++){
	ldhl	sp,	#5
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00120$
	C$enemies.c$79$2_0$101	= .
	.globl	C$enemies.c$79$2_0$101
;src/enemies.c:79: for (i=0;i<3;i++){
	ld	(hl), #0x00
00122$:
	C$enemies.c$80$3_0$110	= .
	.globl	C$enemies.c$80$3_0$110
;src/enemies.c:80: j=i+enemy_slot*9;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#1
	add	a, (hl)
;src/enemies.c:81: set_sprite_tile(j+6,ENEMIES_MEMORY_BASE_ADDRESS+j+6);
	inc	hl
	ld	e, a
	add	a, #0x6b
	ld	(hl+), a
	ld	a, e
	add	a, #0x06
	ld	(hl), a
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
;src/enemies.c:82: move_sprite(j+6,x+i*8,SLOTS_Y+16);
	ldhl	sp,	#5
	ld	a, (hl-)
	dec	hl
	add	a, a
	add	a, a
	add	a, a
	add	a, c
	ld	b, a
;../gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;../gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x60
	ld	(hl+), a
	ld	(hl), b
	C$enemies.c$79$2_0$109	= .
	.globl	C$enemies.c$79$2_0$109
;src/enemies.c:79: for (i=0;i<3;i++){
	ldhl	sp,	#5
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00122$
	C$enemies.c$84$2_0$101	= .
	.globl	C$enemies.c$84$2_0$101
;src/enemies.c:84: }
	add	sp, #6
	C$enemies.c$84$2_0$101	= .
	.globl	C$enemies.c$84$2_0$101
	XG$load_enemy$0$0	= .
	.globl	XG$load_enemy$0$0
	ret
G$enemies$0_0$0 == .
_enemies:
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x15	; 21
G$enemies_names$0_0$0 == .
_enemies_names:
	.ascii "Test 1"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "Test 2"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
G$enemies_tileset$0_0$0 == .
_enemies_tileset:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	G$unload_enemy$0$0	= .
	.globl	G$unload_enemy$0$0
	C$enemies.c$85$2_0$131	= .
	.globl	C$enemies.c$85$2_0$131
;src/enemies.c:85: void unload_enemy(uint8_t enemy_slot){
;	---------------------------------
; Function unload_enemy
; ---------------------------------
_unload_enemy::
	dec	sp
	dec	sp
	ldhl	sp,	#0
	C$enemies.c$87$3_0$132	= .
	.globl	C$enemies.c$87$3_0$132
;src/enemies.c:87: for (i=0;i<9;i++){
	ld	(hl+), a
	ld	(hl), #0x00
00104$:
	C$enemies.c$88$3_0$132	= .
	.globl	C$enemies.c$88$3_0$132
;src/enemies.c:88: j=i+enemy_slot*9;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	c, a
	add	a, a
	add	a, a
	add	a, a
	add	a, c
	ld	c, (hl)
	add	a, c
	C$enemies.c$89$3_0$132	= .
	.globl	C$enemies.c$89$3_0$132
;src/enemies.c:89: set_sprite_data(ENEMIES_MEMORY_BASE_ADDRESS+j,1,enemies_tileset);
	ld	c, a
	ld	de, #_enemies_tileset
	add	a, #0x65
	ld	b, a
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;src/enemies.c:90: set_sprite_tile(j,ENEMIES_MEMORY_BASE_ADDRESS+j);
	ld	e, b
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl,#_shadow_OAM + 1
	add	hl,bc
	inc	hl
	ld	(hl), e
;../gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, bc
;../gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	C$enemies.c$87$2_0$131	= .
	.globl	C$enemies.c$87$2_0$131
;src/enemies.c:87: for (i=0;i<9;i++){
	ldhl	sp,	#1
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x09
	jr	C, 00104$
	C$enemies.c$93$2_0$131	= .
	.globl	C$enemies.c$93$2_0$131
;src/enemies.c:93: }
	inc	sp
	inc	sp
	C$enemies.c$93$2_0$131	= .
	.globl	C$enemies.c$93$2_0$131
	XG$unload_enemy$0$0	= .
	.globl	XG$unload_enemy$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
