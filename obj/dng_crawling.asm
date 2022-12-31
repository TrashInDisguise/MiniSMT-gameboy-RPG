;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (Linux)
;--------------------------------------------------------
	.module dng_crawling
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _check_r_walls_w
	.globl _check_r_walls_s
	.globl _check_r_walls_e
	.globl _check_r_walls_n
	.globl _check_l_walls_w
	.globl _check_l_walls_s
	.globl _check_l_walls_e
	.globl _check_l_walls_n
	.globl _check_m_walls
	.globl _return_value
	.globl _set_bkg_tiles
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
;src/dng_crawling.c:9: unsigned char return_value(const unsigned char *dng, uint8_t width, uint8_t height,uint8_t x ,uint8_t y){
;	---------------------------------
; Function return_value
; ---------------------------------
_return_value::
	push	de
	ld	d, a
;src/dng_crawling.c:10: if(y*width + x < height*width)
	push	de
	ld	e, d
	ldhl	sp,	#8
	ld	a, (hl)
	call	__muluchar
	pop	de
	ldhl	sp,	#5
	ld	a, (hl-)
	ld	e, #0x00
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	push	bc
	ld	e, d
	ld	a, (hl)
	call	__muluchar
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	pop	bc
	ld	e, h
	ld	d, b
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	bit	7, e
	jr	Z, 00111$
	bit	7, d
	jr	NZ, 00112$
	cp	a, a
	jr	00112$
00111$:
	bit	7, d
	jr	Z, 00112$
	scf
00112$:
	jr	NC, 00102$
;src/dng_crawling.c:11: return dng[ y*width + x ];
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	jr	00104$
00102$:
;src/dng_crawling.c:13: return NULL;
	xor	a, a
00104$:
;src/dng_crawling.c:14: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:16: void check_m_walls(const unsigned char *dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y ,int8_t dirx, int8_t diry){
;	---------------------------------
; Function check_m_walls
; ---------------------------------
_check_m_walls::
	add	sp, #-9
	ldhl	sp,	#7
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
	ld	(hl), a
;src/dng_crawling.c:17: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(1*dirx), player_y+(1*diry));
	ldhl	sp,	#15
	ld	a, (hl-)
	dec	hl
	ld	c, a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	add	a, c
	ld	e, a
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (hl-)
	add	a, (hl)
	push	bc
	ld	h, e
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#15
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	bc
	ld	e, a
;src/dng_crawling.c:19: if( w == 0x03 && diry == -1 || w == 0x04 && dirx == 1 ||w == 0x05 && diry == 1 || w==0x06 && dirx == -1){
	ld	a, c
	inc	a
	ld	a, #0x01
	jr	Z, 00233$
	xor	a, a
00233$:
	ldhl	sp,	#3
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00235$
	xor	a, a
00235$:
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, c
	dec	a
	ld	a, #0x01
	jr	Z, 00237$
	xor	a, a
00237$:
	ldhl	sp,	#5
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl)
	inc	a
	ld	a, #0x01
	jr	Z, 00239$
	xor	a, a
00239$:
	ld	b, a
;src/dng_crawling.c:18: if( w != 0x00 && w != 0x01){
	ld	a, e
	or	a, a
	jr	Z, 00112$
	ld	a, e
	dec	a
	jr	Z, 00112$
;src/dng_crawling.c:19: if( w == 0x03 && diry == -1 || w == 0x04 && dirx == 1 ||w == 0x05 && diry == 1 || w==0x06 && dirx == -1){
	ld	a, e
	sub	a, #0x03
	jr	NZ, 00106$
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	NZ, 00101$
00106$:
	ld	a, e
	sub	a, #0x04
	jr	NZ, 00108$
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00101$
00108$:
	ld	a, e
	sub	a, #0x05
	jr	NZ, 00110$
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	NZ, 00101$
00110$:
	ld	a, e
	sub	a,#0x06
	jr	NZ, 00102$
	or	a,b
	jr	Z, 00102$
00101$:
;src/dng_crawling.c:20: set_bkg_tiles(4,0,12,9,door1_bkg);
	ld	de, #_door1_bkg
	push	de
	ld	hl, #0x90c
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x04
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/dng_crawling.c:23: return;
	jp	00140$
00102$:
;src/dng_crawling.c:25: set_bkg_tiles(4,0,12,9,wall1_bkg);
	ld	de, #_wall1_bkg
	push	de
	ld	hl, #0x90c
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x04
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/dng_crawling.c:28: return;
	jp	00140$
00112$:
;src/dng_crawling.c:31: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(2*dirx), player_y+(2*diry));
	ld	a, c
	add	a, a
	ldhl	sp,	#0
	add	a, (hl)
	inc	hl
	ld	d, a
	ld	a, (hl+)
	add	a, a
	add	a, (hl)
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#15
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	bc
;src/dng_crawling.c:32: if( w != 0x00 && w != 0x01){
	ld	e,a
	or	a,a
	jr	Z, 00125$
	dec	a
	jr	Z, 00125$
;src/dng_crawling.c:33: if( w == 0x03 && diry == -1 || w == 0x04 && dirx == 1 ||w == 0x05 && diry == 1 || w==0x06 && dirx == -1){
	ld	a, e
	sub	a, #0x03
	jr	NZ, 00119$
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	NZ, 00114$
00119$:
	ld	a, e
	sub	a, #0x04
	jr	NZ, 00121$
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00114$
00121$:
	ld	a, e
	sub	a, #0x05
	jr	NZ, 00123$
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	NZ, 00114$
00123$:
	ld	a, e
	sub	a,#0x06
	jr	NZ, 00115$
	or	a,b
	jr	Z, 00115$
00114$:
;src/dng_crawling.c:34: set_bkg_tiles(6,0,8,9,door2_bkg);
	ld	de, #_door2_bkg
	push	de
	ld	hl, #0x908
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x06
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/dng_crawling.c:37: return;
	jp	00140$
00115$:
;src/dng_crawling.c:39: set_bkg_tiles(6,0,8,9,wall2_bkg);
	ld	de, #_wall2_bkg
	push	de
	ld	hl, #0x908
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x06
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/dng_crawling.c:42: return;
	jr	00140$
00125$:
;src/dng_crawling.c:46: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(3*dirx), player_y+(3*diry));
	ld	a, c
	add	a, a
	add	a, c
	ldhl	sp,	#0
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	add	a, a
	add	a, e
	add	a, (hl)
	push	bc
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#15
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	bc
;src/dng_crawling.c:47: if( w != 0x00 && w != 0x01 ){
	ld	c,a
	or	a,a
	jr	Z, 00140$
	dec	a
	jr	Z, 00140$
;src/dng_crawling.c:48: if( w == 0x03 && diry == -1 || w == 0x04 && dirx == 1 ||w == 0x05 && diry == 1 || w==0x06 && dirx == -1){
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00132$
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	NZ, 00127$
00132$:
	ld	a, c
	sub	a, #0x04
	jr	NZ, 00134$
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00127$
00134$:
	ld	a, c
	sub	a, #0x05
	jr	NZ, 00136$
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	NZ, 00127$
00136$:
	ld	a, c
	sub	a,#0x06
	jr	NZ, 00128$
	or	a,b
	jr	Z, 00128$
00127$:
;src/dng_crawling.c:49: set_bkg_tiles(7,0,6,9,door3_bkg);
	ld	de, #_door3_bkg
	push	de
	ld	hl, #0x906
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x07
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/dng_crawling.c:52: return;
	jr	00140$
00128$:
;src/dng_crawling.c:54: set_bkg_tiles(7,0,6,9,wall3_bkg);
	ld	de, #_wall3_bkg
	push	de
	ld	hl, #0x906
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x07
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/dng_crawling.c:57: return;
00140$:
;src/dng_crawling.c:62: }
	add	sp, #9
	pop	hl
	add	sp, #5
	jp	(hl)
;src/dng_crawling.c:64: void check_l_walls_n(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_l_walls_n
; ---------------------------------
_check_l_walls_n::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:65: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-2);
	ldhl	sp,	#6
	ld	c, (hl)
	ld	a, c
	add	a, #0xfe
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#5
	ld	b, (hl)
	dec	b
	push	bc
	push	de
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:66: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:67: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00102$
;src/dng_crawling.c:68: set_bkg_tiles(6,0,1,9,door3_l_bkg);
	push	de
	ld	hl, #_door3_l_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x06
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00102$:
;src/dng_crawling.c:70: set_bkg_tiles(6,0,1,9,wall3_l_bkg);
	push	de
	ld	hl, #_wall3_l_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x06
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00111$:
;src/dng_crawling.c:73: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-3);
	ld	a, c
	add	a, #0xfd
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:74: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:75: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00105$
;src/dng_crawling.c:76: set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
	push	de
	ld	hl, #_nowall_door3_l_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00105$:
;src/dng_crawling.c:78: set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
	push	de
	ld	hl, #_nowall3_l_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00112$:
;src/dng_crawling.c:82: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
	dec	c
	push	bc
	push	de
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:83: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:84: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00115$
;src/dng_crawling.c:85: set_bkg_tiles(4,0,2,9,door2_l_bkg);
	push	de
	ld	hl, #_door2_l_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x04
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00115$:
;src/dng_crawling.c:87: set_bkg_tiles(4,0,2,9,wall2_l_bkg);
	push	de
	ld	hl, #_wall2_l_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x04
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00124$:
;src/dng_crawling.c:90: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-2);
	push	bc
	push	de
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:91: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:92: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00118$
;src/dng_crawling.c:93: set_bkg_tiles(1,0,5,9,nowall_door2_l_bkg);
	push	de
	ld	hl, #_nowall_door2_l_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00118$:
;src/dng_crawling.c:95: set_bkg_tiles(1,0,5,9,nowall2_l_bkg);
	push	de
	ld	hl, #_nowall2_l_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00125$:
;src/dng_crawling.c:100: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y);
	push	bc
	push	de
	ldhl	sp,	#10
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	c, (hl)
	push	bc
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:101: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:102: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00128$
;src/dng_crawling.c:103: set_bkg_tiles(1,0,3,9,door1_l_bkg);
	ld	de, #_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00128$:
;src/dng_crawling.c:105: set_bkg_tiles(1,0,3,9,wall1_l_bkg);
	ld	de, #_wall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00137$:
;src/dng_crawling.c:108: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	call	_return_value
;src/dng_crawling.c:109: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:110: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00131$
;src/dng_crawling.c:111: set_bkg_tiles(1,0,3,9,nowall_door1_l_bkg);
	ld	de, #_nowall_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00131$:
;src/dng_crawling.c:113: set_bkg_tiles(1,0,3,9,nowall1_l_bkg);
	ld	de, #_nowall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
00140$:
;src/dng_crawling.c:117: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:119: void check_l_walls_e(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_l_walls_e
; ---------------------------------
_check_l_walls_e::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:120: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y-1);
	ldhl	sp,	#6
	ld	a, (hl-)
	ld	b, a
	dec	b
	ld	c, (hl)
	ld	a, c
	add	a, #0x02
	ldhl	sp,	#0
	ld	(hl), a
	push	bc
	push	de
	ld	c, (hl)
	push	bc
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:121: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:122: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00102$
;src/dng_crawling.c:123: set_bkg_tiles(6,0,1,9,door3_l_bkg);
	push	de
	ld	hl, #_door3_l_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x06
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00102$:
;src/dng_crawling.c:125: set_bkg_tiles(6,0,1,9,wall3_l_bkg);
	push	de
	ld	hl, #_wall3_l_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x06
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00111$:
;src/dng_crawling.c:128: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+3, player_y-1);
	ld	a, c
	inc	a
	inc	a
	inc	a
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:129: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:130: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00105$
;src/dng_crawling.c:131: set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
	push	de
	ld	hl, #_nowall_door3_l_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00105$:
;src/dng_crawling.c:133: set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
	push	de
	ld	hl, #_nowall3_l_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00112$:
;src/dng_crawling.c:137: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
	inc	c
	push	bc
	push	de
	push	bc
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:138: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:139: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00115$
;src/dng_crawling.c:140: set_bkg_tiles(4,0,2,9,door2_l_bkg);
	push	de
	ld	hl, #_door2_l_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x04
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00115$:
;src/dng_crawling.c:142: set_bkg_tiles(4,0,2,9,wall2_l_bkg);
	push	de
	ld	hl, #_wall2_l_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x04
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00124$:
;src/dng_crawling.c:145: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y-1);
	push	bc
	push	de
	push	bc
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:146: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:147: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00118$
;src/dng_crawling.c:148: set_bkg_tiles(1,0,5,9,nowall_door2_l_bkg);
	push	de
	ld	hl, #_nowall_door2_l_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00118$:
;src/dng_crawling.c:150: set_bkg_tiles(1,0,5,9,nowall2_l_bkg);
	push	de
	ld	hl, #_nowall2_l_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00125$:
;src/dng_crawling.c:155: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y-1);
	push	bc
	push	de
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:156: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:157: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00128$
;src/dng_crawling.c:158: set_bkg_tiles(1,0,3,9,door1_l_bkg);
	ld	de, #_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00128$:
;src/dng_crawling.c:160: set_bkg_tiles(1,0,3,9,wall1_l_bkg);
	ld	de, #_wall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00137$:
;src/dng_crawling.c:163: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
	push	bc
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	call	_return_value
;src/dng_crawling.c:164: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:165: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00131$
;src/dng_crawling.c:166: set_bkg_tiles(1,0,3,9,nowall_door1_l_bkg);
	ld	de, #_nowall_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00131$:
;src/dng_crawling.c:168: set_bkg_tiles(1,0,3,9,nowall1_l_bkg);
	ld	de, #_nowall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
00140$:
;src/dng_crawling.c:172: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:174: void check_l_walls_s(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_l_walls_s
; ---------------------------------
_check_l_walls_s::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:175: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+2);
	ldhl	sp,	#6
	ld	c, (hl)
	ld	a, c
	add	a, #0x02
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#5
	ld	b, (hl)
	inc	b
	push	bc
	push	de
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:176: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:177: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00102$
;src/dng_crawling.c:178: set_bkg_tiles(6,0,1,9,door3_l_bkg);
	push	de
	ld	hl, #_door3_l_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x06
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00102$:
;src/dng_crawling.c:180: set_bkg_tiles(6,0,1,9,wall3_l_bkg);
	push	de
	ld	hl, #_wall3_l_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x06
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00111$:
;src/dng_crawling.c:183: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+3);
	ld	a, c
	inc	a
	inc	a
	inc	a
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:184: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:185: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00105$
;src/dng_crawling.c:186: set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
	push	de
	ld	hl, #_nowall_door3_l_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00105$:
;src/dng_crawling.c:188: set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
	push	de
	ld	hl, #_nowall3_l_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00112$:
;src/dng_crawling.c:192: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
	inc	c
	push	bc
	push	de
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:193: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:194: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00115$
;src/dng_crawling.c:195: set_bkg_tiles(4,0,2,9,door2_l_bkg);
	push	de
	ld	hl, #_door2_l_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x04
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00115$:
;src/dng_crawling.c:197: set_bkg_tiles(4,0,2,9,wall2_l_bkg);
	push	de
	ld	hl, #_wall2_l_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x04
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00124$:
;src/dng_crawling.c:200: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+2);
	push	bc
	push	de
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:201: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:202: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00118$
;src/dng_crawling.c:203: set_bkg_tiles(1,0,5,9,nowall_door2_l_bkg);
	push	de
	ld	hl, #_nowall_door2_l_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00118$:
;src/dng_crawling.c:205: set_bkg_tiles(1,0,5,9,nowall2_l_bkg);
	push	de
	ld	hl, #_nowall2_l_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00125$:
;src/dng_crawling.c:210: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y);
	push	bc
	push	de
	ldhl	sp,	#10
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	c, (hl)
	push	bc
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:211: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:212: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00128$
;src/dng_crawling.c:213: set_bkg_tiles(1,0,3,9,door1_l_bkg);
	ld	de, #_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00128$:
;src/dng_crawling.c:215: set_bkg_tiles(1,0,3,9,wall1_l_bkg);
	ld	de, #_wall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00137$:
;src/dng_crawling.c:218: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	call	_return_value
;src/dng_crawling.c:219: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:220: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00131$
;src/dng_crawling.c:221: set_bkg_tiles(1,0,3,9,nowall_door1_l_bkg);
	ld	de, #_nowall_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00131$:
;src/dng_crawling.c:223: set_bkg_tiles(1,0,3,9,nowall1_l_bkg);
	ld	de, #_nowall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
00140$:
;src/dng_crawling.c:227: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:229: void check_l_walls_w(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_l_walls_w
; ---------------------------------
_check_l_walls_w::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:230: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y+1);
	ldhl	sp,	#6
	ld	a, (hl-)
	ld	b, a
	inc	b
	ld	c, (hl)
	ld	a, c
	add	a, #0xfe
	ldhl	sp,	#0
	ld	(hl), a
	push	bc
	push	de
	ld	c, (hl)
	push	bc
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:231: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:232: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00102$
;src/dng_crawling.c:233: set_bkg_tiles(6,0,1,9,door3_l_bkg);
	push	de
	ld	hl, #_door3_l_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x06
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00102$:
;src/dng_crawling.c:235: set_bkg_tiles(6,0,1,9,wall3_l_bkg);
	push	de
	ld	hl, #_wall3_l_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x06
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00111$:
;src/dng_crawling.c:238: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-3, player_y+1);
	ld	a, c
	add	a, #0xfd
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:239: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:240: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00105$
;src/dng_crawling.c:241: set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
	push	de
	ld	hl, #_nowall_door3_l_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00105$:
;src/dng_crawling.c:243: set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
	push	de
	ld	hl, #_nowall3_l_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00112$:
;src/dng_crawling.c:247: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
	dec	c
	push	bc
	push	de
	push	bc
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:248: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:249: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00115$
;src/dng_crawling.c:250: set_bkg_tiles(4,0,2,9,door2_l_bkg);
	push	de
	ld	hl, #_door2_l_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x04
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00115$:
;src/dng_crawling.c:252: set_bkg_tiles(4,0,2,9,wall2_l_bkg);
	push	de
	ld	hl, #_wall2_l_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x04
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00124$:
;src/dng_crawling.c:255: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y+1);
	push	bc
	push	de
	push	bc
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:256: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:257: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00118$
;src/dng_crawling.c:258: set_bkg_tiles(1,0,5,9,nowall_door2_l_bkg);
	push	de
	ld	hl, #_nowall_door2_l_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00118$:
;src/dng_crawling.c:260: set_bkg_tiles(1,0,5,9,nowall2_l_bkg);
	push	de
	ld	hl, #_nowall2_l_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00125$:
;src/dng_crawling.c:265: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y+1);
	push	bc
	push	de
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:266: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:267: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00128$
;src/dng_crawling.c:268: set_bkg_tiles(1,0,3,9,door1_l_bkg);
	ld	de, #_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00128$:
;src/dng_crawling.c:270: set_bkg_tiles(1,0,3,9,wall1_l_bkg);
	ld	de, #_wall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00137$:
;src/dng_crawling.c:273: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
	push	bc
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	call	_return_value
;src/dng_crawling.c:274: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:275: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00131$
;src/dng_crawling.c:276: set_bkg_tiles(1,0,3,9,nowall_door1_l_bkg);
	ld	de, #_nowall_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00131$:
;src/dng_crawling.c:278: set_bkg_tiles(1,0,3,9,nowall1_l_bkg);
	ld	de, #_nowall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
00140$:
;src/dng_crawling.c:282: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:284: void check_r_walls_n(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_r_walls_n
; ---------------------------------
_check_r_walls_n::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:285: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-2);
	ldhl	sp,	#6
	ld	c, (hl)
	ld	a, c
	add	a, #0xfe
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#5
	ld	b, (hl)
	inc	b
	push	bc
	push	de
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:286: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:287: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00102$
;src/dng_crawling.c:288: set_bkg_tiles(13,0,1,9,door3_r_bkg);
	push	de
	ld	hl, #_door3_r_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x0d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00102$:
;src/dng_crawling.c:290: set_bkg_tiles(13,0,1,9,wall3_r_bkg);
	push	de
	ld	hl, #_wall3_r_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x0d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00111$:
;src/dng_crawling.c:293: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-3);
	ld	a, c
	add	a, #0xfd
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:294: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:295: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00105$
;src/dng_crawling.c:296: set_bkg_tiles(13,0,6,9,nowall_door3_r_bkg);
	push	de
	ld	hl, #_nowall_door3_r_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x0d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00105$:
;src/dng_crawling.c:298: set_bkg_tiles(13,0,6,9,nowall3_r_bkg);
	push	de
	ld	hl, #_nowall3_r_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x0d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00112$:
;src/dng_crawling.c:302: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
	dec	c
	push	bc
	push	de
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:303: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:304: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00115$
;src/dng_crawling.c:305: set_bkg_tiles(14,0,2,9,door2_r_bkg);
	push	de
	ld	hl, #_door2_r_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00115$:
;src/dng_crawling.c:307: set_bkg_tiles(14,0,2,9,wall2_r_bkg);
	push	de
	ld	hl, #_wall2_r_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00124$:
;src/dng_crawling.c:310: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-2);
	push	bc
	push	de
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:311: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:312: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00118$
;src/dng_crawling.c:313: set_bkg_tiles(14,0,5,9,nowall_door2_r_bkg);
	push	de
	ld	hl, #_nowall_door2_r_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00118$:
;src/dng_crawling.c:315: set_bkg_tiles(14,0,5,9,nowall2_r_bkg);
	push	de
	ld	hl, #_nowall2_r_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00125$:
;src/dng_crawling.c:320: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y);
	push	bc
	push	de
	ldhl	sp,	#10
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	c, (hl)
	push	bc
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:321: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:322: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00128$
;src/dng_crawling.c:323: set_bkg_tiles(16,0,3,9,door1_r_bkg);
	ld	de, #_door1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00128$:
;src/dng_crawling.c:325: set_bkg_tiles(16,0,3,9,wall1_r_bkg);
	ld	de, #_wall1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00137$:
;src/dng_crawling.c:328: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	call	_return_value
;src/dng_crawling.c:329: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:330: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00131$
;src/dng_crawling.c:331: set_bkg_tiles(16,0,3,9,nowall_door1_r_bkg);
	ld	de, #_nowall_door1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00131$:
;src/dng_crawling.c:333: set_bkg_tiles(16,0,3,9,nowall1_r_bkg);
	ld	de, #_nowall1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
00140$:
;src/dng_crawling.c:337: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:339: void check_r_walls_e(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_r_walls_e
; ---------------------------------
_check_r_walls_e::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:340: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y+1);
	ldhl	sp,	#6
	ld	a, (hl-)
	ld	b, a
	inc	b
	ld	c, (hl)
	ld	a, c
	add	a, #0x02
	ldhl	sp,	#0
	ld	(hl), a
	push	bc
	push	de
	ld	c, (hl)
	push	bc
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:341: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:342: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00102$
;src/dng_crawling.c:343: set_bkg_tiles(13,0,1,9,door3_r_bkg);
	push	de
	ld	hl, #_door3_r_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x0d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00102$:
;src/dng_crawling.c:345: set_bkg_tiles(13,0,1,9,wall3_r_bkg);
	push	de
	ld	hl, #_wall3_r_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x0d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00111$:
;src/dng_crawling.c:348: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+3, player_y+1);
	ld	a, c
	inc	a
	inc	a
	inc	a
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:349: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:350: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00105$
;src/dng_crawling.c:351: set_bkg_tiles(13,0,6,9,nowall_door3_r_bkg);
	push	de
	ld	hl, #_nowall_door3_r_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x0d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00105$:
;src/dng_crawling.c:353: set_bkg_tiles(13,0,6,9,nowall3_r_bkg);
	push	de
	ld	hl, #_nowall3_r_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x0d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00112$:
;src/dng_crawling.c:357: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
	inc	c
	push	bc
	push	de
	push	bc
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:358: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:359: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00115$
;src/dng_crawling.c:360: set_bkg_tiles(14,0,2,9,door2_r_bkg);
	push	de
	ld	hl, #_door2_r_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00115$:
;src/dng_crawling.c:362: set_bkg_tiles(14,0,2,9,wall2_r_bkg);
	push	de
	ld	hl, #_wall2_r_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00124$:
;src/dng_crawling.c:365: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y+1);
	push	bc
	push	de
	push	bc
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:366: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:367: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00118$
;src/dng_crawling.c:368: set_bkg_tiles(14,0,5,9,nowall_door2_r_bkg);
	push	de
	ld	hl, #_nowall_door2_r_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00118$:
;src/dng_crawling.c:370: set_bkg_tiles(14,0,5,9,nowall2_r_bkg);
	push	de
	ld	hl, #_nowall2_r_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00125$:
;src/dng_crawling.c:375: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y+1);
	push	bc
	push	de
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:376: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:377: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00128$
;src/dng_crawling.c:378: set_bkg_tiles(16,0,3,9,door1_r_bkg);
	ld	de, #_door1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00128$:
;src/dng_crawling.c:380: set_bkg_tiles(16,0,3,9,wall1_r_bkg);
	ld	de, #_wall1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00137$:
;src/dng_crawling.c:383: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
	push	bc
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	call	_return_value
;src/dng_crawling.c:384: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:385: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00131$
;src/dng_crawling.c:386: set_bkg_tiles(16,0,3,9,nowall_door1_r_bkg);
	ld	de, #_nowall_door1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00131$:
;src/dng_crawling.c:388: set_bkg_tiles(16,0,3,9,nowall1_r_bkg);
	ld	de, #_nowall1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
00140$:
;src/dng_crawling.c:392: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:394: void check_r_walls_s(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_r_walls_s
; ---------------------------------
_check_r_walls_s::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:395: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+2);
	ldhl	sp,	#6
	ld	c, (hl)
	ld	a, c
	add	a, #0x02
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#5
	ld	b, (hl)
	dec	b
	push	bc
	push	de
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:396: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:397: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00102$
;src/dng_crawling.c:398: set_bkg_tiles(13,0,1,9,door3_r_bkg);
	push	de
	ld	hl, #_door3_r_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x0d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00102$:
;src/dng_crawling.c:400: set_bkg_tiles(13,0,1,9,wall3_r_bkg);
	push	de
	ld	hl, #_wall3_r_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x0d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00111$:
;src/dng_crawling.c:403: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+3);
	ld	a, c
	inc	a
	inc	a
	inc	a
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:404: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:405: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00105$
;src/dng_crawling.c:406: set_bkg_tiles(13,0,6,9,nowall_door3_r_bkg);
	push	de
	ld	hl, #_nowall_door3_r_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x0d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00105$:
;src/dng_crawling.c:408: set_bkg_tiles(13,0,6,9,nowall3_r_bkg);
	push	de
	ld	hl, #_nowall3_r_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x0d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00112$:
;src/dng_crawling.c:412: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
	inc	c
	push	bc
	push	de
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:413: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:414: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00115$
;src/dng_crawling.c:415: set_bkg_tiles(14,0,2,9,door2_r_bkg);
	push	de
	ld	hl, #_door2_r_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00115$:
;src/dng_crawling.c:417: set_bkg_tiles(14,0,2,9,wall2_r_bkg);
	push	de
	ld	hl, #_wall2_r_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00124$:
;src/dng_crawling.c:420: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+2);
	push	bc
	push	de
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:421: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:422: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00118$
;src/dng_crawling.c:423: set_bkg_tiles(14,0,5,9,nowall_door2_r_bkg);
	push	de
	ld	hl, #_nowall_door2_r_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00118$:
;src/dng_crawling.c:425: set_bkg_tiles(14,0,5,9,nowall2_r_bkg);
	push	de
	ld	hl, #_nowall2_r_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00125$:
;src/dng_crawling.c:430: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y);
	push	bc
	push	de
	ldhl	sp,	#10
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	c, (hl)
	push	bc
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:431: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:432: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00128$
;src/dng_crawling.c:433: set_bkg_tiles(16,0,3,9,door1_r_bkg);
	ld	de, #_door1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00128$:
;src/dng_crawling.c:435: set_bkg_tiles(16,0,3,9,wall1_r_bkg);
	ld	de, #_wall1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00137$:
;src/dng_crawling.c:438: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	call	_return_value
;src/dng_crawling.c:439: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:440: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00131$
;src/dng_crawling.c:441: set_bkg_tiles(16,0,3,9,nowall_door1_r_bkg);
	ld	de, #_nowall_door1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00131$:
;src/dng_crawling.c:443: set_bkg_tiles(16,0,3,9,nowall1_r_bkg);
	ld	de, #_nowall1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
00140$:
;src/dng_crawling.c:447: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:449: void check_r_walls_w(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_r_walls_w
; ---------------------------------
_check_r_walls_w::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:450: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y-1);
	ldhl	sp,	#6
	ld	a, (hl-)
	ld	b, a
	dec	b
	ld	c, (hl)
	ld	a, c
	add	a, #0xfe
	ldhl	sp,	#0
	ld	(hl), a
	push	bc
	push	de
	ld	c, (hl)
	push	bc
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:451: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:452: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00102$
;src/dng_crawling.c:453: set_bkg_tiles(13,0,1,9,door3_r_bkg);
	push	de
	ld	hl, #_door3_r_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x0d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00102$:
;src/dng_crawling.c:455: set_bkg_tiles(13,0,1,9,wall3_r_bkg);
	push	de
	ld	hl, #_wall3_r_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x0d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00111$:
;src/dng_crawling.c:458: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-3, player_y-1);
	ld	a, c
	add	a, #0xfd
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:459: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:460: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00105$
;src/dng_crawling.c:461: set_bkg_tiles(13,0,6,9,nowall_door3_r_bkg);
	push	de
	ld	hl, #_nowall_door3_r_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x0d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00105$:
;src/dng_crawling.c:463: set_bkg_tiles(13,0,6,9,nowall3_r_bkg);
	push	de
	ld	hl, #_nowall3_r_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x0d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00112$:
;src/dng_crawling.c:467: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
	dec	c
	push	bc
	push	de
	push	bc
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:468: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:469: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00115$
;src/dng_crawling.c:470: set_bkg_tiles(14,0,2,9,door2_r_bkg);
	push	de
	ld	hl, #_door2_r_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00115$:
;src/dng_crawling.c:472: set_bkg_tiles(14,0,2,9,wall2_r_bkg);
	push	de
	ld	hl, #_wall2_r_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00124$:
;src/dng_crawling.c:475: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y-1);
	push	bc
	push	de
	push	bc
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:476: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:477: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00118$
;src/dng_crawling.c:478: set_bkg_tiles(14,0,5,9,nowall_door2_r_bkg);
	push	de
	ld	hl, #_nowall_door2_r_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00118$:
;src/dng_crawling.c:480: set_bkg_tiles(14,0,5,9,nowall2_r_bkg);
	push	de
	ld	hl, #_nowall2_r_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00125$:
;src/dng_crawling.c:485: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y-1);
	push	bc
	push	de
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	ldhl	sp,	#8
	ld	a, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:486: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:487: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00128$
;src/dng_crawling.c:488: set_bkg_tiles(16,0,3,9,door1_r_bkg);
	ld	de, #_door1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00128$:
;src/dng_crawling.c:490: set_bkg_tiles(16,0,3,9,wall1_r_bkg);
	ld	de, #_wall1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00137$:
;src/dng_crawling.c:493: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
	push	bc
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	call	_return_value
;src/dng_crawling.c:494: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:495: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00131$
;src/dng_crawling.c:496: set_bkg_tiles(16,0,3,9,nowall_door1_r_bkg);
	ld	de, #_nowall_door1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00131$:
;src/dng_crawling.c:498: set_bkg_tiles(16,0,3,9,nowall1_r_bkg);
	ld	de, #_nowall1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
00140$:
;src/dng_crawling.c:502: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
