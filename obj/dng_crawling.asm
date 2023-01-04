;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (Linux)
;--------------------------------------------------------
	.module dng_crawling
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _check_r_walls
	.globl _check_l_walls
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
	ld	e, a
;src/dng_crawling.c:10: if(y < height && x < width)
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	jr	NC, 00102$
	inc	hl
	ld	a, (hl)
	sub	a, e
	jr	NC, 00102$
;src/dng_crawling.c:11: return dng[ y*width + x ];
	inc	hl
	ld	a, (hl)
	call	__muluchar
	ldhl	sp,	#5
	ld	a, (hl)
	ld	e, #0x00
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	jr	00105$
00102$:
;src/dng_crawling.c:13: return NULL;
	xor	a, a
00105$:
;src/dng_crawling.c:14: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:16: void check_m_walls(const unsigned char *dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y , uint8_t player_dir){
;	---------------------------------
; Function check_m_walls
; ---------------------------------
_check_m_walls::
	add	sp, #-14
	ldhl	sp,	#12
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
	ld	(hl), a
;src/dng_crawling.c:19: uint8_t dist = 0; //0 - no wall; 1 - wall1; 2 - wall2; 3 - wall3;
	ldhl	sp,	#0
;src/dng_crawling.c:20: bool left_is_wall = false;
;src/dng_crawling.c:21: bool right_is_wall = false;
	xor	a, a
	ld	(hl+), a
	ld	c, #0x00
;src/dng_crawling.c:22: unsigned char w=0x00;
;src/dng_crawling.c:23: unsigned char l=0x00;
	ld	a, c
	ld	(hl+), a
;src/dng_crawling.c:24: unsigned char r=0x00;
	xor	a, a
	ld	e,a
	ld	(hl+), a
	ld	(hl), #0x00
;src/dng_crawling.c:26: switch(player_dir){
	ldhl	sp,	#19
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00416$
	xor	a, a
00416$:
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#19
	ld	a, (hl)
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00418$
	xor	a, a
00418$:
	ldhl	sp,	#5
	ld	(hl), a
	ldhl	sp,	#19
	ld	a, (hl)
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00420$
	xor	a, a
00420$:
	ldhl	sp,	#6
	ld	(hl), a
;src/dng_crawling.c:35: l = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-dist);
	ldhl	sp,	#17
	ld	b, (hl)
	ld	a, b
	dec	a
	ldhl	sp,	#7
;src/dng_crawling.c:36: r = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-dist);
	ld	(hl+), a
	ld	a, b
	inc	a
	ld	(hl), a
;src/dng_crawling.c:26: switch(player_dir){
	ldhl	sp,	#19
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
;src/dng_crawling.c:47: l = return_value(dng,dungeon_width,dungeon_hieght,player_x+dist, player_y-1);
	ldhl	sp,	#18
	ld	b, (hl)
	ld	a, b
	dec	a
	ldhl	sp,	#9
;src/dng_crawling.c:48: r = return_value(dng,dungeon_width,dungeon_hieght,player_x+dist, player_y+1);
	ld	(hl+), a
	ld	a, b
	inc	a
	ld	(hl), a
;src/dng_crawling.c:26: switch(player_dir){
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jp	NZ, 00107$
	inc	hl
	ld	a, (hl)
	or	a, a
	jp	NZ, 00113$
	inc	hl
	ld	a, (hl)
	or	a, a
	jp	NZ, 00119$
	jp	00125$
;src/dng_crawling.c:27: case 0:
00101$:
;src/dng_crawling.c:28: for ( a=1; a<=4; a++){
	ldhl	sp,	#10
	ld	(hl), #0x01
	ld	d, (hl)
00191$:
;src/dng_crawling.c:29: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y-a);
	ldhl	sp,	#18
	ld	a, (hl-)
	sub	a, d
	push	bc
	push	de
	push	af
	inc	sp
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:30: if( w != 0x00 && w != 0x01 && dist == 0){
	ld	e,a
	or	a,a
	jr	Z, 00192$
	dec	a
	jr	Z, 00192$
;src/dng_crawling.c:31: dist = a;
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;src/dng_crawling.c:32: break;
	jr	00106$
00192$:
;src/dng_crawling.c:28: for ( a=1; a<=4; a++){
	inc	d
	ldhl	sp,	#10
	ld	(hl), d
	ld	a, #0x04
	sub	a, d
	jr	NC, 00191$
00106$:
;src/dng_crawling.c:35: l = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-dist);
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	b, a
	push	bc
	push	de
	push	bc
	inc	sp
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#22
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
	ldhl	sp,	#2
	ld	(hl), a
;src/dng_crawling.c:36: r = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-dist);
	push	bc
	push	de
	push	bc
	inc	sp
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#22
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
	ldhl	sp,	#3
	ld	(hl), a
;src/dng_crawling.c:38: break;
	jp	00125$
;src/dng_crawling.c:39: case 1:
00107$:
;src/dng_crawling.c:40: for ( a=1; a<=4; a++){
	ld	b, #0x01
	ld	d, b
00193$:
;src/dng_crawling.c:41: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+a, player_y);
	ldhl	sp,	#17
	ld	a, (hl+)
	add	a, d
	push	bc
	push	de
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#22
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:42: if( w != 0x00 && w != 0x01 && dist == 0){
	ld	e,a
	or	a,a
	jr	Z, 00194$
	dec	a
	jr	Z, 00194$
;src/dng_crawling.c:43: dist = a;
	ldhl	sp,	#0
	ld	(hl), b
;src/dng_crawling.c:44: break;
	jr	00112$
00194$:
;src/dng_crawling.c:40: for ( a=1; a<=4; a++){
	inc	d
	ld	b, d
	ld	a, #0x04
	sub	a, d
	jr	NC, 00193$
00112$:
;src/dng_crawling.c:47: l = return_value(dng,dungeon_width,dungeon_hieght,player_x+dist, player_y-1);
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	b, a
	push	bc
	push	de
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#22
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
	ldhl	sp,	#2
	ld	(hl), a
;src/dng_crawling.c:48: r = return_value(dng,dungeon_width,dungeon_hieght,player_x+dist, player_y+1);
	push	bc
	push	de
	ldhl	sp,	#14
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#22
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
	ldhl	sp,	#3
	ld	(hl), a
;src/dng_crawling.c:49: break;
	jp	00125$
;src/dng_crawling.c:50: case 2:
00113$:
;src/dng_crawling.c:51: for ( a=1; a<=4; a++){
	ld	b, #0x01
	ld	d, b
00195$:
;src/dng_crawling.c:52: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y+a);
	ldhl	sp,	#18
	ld	a, (hl-)
	add	a, d
	push	bc
	push	de
	push	af
	inc	sp
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:53: if( w != 0x00 && w != 0x01 && dist == 0){
	ld	e,a
	or	a,a
	jr	Z, 00196$
	dec	a
	jr	Z, 00196$
;src/dng_crawling.c:54: dist = a;
	ldhl	sp,	#0
	ld	(hl), b
;src/dng_crawling.c:55: break;
	jr	00118$
00196$:
;src/dng_crawling.c:51: for ( a=1; a<=4; a++){
	inc	d
	ld	b, d
	ld	a, #0x04
	sub	a, d
	jr	NC, 00195$
00118$:
;src/dng_crawling.c:58: l = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+dist);
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	b, a
	push	bc
	push	de
	push	bc
	inc	sp
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#22
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
	ldhl	sp,	#2
	ld	(hl), a
;src/dng_crawling.c:59: r = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+dist);
	push	bc
	push	de
	push	bc
	inc	sp
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#22
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
	ldhl	sp,	#3
	ld	(hl), a
;src/dng_crawling.c:60: break;
	jr	00125$
;src/dng_crawling.c:61: case 3:
00119$:
;src/dng_crawling.c:62: for ( a=1; a<=4; a++){
	ld	b, #0x01
	ld	d, b
00197$:
;src/dng_crawling.c:63: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-a, player_y);
	ldhl	sp,	#17
	ld	a, (hl+)
	sub	a, d
	push	bc
	push	de
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#22
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
;src/dng_crawling.c:64: if( w != 0x00 && w != 0x01 && dist == 0){
	ld	e,a
	or	a,a
	jr	Z, 00198$
	dec	a
	jr	Z, 00198$
;src/dng_crawling.c:65: dist = a;
	ldhl	sp,	#0
	ld	(hl), b
;src/dng_crawling.c:66: break;
	jr	00124$
00198$:
;src/dng_crawling.c:62: for ( a=1; a<=4; a++){
	inc	d
	ld	b, d
	ld	a, #0x04
	sub	a, d
	jr	NC, 00197$
00124$:
;src/dng_crawling.c:69: l = return_value(dng,dungeon_width,dungeon_hieght,player_x-dist, player_y+1);
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	b, a
	push	bc
	push	de
	ldhl	sp,	#14
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#22
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
	ldhl	sp,	#2
	ld	(hl), a
;src/dng_crawling.c:70: r = return_value(dng,dungeon_width,dungeon_hieght,player_x-dist, player_y-1);
	push	bc
	push	de
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#22
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
	ldhl	sp,	#3
	ld	(hl), a
;src/dng_crawling.c:72: }
00125$:
;src/dng_crawling.c:76: if( w == 0x03 && player_dir == 0|| w == 0x04 && player_dir == 1 ||w == 0x05 && player_dir == 2 || w==0x06 && player_dir == 3){
	ld	a, e
	sub	a, #0x03
	jr	NZ, 00131$
	ldhl	sp,	#19
	ld	a, (hl)
	or	a, a
	jr	Z, 00126$
00131$:
	ld	a, e
	sub	a, #0x04
	jr	NZ, 00133$
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00126$
00133$:
	ld	a, e
	sub	a, #0x05
	jr	NZ, 00135$
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	NZ, 00126$
00135$:
	ld	a, e
	sub	a, #0x06
	jr	NZ, 00127$
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00127$
00126$:
;src/dng_crawling.c:78: is_door = true;
	ld	e, #0x01
	jr	00128$
00127$:
;src/dng_crawling.c:81: is_door = false;
	ld	e, #0x00
00128$:
;src/dng_crawling.c:83: if(l!=0x00 && l!=0x01){
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00137$
	ld	a, (hl)
	dec	a
	jr	Z, 00137$
;src/dng_crawling.c:84: left_is_wall = true;
	ld	c, #0x01
00137$:
;src/dng_crawling.c:86: if(r!=0x00 && r!=0x01){
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00140$
	ld	a, (hl)
	dec	a
	jr	Z, 00140$
;src/dng_crawling.c:87: right_is_wall = true;
	ldhl	sp,	#1
	ld	(hl), #0x01
00140$:
;src/dng_crawling.c:90: switch (dist){
	ldhl	sp,	#0
	ld	a, (hl)
	dec	a
	jr	Z, 00142$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x02
	jp	Z,00158$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x03
	jp	Z,00174$
	jp	00199$
;src/dng_crawling.c:91: case 1:
00142$:
;src/dng_crawling.c:92: if(is_door){
	bit	0, e
	jr	Z, 00156$
;src/dng_crawling.c:93: if(left_is_wall){
	bit	0, c
	jr	Z, 00144$
;src/dng_crawling.c:94: set_bkg_tiles(4,3,6,9,door1_left_half_bkg);
	ld	de, #_door1_left_half_bkg
	push	de
	ld	hl, #0x906
	push	hl
	ld	hl, #0x304
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00145$
00144$:
;src/dng_crawling.c:96: set_bkg_tiles(4,3,6,9,door1_left_half_c_bkg);
	ld	de, #_door1_left_half_c_bkg
	push	de
	ld	hl, #0x906
	push	hl
	ld	hl, #0x304
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00145$:
;src/dng_crawling.c:98: if(right_is_wall){
	ldhl	sp,	#1
	bit	0, (hl)
	jr	Z, 00147$
;src/dng_crawling.c:99: set_bkg_tiles(10,3,6,9,door1_right_half_bkg);
	ld	de, #_door1_right_half_bkg
	push	de
	ld	hl, #0x906
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jp	00199$
00147$:
;src/dng_crawling.c:101: set_bkg_tiles(10,3,6,9,door1_right_half_c_bkg);
	ld	de, #_door1_right_half_c_bkg
	push	de
	ld	hl, #0x906
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jp	00199$
00156$:
;src/dng_crawling.c:104: if(left_is_wall){
	bit	0, c
	jr	Z, 00150$
;src/dng_crawling.c:105: set_bkg_tiles(4,3,6,9,wall1_half_bkg);
	ld	de, #_wall1_half_bkg
	push	de
	ld	hl, #0x906
	push	hl
	ld	hl, #0x304
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00151$
00150$:
;src/dng_crawling.c:107: set_bkg_tiles(4,3,6,9,wall1_left_half_c_bkg);
	ld	de, #_wall1_left_half_c_bkg
	push	de
	ld	hl, #0x906
	push	hl
	ld	hl, #0x304
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00151$:
;src/dng_crawling.c:109: if(right_is_wall){
	ldhl	sp,	#1
	bit	0, (hl)
	jr	Z, 00153$
;src/dng_crawling.c:110: set_bkg_tiles(10,3,6,9,wall1_half_bkg);
	ld	de, #_wall1_half_bkg
	push	de
	ld	hl, #0x906
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jp	00199$
00153$:
;src/dng_crawling.c:112: set_bkg_tiles(10,3,6,9,wall1_right_half_c_bkg);
	ld	de, #_wall1_right_half_c_bkg
	push	de
	ld	hl, #0x906
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/dng_crawling.c:115: break;
	jp	00199$
;src/dng_crawling.c:116: case 2:
00158$:
;src/dng_crawling.c:117: if(is_door){
	bit	0, e
	jr	Z, 00172$
;src/dng_crawling.c:118: if(left_is_wall){
	bit	0, c
	jr	Z, 00160$
;src/dng_crawling.c:119: set_bkg_tiles(6,3,4,9,door2_left_half_bkg);
	ld	de, #_door2_left_half_bkg
	push	de
	ld	hl, #0x904
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00161$
00160$:
;src/dng_crawling.c:121: set_bkg_tiles(6,3,4,9,door2_left_half_c_bkg);
	ld	de, #_door2_left_half_c_bkg
	push	de
	ld	hl, #0x904
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00161$:
;src/dng_crawling.c:123: if(right_is_wall){
	ldhl	sp,	#1
	bit	0, (hl)
	jr	Z, 00163$
;src/dng_crawling.c:124: set_bkg_tiles(10,3,4,9,door2_right_half_bkg);
	ld	de, #_door2_right_half_bkg
	push	de
	ld	hl, #0x904
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jp	00199$
00163$:
;src/dng_crawling.c:127: set_bkg_tiles(10,3,4,9,door2_right_half_c_bkg);
	ld	de, #_door2_right_half_c_bkg
	push	de
	ld	hl, #0x904
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jp	00199$
00172$:
;src/dng_crawling.c:130: if(left_is_wall){
	bit	0, c
	jr	Z, 00166$
;src/dng_crawling.c:131: set_bkg_tiles(6,3,4,9,wall2_half_bkg);
	ld	de, #_wall2_half_bkg
	push	de
	ld	hl, #0x904
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00167$
00166$:
;src/dng_crawling.c:133: set_bkg_tiles(6,3,4,9,wall2_left_half_c_bkg);
	ld	de, #_wall2_left_half_c_bkg
	push	de
	ld	hl, #0x904
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00167$:
;src/dng_crawling.c:135: if(right_is_wall){
	ldhl	sp,	#1
	bit	0, (hl)
	jr	Z, 00169$
;src/dng_crawling.c:136: set_bkg_tiles(10,3,4,9,wall2_half_bkg);
	ld	de, #_wall2_half_bkg
	push	de
	ld	hl, #0x904
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jp	00199$
00169$:
;src/dng_crawling.c:138: set_bkg_tiles(10,3,4,9,wall2_right_half_c_bkg);
	ld	de, #_wall2_right_half_c_bkg
	push	de
	ld	hl, #0x904
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/dng_crawling.c:141: break;
	jp	00199$
;src/dng_crawling.c:143: case 3:
00174$:
;src/dng_crawling.c:144: if(is_door){
	bit	0, e
	jr	Z, 00188$
;src/dng_crawling.c:145: if(left_is_wall){
	bit	0, c
	jr	Z, 00176$
;src/dng_crawling.c:146: set_bkg_tiles(7,3,3,9,door3_left_half_bkg);
	ld	de, #_door3_left_half_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x307
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00177$
00176$:
;src/dng_crawling.c:148: set_bkg_tiles(7,3,3,9,door3_left_half_c_bkg);
	ld	de, #_door3_left_half_c_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x307
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00177$:
;src/dng_crawling.c:150: if(right_is_wall){
	ldhl	sp,	#1
	bit	0, (hl)
	jr	Z, 00179$
;src/dng_crawling.c:151: set_bkg_tiles(10,3,3,9,door3_right_half_bkg);
	ld	bc, #_door3_right_half_bkg
	push	bc
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00199$
00179$:
;src/dng_crawling.c:153: set_bkg_tiles(10,3,3,9,door3_right_half_c_bkg);
	ld	bc, #_door3_right_half_c_bkg
	push	bc
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00199$
00188$:
;src/dng_crawling.c:156: if(left_is_wall){
	bit	0, c
	jr	Z, 00182$
;src/dng_crawling.c:157: set_bkg_tiles(7,3,3,9,wall3_half_bkg);
	ld	de, #_wall3_half_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x307
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00183$
00182$:
;src/dng_crawling.c:159: set_bkg_tiles(7,3,3,9,wall3_left_half_c_bkg);
	ld	de, #_wall3_left_half_c_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x307
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00183$:
;src/dng_crawling.c:161: if(right_is_wall){
	ldhl	sp,	#1
	bit	0, (hl)
	jr	Z, 00185$
;src/dng_crawling.c:162: set_bkg_tiles(10,3,3,9,wall3_half_bkg);
	ld	bc, #_wall3_half_bkg
	push	bc
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00199$
00185$:
;src/dng_crawling.c:164: set_bkg_tiles(10,3,3,9,wall3_right_half_c_bkg);
	ld	bc, #_wall3_right_half_c_bkg
	push	bc
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/dng_crawling.c:168: }
00199$:
;src/dng_crawling.c:169: }
	add	sp, #14
	pop	hl
	add	sp, #4
	jp	(hl)
;src/dng_crawling.c:171: void check_l_walls(const unsigned char *dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y ,uint8_t player_dir){
;	---------------------------------
; Function check_l_walls
; ---------------------------------
_check_l_walls::
	add	sp, #-15
	ldhl	sp,	#12
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
	ld	(hl), a
;src/dng_crawling.c:172: unsigned char w[]={0x00,0x00,0x00,0x00};
	ldhl	sp,	#0
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
;src/dng_crawling.c:173: unsigned char d=0x00;
	xor	a, a
	ld	(hl+), a
;src/dng_crawling.c:174: unsigned char nd=0x00;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/dng_crawling.c:179: w[i] = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-i);    
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
;src/dng_crawling.c:176: switch(player_dir){
	ldhl	sp,	#20
	ld	a, (hl)
	or	a, a
	jr	Z, 00166$
	ldhl	sp,	#20
	ld	a, (hl)
	dec	a
	jr	Z, 00168$
	ldhl	sp,	#20
	ld	a, (hl)
	sub	a, #0x02
	jp	Z,00170$
	ldhl	sp,	#20
	ld	a, (hl)
	sub	a, #0x03
	jp	Z,00172$
	jp	00181$
;src/dng_crawling.c:178: for (i=0; i<4; i++){
00166$:
	ldhl	sp,	#9
	ld	(hl), #0x00
00149$:
;src/dng_crawling.c:179: w[i] = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-i);    
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	push	hl
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	sub	a, (hl)
	ldhl	sp,	#14
	ld	b, (hl)
	dec	b
	push	af
	inc	sp
	push	bc
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
	ld	c, a
	ldhl	sp,	#7
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;src/dng_crawling.c:178: for (i=0; i<4; i++){
	ldhl	sp,	#9
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00149$
;src/dng_crawling.c:181: d=0x06;
	ldhl	sp,	#4
;src/dng_crawling.c:182: nd=0x03;
	ld	a, #0x06
	ld	(hl+), a
	ld	(hl), #0x03
;src/dng_crawling.c:183: break;
	jp	00181$
;src/dng_crawling.c:185: for (i=0; i<4; i++){
00168$:
	ld	c, #0x00
00151$:
;src/dng_crawling.c:186: w[i] = return_value(dng,dungeon_width,dungeon_hieght,player_x+i, player_y-1);
	ld	a, c
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#10
	ld	b, (hl)
	dec	b
	ldhl	sp,	#14
	ld	a, (hl)
	add	a, c
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#23
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
	ld	(de), a
;src/dng_crawling.c:185: for (i=0; i<4; i++){
	inc	c
	ld	a, c
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00151$
;src/dng_crawling.c:188: d=0x03;
	ldhl	sp,	#4
;src/dng_crawling.c:189: nd=0x04;
	ld	a, #0x03
	ld	(hl+), a
	ld	(hl), #0x04
;src/dng_crawling.c:190: break;
	jr	00181$
;src/dng_crawling.c:192: for (i=0; i<4; i++){
00170$:
	ld	c, #0x00
00153$:
;src/dng_crawling.c:193: w[i] = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+i);
	ld	a, c
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#10
	ld	a, (hl)
	add	a, c
	ldhl	sp,	#14
	ld	b, (hl)
	inc	b
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#23
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
	ld	(de), a
;src/dng_crawling.c:192: for (i=0; i<4; i++){
	inc	c
	ld	a, c
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00153$
;src/dng_crawling.c:195: d=0x04;
	ldhl	sp,	#4
;src/dng_crawling.c:196: nd=0x05;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x05
;src/dng_crawling.c:197: break;
	jr	00181$
;src/dng_crawling.c:199: for (i=0; i<4; i++){
00172$:
	ld	c, #0x00
00155$:
;src/dng_crawling.c:200: w[i] = return_value(dng,dungeon_width,dungeon_hieght,player_x-i, player_y+1);
	ld	a, c
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#10
	ld	b, (hl)
	inc	b
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, c
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#23
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
	ld	(de), a
;src/dng_crawling.c:199: for (i=0; i<4; i++){
	inc	c
	ld	a, c
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00155$
;src/dng_crawling.c:202: d=0x05;
	ldhl	sp,	#4
;src/dng_crawling.c:203: nd=0x06;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x06
;src/dng_crawling.c:206: for(i=3, i>=0; i--;){
00181$:
	ldhl	sp,	#14
	ld	(hl), #0x03
00158$:
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#14
	dec	(hl)
	ldhl	sp,	#10
	ld	a, (hl)
	or	a, a
	jp	Z, 00160$
;src/dng_crawling.c:207: if(w[i]!=0x00 && w[i]!=0x01){
	ldhl	sp,	#14
	ld	a, (hl)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	hl, #0
	add	hl, sp
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;src/dng_crawling.c:209: if(i==2) if(w[i]==d) set_bkg_tiles(6,3,1,9,door3_l_bkg); else set_bkg_tiles(6,3,1,9,wall3_l_bkg);
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00327$
	xor	a, a
00327$:
	ldhl	sp,	#9
	ld	(hl), a
;src/dng_crawling.c:210: if(i==1) if(w[i]==d) set_bkg_tiles(4,3,2,9,door2_l_bkg); else set_bkg_tiles(4,3,2,9,wall2_l_bkg);
	ldhl	sp,	#14
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00329$
	xor	a, a
00329$:
	ldhl	sp,	#10
;src/dng_crawling.c:207: if(w[i]!=0x00 && w[i]!=0x01){
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	or	a, a
	jp	Z, 00145$
	ld	a, (hl)
	dec	a
	jp	Z,00145$
;src/dng_crawling.c:209: if(i==2) if(w[i]==d) set_bkg_tiles(6,3,1,9,door3_l_bkg); else set_bkg_tiles(6,3,1,9,wall3_l_bkg);
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00114$
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#8
	sub	a, (hl)
	jr	NZ, 00111$
	ld	de, #_door3_l_bkg
	push	de
	ld	hl, #0x901
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00114$
00111$:
	ld	de, #_wall3_l_bkg
	push	de
	ld	hl, #0x901
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00114$:
;src/dng_crawling.c:210: if(i==1) if(w[i]==d) set_bkg_tiles(4,3,2,9,door2_l_bkg); else set_bkg_tiles(4,3,2,9,wall2_l_bkg);
	ldhl	sp,	#10
	ld	a, (hl)
	or	a, a
	jr	Z, 00119$
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00116$
	ld	de, #_door2_l_bkg
	push	de
	ld	hl, #0x902
	push	hl
	ld	hl, #0x304
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00119$
00116$:
	ld	de, #_wall2_l_bkg
	push	de
	ld	hl, #0x902
	push	hl
	ld	hl, #0x304
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00119$:
;src/dng_crawling.c:211: if(i==0) if(w[i]==d) set_bkg_tiles(1,3,3,9,door1_l_bkg); else set_bkg_tiles(1,3,3,9,wall1_l_bkg);
	ldhl	sp,	#14
	ld	a, (hl)
	or	a, a
	jp	NZ, 00158$
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00121$
	ld	de, #_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jp	00158$
00121$:
	ld	de, #_wall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jp	00158$
00145$:
;src/dng_crawling.c:213: if(w[i]==0x00 && w[i+1]!=0x00 && w[i+1]!=0x01){
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jp	NZ, 00158$
	ldhl	sp,	#14
	ld	a, (hl)
	inc	a
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	hl, #0
	add	hl, sp
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl),a
	or	a,a
	jp	Z,00158$
	dec	a
	jp	Z,00158$
;src/dng_crawling.c:214: if(i==2) if(w[i+1]==nd) set_bkg_tiles(1,3,6,9,nowall_door3_l_bkg); else set_bkg_tiles(1,3,6,9,nowall3_l_bkg);
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00129$
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#8
	sub	a, (hl)
	jr	NZ, 00126$
	push	de
	ld	bc, #_nowall_door3_l_bkg
	push	bc
	ld	hl, #0x906
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00129$
00126$:
	push	de
	ld	bc, #_nowall3_l_bkg
	push	bc
	ld	hl, #0x906
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00129$:
;src/dng_crawling.c:215: if(i==1) if(w[i+1]==nd) set_bkg_tiles(1,3,5,9,nowall_door2_l_bkg); else set_bkg_tiles(1,3,5,9,nowall2_l_bkg);
	ldhl	sp,	#10
	ld	a, (hl)
	or	a, a
	jr	Z, 00134$
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00131$
	push	de
	ld	bc, #_nowall_door2_l_bkg
	push	bc
	ld	hl, #0x905
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00134$
00131$:
	push	de
	ld	bc, #_nowall2_l_bkg
	push	bc
	ld	hl, #0x905
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00134$:
;src/dng_crawling.c:216: if(i==0) if(w[i+1]==nd) set_bkg_tiles(1,3,3,9,nowall_door1_l_bkg); else set_bkg_tiles(1,3,3,9,nowall1_l_bkg);
	ldhl	sp,	#14
	ld	a, (hl)
	or	a, a
	jp	NZ, 00158$
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00136$
	ld	de, #_nowall_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jp	00158$
00136$:
	ld	de, #_nowall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jp	00158$
00160$:
;src/dng_crawling.c:221: }
	add	sp, #15
	pop	hl
	add	sp, #4
	jp	(hl)
;src/dng_crawling.c:223: void check_r_walls(const unsigned char *dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y ,uint8_t player_dir){
;	---------------------------------
; Function check_r_walls
; ---------------------------------
_check_r_walls::
	add	sp, #-15
	ldhl	sp,	#12
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
	ld	(hl), a
;src/dng_crawling.c:224: unsigned char w[]={0x00,0x00,0x00,0x00};
	ldhl	sp,	#0
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
;src/dng_crawling.c:225: unsigned char d=0x00;
	xor	a, a
	ld	(hl+), a
;src/dng_crawling.c:226: unsigned char nd=0x00;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/dng_crawling.c:231: w[i] = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-i);    
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
;src/dng_crawling.c:228: switch(player_dir){
	ldhl	sp,	#20
	ld	a, (hl)
	or	a, a
	jr	Z, 00166$
	ldhl	sp,	#20
	ld	a, (hl)
	dec	a
	jr	Z, 00168$
	ldhl	sp,	#20
	ld	a, (hl)
	sub	a, #0x02
	jp	Z,00170$
	ldhl	sp,	#20
	ld	a, (hl)
	sub	a, #0x03
	jp	Z,00172$
	jp	00181$
;src/dng_crawling.c:230: for (i=0; i<4; i++){
00166$:
	ldhl	sp,	#9
	ld	(hl), #0x00
00149$:
;src/dng_crawling.c:231: w[i] = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-i);    
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	push	hl
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	sub	a, (hl)
	ldhl	sp,	#14
	ld	b, (hl)
	inc	b
	push	af
	inc	sp
	push	bc
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
	ld	c, a
	ldhl	sp,	#7
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;src/dng_crawling.c:230: for (i=0; i<4; i++){
	ldhl	sp,	#9
	inc	(hl)
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00149$
;src/dng_crawling.c:233: d=0x04;
	ldhl	sp,	#4
;src/dng_crawling.c:234: nd=0x03;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x03
;src/dng_crawling.c:235: break;
	jp	00181$
;src/dng_crawling.c:237: for (i=0; i<4; i++){
00168$:
	ld	c, #0x00
00151$:
;src/dng_crawling.c:238: w[i] = return_value(dng,dungeon_width,dungeon_hieght,player_x+i, player_y+1);
	ld	a, c
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#10
	ld	b, (hl)
	inc	b
	ldhl	sp,	#14
	ld	a, (hl)
	add	a, c
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#23
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
	ld	(de), a
;src/dng_crawling.c:237: for (i=0; i<4; i++){
	inc	c
	ld	a, c
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00151$
;src/dng_crawling.c:240: d=0x05;
	ldhl	sp,	#4
;src/dng_crawling.c:241: nd=0x04;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x04
;src/dng_crawling.c:242: break;
	jr	00181$
;src/dng_crawling.c:244: for (i=0; i<4; i++){
00170$:
	ld	c, #0x00
00153$:
;src/dng_crawling.c:245: w[i] = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+i);
	ld	a, c
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#10
	ld	a, (hl)
	add	a, c
	ldhl	sp,	#14
	ld	b, (hl)
	dec	b
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#23
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
	ld	(de), a
;src/dng_crawling.c:244: for (i=0; i<4; i++){
	inc	c
	ld	a, c
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00153$
;src/dng_crawling.c:247: d=0x06;
	ldhl	sp,	#4
;src/dng_crawling.c:248: nd=0x05;
	ld	a, #0x06
	ld	(hl+), a
	ld	(hl), #0x05
;src/dng_crawling.c:249: break;
	jr	00181$
;src/dng_crawling.c:251: for (i=0; i<4; i++){
00172$:
	ld	c, #0x00
00155$:
;src/dng_crawling.c:252: w[i] = return_value(dng,dungeon_width,dungeon_hieght,player_x-i, player_y-1);
	ld	a, c
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#10
	ld	b, (hl)
	dec	b
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, c
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#23
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	de
	pop	bc
	ld	(de), a
;src/dng_crawling.c:251: for (i=0; i<4; i++){
	inc	c
	ld	a, c
	xor	a, #0x80
	sub	a, #0x84
	jr	C, 00155$
;src/dng_crawling.c:254: d=0x03;
	ldhl	sp,	#4
;src/dng_crawling.c:255: nd=0x06;
	ld	a, #0x03
	ld	(hl+), a
	ld	(hl), #0x06
;src/dng_crawling.c:258: for(i=3, i>=0; i--;){
00181$:
	ldhl	sp,	#14
	ld	(hl), #0x03
00158$:
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#14
	dec	(hl)
	ldhl	sp,	#10
	ld	a, (hl)
	or	a, a
	jp	Z, 00160$
;src/dng_crawling.c:259: if(w[i]!=0x00 && w[i]!=0x01){
	ldhl	sp,	#14
	ld	a, (hl)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	hl, #0
	add	hl, sp
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;src/dng_crawling.c:261: if(i==2) if(w[i]==d) set_bkg_tiles(13,3,1,9,door3_r_bkg); else set_bkg_tiles(13,3,1,9,wall3_r_bkg);
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00327$
	xor	a, a
00327$:
	ldhl	sp,	#9
	ld	(hl), a
;src/dng_crawling.c:262: if(i==1) if(w[i]==d) set_bkg_tiles(14,3,2,9,door2_r_bkg); else set_bkg_tiles(14,3,2,9,wall2_r_bkg);
	ldhl	sp,	#14
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00329$
	xor	a, a
00329$:
	ldhl	sp,	#10
;src/dng_crawling.c:259: if(w[i]!=0x00 && w[i]!=0x01){
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	or	a, a
	jp	Z, 00145$
	ld	a, (hl)
	dec	a
	jp	Z,00145$
;src/dng_crawling.c:261: if(i==2) if(w[i]==d) set_bkg_tiles(13,3,1,9,door3_r_bkg); else set_bkg_tiles(13,3,1,9,wall3_r_bkg);
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00114$
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#8
	sub	a, (hl)
	jr	NZ, 00111$
	ld	de, #_door3_r_bkg
	push	de
	ld	hl, #0x901
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00114$
00111$:
	ld	de, #_wall3_r_bkg
	push	de
	ld	hl, #0x901
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00114$:
;src/dng_crawling.c:262: if(i==1) if(w[i]==d) set_bkg_tiles(14,3,2,9,door2_r_bkg); else set_bkg_tiles(14,3,2,9,wall2_r_bkg);
	ldhl	sp,	#10
	ld	a, (hl)
	or	a, a
	jr	Z, 00119$
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00116$
	ld	de, #_door2_r_bkg
	push	de
	ld	hl, #0x902
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00119$
00116$:
	ld	de, #_wall2_r_bkg
	push	de
	ld	hl, #0x902
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00119$:
;src/dng_crawling.c:263: if(i==0) if(w[i]==d) set_bkg_tiles(16,3,3,9,door1_r_bkg); else set_bkg_tiles(16,3,3,9,wall1_r_bkg);
	ldhl	sp,	#14
	ld	a, (hl)
	or	a, a
	jp	NZ, 00158$
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00121$
	ld	de, #_door1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x310
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jp	00158$
00121$:
	ld	de, #_wall1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x310
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jp	00158$
00145$:
;src/dng_crawling.c:265: if(w[i]==0x00 && w[i+1]!=0x00 && w[i+1]!=0x01){
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jp	NZ, 00158$
	ldhl	sp,	#14
	ld	a, (hl)
	inc	a
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	hl, #0
	add	hl, sp
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl),a
	or	a,a
	jp	Z,00158$
	dec	a
	jp	Z,00158$
;src/dng_crawling.c:266: if(i==2) if(w[i+1]==nd) set_bkg_tiles(13,3,6,9,nowall_door3_r_bkg); else set_bkg_tiles(13,3,6,9,nowall3_r_bkg);
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00129$
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#8
	sub	a, (hl)
	jr	NZ, 00126$
	push	de
	ld	bc, #_nowall_door3_r_bkg
	push	bc
	ld	hl, #0x906
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00129$
00126$:
	push	de
	ld	bc, #_nowall3_r_bkg
	push	bc
	ld	hl, #0x906
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00129$:
;src/dng_crawling.c:267: if(i==1) if(w[i+1]==nd) set_bkg_tiles(14,3,5,9,nowall_door2_r_bkg); else set_bkg_tiles(14,3,5,9,nowall2_r_bkg);
	ldhl	sp,	#10
	ld	a, (hl)
	or	a, a
	jr	Z, 00134$
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00131$
	push	de
	ld	bc, #_nowall_door2_r_bkg
	push	bc
	ld	hl, #0x905
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00134$
00131$:
	push	de
	ld	bc, #_nowall2_r_bkg
	push	bc
	ld	hl, #0x905
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00134$:
;src/dng_crawling.c:268: if(i==0) if(w[i+1]==nd) set_bkg_tiles(16,3,3,9,nowall_door1_r_bkg); else set_bkg_tiles(16,3,3,9,nowall1_r_bkg);
	ldhl	sp,	#14
	ld	a, (hl)
	or	a, a
	jp	NZ, 00158$
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00136$
	ld	de, #_nowall_door1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x310
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jp	00158$
00136$:
	ld	de, #_nowall1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x310
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jp	00158$
00160$:
;src/dng_crawling.c:273: }
	add	sp, #15
	pop	hl
	add	sp, #4
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
