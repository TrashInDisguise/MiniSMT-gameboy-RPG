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
	add	sp, #-11
	ldhl	sp,	#8
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
	ld	(hl), a
;src/dng_crawling.c:18: bool is_door = false;
	ldhl	sp,	#0
;src/dng_crawling.c:19: uint8_t dist = 0; //0 - no wall; 1 - wall1; 2 - wall2; 3 - wall3;
	xor	a, a
	ld	(hl+), a
;src/dng_crawling.c:20: bool left_is_wall = false;
	xor	a, a
	ld	(hl+), a
;src/dng_crawling.c:21: bool right_is_wall = false;
	xor	a, a
	ld	(hl+), a
;src/dng_crawling.c:23: for ( a=1; a<=4; a++){
	xor	a, a
	ld	(hl+), a
	ld	(hl), #0x01
	ldhl	sp,	#10
	ld	(hl), #0x01
00171$:
;src/dng_crawling.c:24: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(a*dirx), player_y+(a*diry));
	ldhl	sp,	#17
	ld	e, (hl)
	ldhl	sp,	#10
	ld	a, (hl)
	call	__mulsuchar
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
	add	a,c
	ld	d, a
	push	de
	ldhl	sp,	#18
	ld	e, (hl)
	ldhl	sp,	#12
	ld	a, (hl)
	call	__mulsuchar
	pop	de
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	add	a,c
	push	de
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#15
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
;src/dng_crawling.c:25: if( w != 0x00 && w != 0x01 && dist == 0){
	ld	c,a
	or	a,a
	jp	Z,00172$
	dec	a
	jp	Z,00172$
;src/dng_crawling.c:26: dist = a;
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:27: if( w == 0x03 && diry == -1 || w == 0x04 && dirx == 1 ||w == 0x05 && diry == 1 || w==0x06 && dirx == -1){
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00106$
	ldhl	sp,	#17
	ld	a, (hl)
	inc	a
	jr	Z, 00101$
00106$:
	ld	a, c
	sub	a, #0x04
	jr	NZ, 00108$
	ldhl	sp,	#16
	ld	a, (hl)
	dec	a
	jr	Z, 00101$
00108$:
	ld	a, c
	sub	a, #0x05
	jr	NZ, 00110$
	ldhl	sp,	#17
	ld	a, (hl)
	dec	a
	jr	Z, 00101$
00110$:
	ld	a, c
	sub	a, #0x06
	jr	NZ, 00102$
	ldhl	sp,	#16
	ld	a, (hl)
	inc	a
	jr	NZ, 00102$
00101$:
;src/dng_crawling.c:29: is_door = true;
	ldhl	sp,	#0
	ld	(hl), #0x01
	jr	00103$
00102$:
;src/dng_crawling.c:32: is_door = false;
	ldhl	sp,	#0
	ld	(hl), #0x00
00103$:
;src/dng_crawling.c:34: w = return_value(dng,dungeon_width,dungeon_hieght,(player_x+(a*dirx))-diry, (player_y+(a*diry))-dirx);
	ldhl	sp,	#17
	ld	e, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	call	__mulsuchar
	ld	a, c
	ldhl	sp,	#5
	add	a, (hl)
	ld	c, a
	ldhl	sp,	#16
	sub	a, (hl)
	ld	b, a
	push	bc
	ld	e, (hl)
	ldhl	sp,	#6
	ld	a, (hl)
	call	__mulsuchar
	ld	a, c
	pop	bc
	ldhl	sp,	#6
	add	a, (hl)
	ld	e, a
	ldhl	sp,	#17
	sub	a, (hl)
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#19
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:35: if(w!=0x00 && w!=0x01){
	or	a, a
	jr	Z, 00112$
	dec	a
	jr	Z, 00112$
;src/dng_crawling.c:36: left_is_wall = true;
	ldhl	sp,	#2
	ld	(hl), #0x01
00112$:
;src/dng_crawling.c:38: w = return_value(dng,dungeon_width,dungeon_hieght,(player_x+(a*dirx))+diry, (player_y+(a*diry))+dirx);
	ld	a, c
	ldhl	sp,	#16
	add	a, (hl)
	inc	hl
	ld	b, a
	ld	a, e
	add	a, (hl)
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#15
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
;src/dng_crawling.c:39: if(w!=0x00 && w!=0x01){
	or	a, a
	jr	Z, 00121$
	dec	a
	jr	Z, 00121$
;src/dng_crawling.c:40: right_is_wall = true;
	ldhl	sp,	#3
	ld	(hl), #0x01
;src/dng_crawling.c:42: break;
	jr	00121$
00172$:
;src/dng_crawling.c:23: for ( a=1; a<=4; a++){
	ldhl	sp,	#10
	inc	(hl)
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, #0x04
	ldhl	sp,	#10
	sub	a, (hl)
	jp	NC, 00171$
00121$:
;src/dng_crawling.c:45: switch (dist){
	ldhl	sp,	#1
	ld	a, (hl)
	dec	a
	jr	Z, 00122$
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, #0x02
	jp	Z,00138$
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, #0x03
	jp	Z,00154$
	jp	00173$
;src/dng_crawling.c:46: case 1:
00122$:
;src/dng_crawling.c:47: if(is_door){
	ldhl	sp,	#0
	bit	0, (hl)
	jr	Z, 00136$
;src/dng_crawling.c:48: if(left_is_wall){
	inc	hl
	inc	hl
	bit	0, (hl)
	jr	Z, 00124$
;src/dng_crawling.c:49: set_bkg_tiles(4,0,6,9,door1_left_half_bkg);
	ld	de, #_door1_left_half_bkg
	push	de
	ld	hl, #0x906
	push	hl
	ld	hl, #0x04
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00125$
00124$:
;src/dng_crawling.c:51: set_bkg_tiles(4,0,6,9,door1_left_half_c_bkg);
	ld	de, #_door1_left_half_c_bkg
	push	de
	ld	hl, #0x906
	push	hl
	ld	hl, #0x04
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00125$:
;src/dng_crawling.c:53: if(right_is_wall){
	ldhl	sp,	#3
	bit	0, (hl)
	jr	Z, 00127$
;src/dng_crawling.c:54: set_bkg_tiles(10,0,6,9,door1_right_half_bkg);
	ld	de, #_door1_right_half_bkg
	push	de
	ld	hl, #0x906
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jp	00173$
00127$:
;src/dng_crawling.c:56: set_bkg_tiles(10,0,6,9,door1_right_half_c_bkg);
	ld	de, #_door1_right_half_c_bkg
	push	de
	ld	hl, #0x906
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jp	00173$
00136$:
;src/dng_crawling.c:59: if(left_is_wall){
	ldhl	sp,	#2
	bit	0, (hl)
	jr	Z, 00130$
;src/dng_crawling.c:60: set_bkg_tiles(4,0,6,9,wall1_half_bkg);
	ld	de, #_wall1_half_bkg
	push	de
	ld	hl, #0x906
	push	hl
	ld	hl, #0x04
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00131$
00130$:
;src/dng_crawling.c:62: set_bkg_tiles(4,0,6,9,wall1_left_half_c_bkg);
	ld	de, #_wall1_left_half_c_bkg
	push	de
	ld	hl, #0x906
	push	hl
	ld	hl, #0x04
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00131$:
;src/dng_crawling.c:64: if(right_is_wall){
	ldhl	sp,	#3
	bit	0, (hl)
	jr	Z, 00133$
;src/dng_crawling.c:65: set_bkg_tiles(10,0,6,9,wall1_half_bkg);
	ld	de, #_wall1_half_bkg
	push	de
	ld	hl, #0x906
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jp	00173$
00133$:
;src/dng_crawling.c:67: set_bkg_tiles(10,0,6,9,wall1_right_half_c_bkg);
	ld	de, #_wall1_right_half_c_bkg
	push	de
	ld	hl, #0x906
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/dng_crawling.c:70: break;
	jp	00173$
;src/dng_crawling.c:71: case 2:
00138$:
;src/dng_crawling.c:72: if(is_door){
	ldhl	sp,	#0
	bit	0, (hl)
	jr	Z, 00152$
;src/dng_crawling.c:73: if(left_is_wall){
	inc	hl
	inc	hl
	bit	0, (hl)
	jr	Z, 00140$
;src/dng_crawling.c:74: set_bkg_tiles(6,0,4,9,door2_left_half_bkg);
	ld	de, #_door2_left_half_bkg
	push	de
	ld	hl, #0x904
	push	hl
	ld	hl, #0x06
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00141$
00140$:
;src/dng_crawling.c:76: set_bkg_tiles(6,0,4,9,door2_left_half_c_bkg);
	ld	de, #_door2_left_half_c_bkg
	push	de
	ld	hl, #0x904
	push	hl
	ld	hl, #0x06
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00141$:
;src/dng_crawling.c:78: if(right_is_wall){
	ldhl	sp,	#3
	bit	0, (hl)
	jr	Z, 00143$
;src/dng_crawling.c:79: set_bkg_tiles(10,0,4,9,door2_right_half_bkg);
	ld	de, #_door2_right_half_bkg
	push	de
	ld	hl, #0x904
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jp	00173$
00143$:
;src/dng_crawling.c:82: set_bkg_tiles(10,0,4,9,door2_right_half_c_bkg);
	ld	de, #_door2_right_half_c_bkg
	push	de
	ld	hl, #0x904
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jp	00173$
00152$:
;src/dng_crawling.c:85: if(left_is_wall){
	ldhl	sp,	#2
	bit	0, (hl)
	jr	Z, 00146$
;src/dng_crawling.c:86: set_bkg_tiles(6,0,4,9,wall2_half_bkg);
	ld	de, #_wall2_half_bkg
	push	de
	ld	hl, #0x904
	push	hl
	ld	hl, #0x06
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00147$
00146$:
;src/dng_crawling.c:88: set_bkg_tiles(6,0,4,9,wall2_left_half_c_bkg);
	ld	de, #_wall2_left_half_c_bkg
	push	de
	ld	hl, #0x904
	push	hl
	ld	hl, #0x06
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00147$:
;src/dng_crawling.c:90: if(right_is_wall){
	ldhl	sp,	#3
	bit	0, (hl)
	jr	Z, 00149$
;src/dng_crawling.c:91: set_bkg_tiles(10,0,4,9,wall2_half_bkg);
	ld	de, #_wall2_half_bkg
	push	de
	ld	hl, #0x904
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jp	00173$
00149$:
;src/dng_crawling.c:93: set_bkg_tiles(10,0,4,9,wall2_right_half_c_bkg);
	ld	de, #_wall2_right_half_c_bkg
	push	de
	ld	hl, #0x904
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/dng_crawling.c:96: break;
	jp	00173$
;src/dng_crawling.c:98: case 3:
00154$:
;src/dng_crawling.c:99: if(is_door){
	ldhl	sp,	#0
	bit	0, (hl)
	jr	Z, 00168$
;src/dng_crawling.c:100: if(left_is_wall){
	inc	hl
	inc	hl
	bit	0, (hl)
	jr	Z, 00156$
;src/dng_crawling.c:101: set_bkg_tiles(7,0,3,9,door3_left_half_bkg);
	ld	de, #_door3_left_half_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x07
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00157$
00156$:
;src/dng_crawling.c:103: set_bkg_tiles(7,0,3,9,door3_left_half_c_bkg);
	ld	de, #_door3_left_half_c_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x07
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00157$:
;src/dng_crawling.c:105: if(right_is_wall){
	ldhl	sp,	#3
	bit	0, (hl)
	jr	Z, 00159$
;src/dng_crawling.c:106: set_bkg_tiles(10,0,3,9,door3_right_half_bkg);
	ld	de, #_door3_right_half_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00173$
00159$:
;src/dng_crawling.c:108: set_bkg_tiles(10,0,3,9,door3_right_half_c_bkg);
	ld	de, #_door3_right_half_c_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00173$
00168$:
;src/dng_crawling.c:111: if(left_is_wall){
	ldhl	sp,	#2
	bit	0, (hl)
	jr	Z, 00162$
;src/dng_crawling.c:112: set_bkg_tiles(7,0,3,9,wall3_half_bkg);
	ld	de, #_wall3_half_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x07
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00163$
00162$:
;src/dng_crawling.c:114: set_bkg_tiles(7,0,3,9,wall3_left_half_c_bkg);
	ld	de, #_wall3_left_half_c_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x07
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00163$:
;src/dng_crawling.c:116: if(right_is_wall){
	ldhl	sp,	#3
	bit	0, (hl)
	jr	Z, 00165$
;src/dng_crawling.c:117: set_bkg_tiles(10,0,3,9,wall3_half_bkg);
	ld	de, #_wall3_half_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00173$
00165$:
;src/dng_crawling.c:119: set_bkg_tiles(10,0,3,9,wall3_right_half_c_bkg);
	ld	de, #_wall3_right_half_c_bkg
	push	de
	ld	hl, #0x903
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/dng_crawling.c:123: }
00173$:
;src/dng_crawling.c:124: }
	add	sp, #11
	pop	hl
	add	sp, #5
	jp	(hl)
;src/dng_crawling.c:205: void check_l_walls_n(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_l_walls_n
; ---------------------------------
_check_l_walls_n::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:206: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-2);
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
;src/dng_crawling.c:207: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:208: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00102$
;src/dng_crawling.c:209: set_bkg_tiles(6,0,1,9,door3_l_bkg);
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
;src/dng_crawling.c:211: set_bkg_tiles(6,0,1,9,wall3_l_bkg);
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
;src/dng_crawling.c:214: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-3);
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
;src/dng_crawling.c:215: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:216: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00105$
;src/dng_crawling.c:217: set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
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
;src/dng_crawling.c:219: set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
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
;src/dng_crawling.c:223: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
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
;src/dng_crawling.c:224: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:225: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00115$
;src/dng_crawling.c:226: set_bkg_tiles(4,0,2,9,door2_l_bkg);
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
;src/dng_crawling.c:228: set_bkg_tiles(4,0,2,9,wall2_l_bkg);
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
;src/dng_crawling.c:231: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-2);
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
;src/dng_crawling.c:232: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:233: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00118$
;src/dng_crawling.c:234: set_bkg_tiles(1,0,5,9,nowall_door2_l_bkg);
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
;src/dng_crawling.c:236: set_bkg_tiles(1,0,5,9,nowall2_l_bkg);
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
;src/dng_crawling.c:241: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y);
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
;src/dng_crawling.c:242: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:243: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00128$
;src/dng_crawling.c:244: set_bkg_tiles(1,0,3,9,door1_l_bkg);
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
;src/dng_crawling.c:246: set_bkg_tiles(1,0,3,9,wall1_l_bkg);
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
;src/dng_crawling.c:249: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
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
;src/dng_crawling.c:250: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:251: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00131$
;src/dng_crawling.c:252: set_bkg_tiles(1,0,3,9,nowall_door1_l_bkg);
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
;src/dng_crawling.c:254: set_bkg_tiles(1,0,3,9,nowall1_l_bkg);
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
;src/dng_crawling.c:258: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:260: void check_l_walls_e(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_l_walls_e
; ---------------------------------
_check_l_walls_e::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:261: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y-1);
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
;src/dng_crawling.c:262: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:263: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00102$
;src/dng_crawling.c:264: set_bkg_tiles(6,0,1,9,door3_l_bkg);
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
;src/dng_crawling.c:266: set_bkg_tiles(6,0,1,9,wall3_l_bkg);
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
;src/dng_crawling.c:269: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+3, player_y-1);
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
;src/dng_crawling.c:270: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:271: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00105$
;src/dng_crawling.c:272: set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
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
;src/dng_crawling.c:274: set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
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
;src/dng_crawling.c:278: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
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
;src/dng_crawling.c:279: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:280: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00115$
;src/dng_crawling.c:281: set_bkg_tiles(4,0,2,9,door2_l_bkg);
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
;src/dng_crawling.c:283: set_bkg_tiles(4,0,2,9,wall2_l_bkg);
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
;src/dng_crawling.c:286: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y-1);
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
;src/dng_crawling.c:287: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:288: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00118$
;src/dng_crawling.c:289: set_bkg_tiles(1,0,5,9,nowall_door2_l_bkg);
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
;src/dng_crawling.c:291: set_bkg_tiles(1,0,5,9,nowall2_l_bkg);
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
;src/dng_crawling.c:296: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y-1);
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
;src/dng_crawling.c:297: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:298: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00128$
;src/dng_crawling.c:299: set_bkg_tiles(1,0,3,9,door1_l_bkg);
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
;src/dng_crawling.c:301: set_bkg_tiles(1,0,3,9,wall1_l_bkg);
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
;src/dng_crawling.c:304: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
	push	bc
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	call	_return_value
;src/dng_crawling.c:305: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:306: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00131$
;src/dng_crawling.c:307: set_bkg_tiles(1,0,3,9,nowall_door1_l_bkg);
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
;src/dng_crawling.c:309: set_bkg_tiles(1,0,3,9,nowall1_l_bkg);
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
;src/dng_crawling.c:313: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:315: void check_l_walls_s(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_l_walls_s
; ---------------------------------
_check_l_walls_s::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:316: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+2);
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
;src/dng_crawling.c:317: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:318: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00102$
;src/dng_crawling.c:319: set_bkg_tiles(6,0,1,9,door3_l_bkg);
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
;src/dng_crawling.c:321: set_bkg_tiles(6,0,1,9,wall3_l_bkg);
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
;src/dng_crawling.c:324: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+3);
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
;src/dng_crawling.c:325: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:326: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00105$
;src/dng_crawling.c:327: set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
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
;src/dng_crawling.c:329: set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
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
;src/dng_crawling.c:333: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
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
;src/dng_crawling.c:334: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:335: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00115$
;src/dng_crawling.c:336: set_bkg_tiles(4,0,2,9,door2_l_bkg);
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
;src/dng_crawling.c:338: set_bkg_tiles(4,0,2,9,wall2_l_bkg);
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
;src/dng_crawling.c:341: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+2);
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
;src/dng_crawling.c:342: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:343: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00118$
;src/dng_crawling.c:344: set_bkg_tiles(1,0,5,9,nowall_door2_l_bkg);
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
;src/dng_crawling.c:346: set_bkg_tiles(1,0,5,9,nowall2_l_bkg);
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
;src/dng_crawling.c:351: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y);
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
;src/dng_crawling.c:352: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:353: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00128$
;src/dng_crawling.c:354: set_bkg_tiles(1,0,3,9,door1_l_bkg);
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
;src/dng_crawling.c:356: set_bkg_tiles(1,0,3,9,wall1_l_bkg);
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
;src/dng_crawling.c:359: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
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
;src/dng_crawling.c:360: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:361: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00131$
;src/dng_crawling.c:362: set_bkg_tiles(1,0,3,9,nowall_door1_l_bkg);
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
;src/dng_crawling.c:364: set_bkg_tiles(1,0,3,9,nowall1_l_bkg);
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
;src/dng_crawling.c:368: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:370: void check_l_walls_w(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_l_walls_w
; ---------------------------------
_check_l_walls_w::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:371: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y+1);
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
;src/dng_crawling.c:372: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:373: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00102$
;src/dng_crawling.c:374: set_bkg_tiles(6,0,1,9,door3_l_bkg);
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
;src/dng_crawling.c:376: set_bkg_tiles(6,0,1,9,wall3_l_bkg);
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
;src/dng_crawling.c:379: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-3, player_y+1);
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
;src/dng_crawling.c:380: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:381: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00105$
;src/dng_crawling.c:382: set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
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
;src/dng_crawling.c:384: set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
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
;src/dng_crawling.c:388: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
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
;src/dng_crawling.c:389: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:390: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00115$
;src/dng_crawling.c:391: set_bkg_tiles(4,0,2,9,door2_l_bkg);
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
;src/dng_crawling.c:393: set_bkg_tiles(4,0,2,9,wall2_l_bkg);
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
;src/dng_crawling.c:396: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y+1);
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
;src/dng_crawling.c:397: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:398: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00118$
;src/dng_crawling.c:399: set_bkg_tiles(1,0,5,9,nowall_door2_l_bkg);
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
;src/dng_crawling.c:401: set_bkg_tiles(1,0,5,9,nowall2_l_bkg);
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
;src/dng_crawling.c:406: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y+1);
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
;src/dng_crawling.c:407: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:408: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00128$
;src/dng_crawling.c:409: set_bkg_tiles(1,0,3,9,door1_l_bkg);
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
;src/dng_crawling.c:411: set_bkg_tiles(1,0,3,9,wall1_l_bkg);
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
;src/dng_crawling.c:414: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
	push	bc
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	call	_return_value
;src/dng_crawling.c:415: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:416: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00131$
;src/dng_crawling.c:417: set_bkg_tiles(1,0,3,9,nowall_door1_l_bkg);
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
;src/dng_crawling.c:419: set_bkg_tiles(1,0,3,9,nowall1_l_bkg);
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
;src/dng_crawling.c:423: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:425: void check_r_walls_n(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_r_walls_n
; ---------------------------------
_check_r_walls_n::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:426: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-2);
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
;src/dng_crawling.c:427: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:428: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00102$
;src/dng_crawling.c:429: set_bkg_tiles(13,0,1,9,door3_r_bkg);
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
;src/dng_crawling.c:431: set_bkg_tiles(13,0,1,9,wall3_r_bkg);
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
;src/dng_crawling.c:434: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-3);
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
;src/dng_crawling.c:435: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:436: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00105$
;src/dng_crawling.c:437: set_bkg_tiles(13,0,6,9,nowall_door3_r_bkg);
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
;src/dng_crawling.c:439: set_bkg_tiles(13,0,6,9,nowall3_r_bkg);
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
;src/dng_crawling.c:443: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
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
;src/dng_crawling.c:444: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:445: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00115$
;src/dng_crawling.c:446: set_bkg_tiles(14,0,2,9,door2_r_bkg);
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
;src/dng_crawling.c:448: set_bkg_tiles(14,0,2,9,wall2_r_bkg);
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
;src/dng_crawling.c:451: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-2);
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
;src/dng_crawling.c:452: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:453: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00118$
;src/dng_crawling.c:454: set_bkg_tiles(14,0,5,9,nowall_door2_r_bkg);
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
;src/dng_crawling.c:456: set_bkg_tiles(14,0,5,9,nowall2_r_bkg);
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
;src/dng_crawling.c:461: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y);
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
;src/dng_crawling.c:462: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:463: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00128$
;src/dng_crawling.c:464: set_bkg_tiles(16,0,3,9,door1_r_bkg);
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
;src/dng_crawling.c:466: set_bkg_tiles(16,0,3,9,wall1_r_bkg);
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
;src/dng_crawling.c:469: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
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
;src/dng_crawling.c:470: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:471: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00131$
;src/dng_crawling.c:472: set_bkg_tiles(16,0,3,9,nowall_door1_r_bkg);
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
;src/dng_crawling.c:474: set_bkg_tiles(16,0,3,9,nowall1_r_bkg);
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
;src/dng_crawling.c:478: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:480: void check_r_walls_e(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_r_walls_e
; ---------------------------------
_check_r_walls_e::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:481: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y+1);
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
;src/dng_crawling.c:482: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:483: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00102$
;src/dng_crawling.c:484: set_bkg_tiles(13,0,1,9,door3_r_bkg);
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
;src/dng_crawling.c:486: set_bkg_tiles(13,0,1,9,wall3_r_bkg);
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
;src/dng_crawling.c:489: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+3, player_y+1);
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
;src/dng_crawling.c:490: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:491: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00105$
;src/dng_crawling.c:492: set_bkg_tiles(13,0,6,9,nowall_door3_r_bkg);
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
;src/dng_crawling.c:494: set_bkg_tiles(13,0,6,9,nowall3_r_bkg);
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
;src/dng_crawling.c:498: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
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
;src/dng_crawling.c:499: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:500: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00115$
;src/dng_crawling.c:501: set_bkg_tiles(14,0,2,9,door2_r_bkg);
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
;src/dng_crawling.c:503: set_bkg_tiles(14,0,2,9,wall2_r_bkg);
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
;src/dng_crawling.c:506: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y+1);
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
;src/dng_crawling.c:507: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:508: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00118$
;src/dng_crawling.c:509: set_bkg_tiles(14,0,5,9,nowall_door2_r_bkg);
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
;src/dng_crawling.c:511: set_bkg_tiles(14,0,5,9,nowall2_r_bkg);
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
;src/dng_crawling.c:516: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y+1);
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
;src/dng_crawling.c:517: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:518: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00128$
;src/dng_crawling.c:519: set_bkg_tiles(16,0,3,9,door1_r_bkg);
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
;src/dng_crawling.c:521: set_bkg_tiles(16,0,3,9,wall1_r_bkg);
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
;src/dng_crawling.c:524: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
	push	bc
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	call	_return_value
;src/dng_crawling.c:525: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:526: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00131$
;src/dng_crawling.c:527: set_bkg_tiles(16,0,3,9,nowall_door1_r_bkg);
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
;src/dng_crawling.c:529: set_bkg_tiles(16,0,3,9,nowall1_r_bkg);
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
;src/dng_crawling.c:533: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:535: void check_r_walls_s(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_r_walls_s
; ---------------------------------
_check_r_walls_s::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:536: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+2);
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
;src/dng_crawling.c:537: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:538: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00102$
;src/dng_crawling.c:539: set_bkg_tiles(13,0,1,9,door3_r_bkg);
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
;src/dng_crawling.c:541: set_bkg_tiles(13,0,1,9,wall3_r_bkg);
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
;src/dng_crawling.c:544: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+3);
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
;src/dng_crawling.c:545: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:546: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00105$
;src/dng_crawling.c:547: set_bkg_tiles(13,0,6,9,nowall_door3_r_bkg);
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
;src/dng_crawling.c:549: set_bkg_tiles(13,0,6,9,nowall3_r_bkg);
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
;src/dng_crawling.c:553: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
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
;src/dng_crawling.c:554: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:555: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00115$
;src/dng_crawling.c:556: set_bkg_tiles(14,0,2,9,door2_r_bkg);
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
;src/dng_crawling.c:558: set_bkg_tiles(14,0,2,9,wall2_r_bkg);
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
;src/dng_crawling.c:561: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+2);
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
;src/dng_crawling.c:562: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:563: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00118$
;src/dng_crawling.c:564: set_bkg_tiles(14,0,5,9,nowall_door2_r_bkg);
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
;src/dng_crawling.c:566: set_bkg_tiles(14,0,5,9,nowall2_r_bkg);
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
;src/dng_crawling.c:571: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y);
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
;src/dng_crawling.c:572: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:573: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00128$
;src/dng_crawling.c:574: set_bkg_tiles(16,0,3,9,door1_r_bkg);
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
;src/dng_crawling.c:576: set_bkg_tiles(16,0,3,9,wall1_r_bkg);
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
;src/dng_crawling.c:579: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
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
;src/dng_crawling.c:580: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:581: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00131$
;src/dng_crawling.c:582: set_bkg_tiles(16,0,3,9,nowall_door1_r_bkg);
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
;src/dng_crawling.c:584: set_bkg_tiles(16,0,3,9,nowall1_r_bkg);
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
;src/dng_crawling.c:588: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:590: void check_r_walls_w(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_r_walls_w
; ---------------------------------
_check_r_walls_w::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:591: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y-1);
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
;src/dng_crawling.c:592: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:593: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00102$
;src/dng_crawling.c:594: set_bkg_tiles(13,0,1,9,door3_r_bkg);
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
;src/dng_crawling.c:596: set_bkg_tiles(13,0,1,9,wall3_r_bkg);
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
;src/dng_crawling.c:599: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-3, player_y-1);
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
;src/dng_crawling.c:600: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:601: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00105$
;src/dng_crawling.c:602: set_bkg_tiles(13,0,6,9,nowall_door3_r_bkg);
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
;src/dng_crawling.c:604: set_bkg_tiles(13,0,6,9,nowall3_r_bkg);
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
;src/dng_crawling.c:608: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
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
;src/dng_crawling.c:609: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:610: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00115$
;src/dng_crawling.c:611: set_bkg_tiles(14,0,2,9,door2_r_bkg);
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
;src/dng_crawling.c:613: set_bkg_tiles(14,0,2,9,wall2_r_bkg);
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
;src/dng_crawling.c:616: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y-1);
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
;src/dng_crawling.c:617: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:618: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00118$
;src/dng_crawling.c:619: set_bkg_tiles(14,0,5,9,nowall_door2_r_bkg);
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
;src/dng_crawling.c:621: set_bkg_tiles(14,0,5,9,nowall2_r_bkg);
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
;src/dng_crawling.c:626: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y-1);
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
;src/dng_crawling.c:627: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:628: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00128$
;src/dng_crawling.c:629: set_bkg_tiles(16,0,3,9,door1_r_bkg);
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
;src/dng_crawling.c:631: set_bkg_tiles(16,0,3,9,wall1_r_bkg);
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
;src/dng_crawling.c:634: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
	push	bc
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	call	_return_value
;src/dng_crawling.c:635: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:636: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00131$
;src/dng_crawling.c:637: set_bkg_tiles(16,0,3,9,nowall_door1_r_bkg);
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
;src/dng_crawling.c:639: set_bkg_tiles(16,0,3,9,nowall1_r_bkg);
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
;src/dng_crawling.c:643: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
