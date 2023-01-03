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
	add	sp, #-16
	ldhl	sp,	#14
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
	ld	(hl), a
;src/dng_crawling.c:19: uint8_t dist = 0; //0 - no wall; 1 - wall1; 2 - wall2; 3 - wall3;
	ldhl	sp,	#0
;src/dng_crawling.c:20: bool left_is_wall = false;
	xor	a, a
	ld	(hl+), a
;src/dng_crawling.c:21: bool right_is_wall = false;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/dng_crawling.c:23: switch(player_dir){
	ldhl	sp,	#21
	ld	a, (hl)
	or	a, a
	ld	a, #0x01
	jr	Z, 00416$
	xor	a, a
00416$:
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,	#3
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ldhl	sp,	#21
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00418$
	xor	a, a
00418$:
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00420$
	xor	a, a
00420$:
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00422$
	xor	a, a
00422$:
	ldhl	sp,	#8
	ld	(hl), a
;src/dng_crawling.c:32: l = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-dist);
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl), a
	dec	a
	ldhl	sp,	#9
	ld	(hl), a
;src/dng_crawling.c:33: r = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-dist);
	ldhl	sp,	#12
	ld	a, (hl-)
	dec	hl
	inc	a
;src/dng_crawling.c:23: switch(player_dir){
	ld	(hl+), a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00101$
;src/dng_crawling.c:44: l = return_value(dng,dungeon_width,dungeon_hieght,player_x+dist, player_y-1);
	ldhl	sp,	#20
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl-), a
	dec	a
;src/dng_crawling.c:45: r = return_value(dng,dungeon_width,dungeon_hieght,player_x+dist, player_y+1);
	ld	(hl+), a
	inc	(hl)
;src/dng_crawling.c:23: switch(player_dir){
	ldhl	sp,	#6
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
;src/dng_crawling.c:24: case 0:
00101$:
;src/dng_crawling.c:25: for ( a=1; a<=4; a++){
	ldhl	sp,	#11
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x01
00191$:
;src/dng_crawling.c:26: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y-a);
	ldhl	sp,	#20
	ld	a, (hl)
	ldhl	sp,	#12
	sub	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#20
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	ldhl	sp,	#3
;src/dng_crawling.c:27: if( w != 0x00 && w != 0x01 && dist == 0){
	ld	(hl),a
	or	a,a
	jr	Z, 00192$
	dec	a
	jr	Z, 00192$
;src/dng_crawling.c:28: dist = a;
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;src/dng_crawling.c:29: break;
	jr	00106$
00192$:
;src/dng_crawling.c:25: for ( a=1; a<=4; a++){
	ldhl	sp,	#12
	inc	(hl)
	ld	a, (hl-)
	ld	(hl+), a
	ld	a, #0x04
	sub	a, (hl)
	jr	NC, 00191$
00106$:
;src/dng_crawling.c:32: l = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-dist);
	ldhl	sp,	#20
	ld	a, (hl)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	b, a
	push	bc
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
	pop	bc
	ldhl	sp,	#4
	ld	(hl), a
;src/dng_crawling.c:33: r = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-dist);
	push	bc
	inc	sp
	ldhl	sp,	#11
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#20
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	ldhl	sp,	#5
	ld	(hl), a
;src/dng_crawling.c:35: break;
	jp	00125$
;src/dng_crawling.c:36: case 1:
00107$:
;src/dng_crawling.c:37: for ( a=1; a<=4; a++){
	ldhl	sp,	#9
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x01
00193$:
;src/dng_crawling.c:38: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+a, player_y);
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#10
	add	a, (hl)
	ldhl	sp,	#20
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#20
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	ldhl	sp,	#3
;src/dng_crawling.c:39: if( w != 0x00 && w != 0x01 && dist == 0){
	ld	(hl),a
	or	a,a
	jr	Z, 00194$
	dec	a
	jr	Z, 00194$
;src/dng_crawling.c:40: dist = a;
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;src/dng_crawling.c:41: break;
	jr	00112$
00194$:
;src/dng_crawling.c:37: for ( a=1; a<=4; a++){
	ldhl	sp,	#10
	inc	(hl)
	ld	a, (hl-)
	ld	(hl+), a
	ld	a, #0x04
	sub	a, (hl)
	jr	NC, 00193$
00112$:
;src/dng_crawling.c:44: l = return_value(dng,dungeon_width,dungeon_hieght,player_x+dist, player_y-1);
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	b, a
	push	bc
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
	pop	bc
	ldhl	sp,	#4
	ld	(hl), a
;src/dng_crawling.c:45: r = return_value(dng,dungeon_width,dungeon_hieght,player_x+dist, player_y+1);
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#20
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	ldhl	sp,	#5
	ld	(hl), a
;src/dng_crawling.c:46: break;
	jp	00125$
;src/dng_crawling.c:47: case 2:
00113$:
;src/dng_crawling.c:48: for ( a=1; a<=4; a++){
	ld	bc, #0x101
00195$:
;src/dng_crawling.c:49: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y+a);
	ldhl	sp,	#20
	ld	a, (hl-)
	add	a, c
	push	bc
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
	pop	bc
	ldhl	sp,	#3
;src/dng_crawling.c:50: if( w != 0x00 && w != 0x01 && dist == 0){
	ld	(hl),a
	or	a,a
	jr	Z, 00196$
	dec	a
	jr	Z, 00196$
;src/dng_crawling.c:51: dist = a;
	ldhl	sp,	#0
	ld	(hl), b
;src/dng_crawling.c:52: break;
	jr	00118$
00196$:
;src/dng_crawling.c:48: for ( a=1; a<=4; a++){
	inc	c
	ld	b, c
	ld	a, #0x04
	sub	a, c
	jr	NC, 00195$
00118$:
;src/dng_crawling.c:55: l = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+dist);
	ldhl	sp,	#20
	ld	a, (hl)
	ldhl	sp,	#0
	add	a, (hl)
	ld	b, a
	push	bc
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
	pop	bc
	ldhl	sp,	#4
	ld	(hl), a
;src/dng_crawling.c:56: r = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+dist);
	push	bc
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#20
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	ldhl	sp,	#5
	ld	(hl), a
;src/dng_crawling.c:57: break;
	jr	00125$
;src/dng_crawling.c:58: case 3:
00119$:
;src/dng_crawling.c:59: for ( a=1; a<=4; a++){
	ldhl	sp,	#10
	ld	(hl), #0x01
	ld	c, (hl)
00197$:
;src/dng_crawling.c:60: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-a, player_y);
	ldhl	sp,	#19
	ld	a, (hl+)
	sub	a, c
	push	bc
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
	pop	bc
	ldhl	sp,	#3
;src/dng_crawling.c:61: if( w != 0x00 && w != 0x01 && dist == 0){
	ld	(hl),a
	or	a,a
	jr	Z, 00198$
	dec	a
	jr	Z, 00198$
;src/dng_crawling.c:62: dist = a;
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;src/dng_crawling.c:63: break;
	jr	00124$
00198$:
;src/dng_crawling.c:59: for ( a=1; a<=4; a++){
	inc	c
	ldhl	sp,	#10
	ld	(hl), c
	ld	a, #0x04
	sub	a, c
	jr	NC, 00197$
00124$:
;src/dng_crawling.c:66: l = return_value(dng,dungeon_width,dungeon_hieght,player_x-dist, player_y+1);
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#0
	sub	a, (hl)
	ldhl	sp,	#10
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#20
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	ldhl	sp,	#4
	ld	(hl), a
;src/dng_crawling.c:67: r = return_value(dng,dungeon_width,dungeon_hieght,player_x-dist, player_y-1);
	ldhl	sp,	#11
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	ldhl	sp,	#20
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	ldhl	sp,	#5
	ld	(hl), a
;src/dng_crawling.c:69: }
00125$:
;src/dng_crawling.c:73: if( w == 0x03 && player_dir == 0|| w == 0x04 && player_dir == 1 ||w == 0x05 && player_dir == 2 || w==0x06 && player_dir == 3){
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ, 00131$
	ldhl	sp,	#21
	ld	a, (hl)
	or	a, a
	jr	Z, 00126$
00131$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00133$
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	NZ, 00126$
00133$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x05
	jr	NZ, 00135$
	ldhl	sp,	#7
	ld	a, (hl)
	or	a, a
	jr	NZ, 00126$
00135$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00127$
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jr	Z, 00127$
00126$:
;src/dng_crawling.c:75: is_door = true;
	ldhl	sp,	#12
	ld	(hl), #0x01
	jr	00128$
00127$:
;src/dng_crawling.c:78: is_door = false;
	ldhl	sp,	#12
	ld	(hl), #0x00
00128$:
;src/dng_crawling.c:80: if(l!=0x00 && l!=0x01){
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00137$
	ld	a, (hl)
	dec	a
	jr	Z, 00137$
;src/dng_crawling.c:81: left_is_wall = true;
	ldhl	sp,	#1
	ld	(hl), #0x01
00137$:
;src/dng_crawling.c:83: if(r!=0x00 && r!=0x01){
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	Z, 00140$
	ld	a, (hl)
	dec	a
	jr	Z, 00140$
;src/dng_crawling.c:84: right_is_wall = true;
	ldhl	sp,	#2
	ld	(hl), #0x01
00140$:
;src/dng_crawling.c:87: switch (dist){
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
;src/dng_crawling.c:88: case 1:
00142$:
;src/dng_crawling.c:89: if(is_door){
	ldhl	sp,	#12
	bit	0, (hl)
	jr	Z, 00156$
;src/dng_crawling.c:90: if(left_is_wall){
	ldhl	sp,	#1
	bit	0, (hl)
	jr	Z, 00144$
;src/dng_crawling.c:91: set_bkg_tiles(4,3,6,9,door1_left_half_bkg);
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
;src/dng_crawling.c:93: set_bkg_tiles(4,3,6,9,door1_left_half_c_bkg);
	ld	de, #_door1_left_half_c_bkg
	push	de
	ld	hl, #0x906
	push	hl
	ld	hl, #0x304
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00145$:
;src/dng_crawling.c:95: if(right_is_wall){
	ldhl	sp,	#2
	bit	0, (hl)
	jr	Z, 00147$
;src/dng_crawling.c:96: set_bkg_tiles(10,3,6,9,door1_right_half_bkg);
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
;src/dng_crawling.c:98: set_bkg_tiles(10,3,6,9,door1_right_half_c_bkg);
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
;src/dng_crawling.c:101: if(left_is_wall){
	ldhl	sp,	#1
	bit	0, (hl)
	jr	Z, 00150$
;src/dng_crawling.c:102: set_bkg_tiles(4,3,6,9,wall1_half_bkg);
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
;src/dng_crawling.c:104: set_bkg_tiles(4,3,6,9,wall1_left_half_c_bkg);
	ld	de, #_wall1_left_half_c_bkg
	push	de
	ld	hl, #0x906
	push	hl
	ld	hl, #0x304
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00151$:
;src/dng_crawling.c:106: if(right_is_wall){
	ldhl	sp,	#2
	bit	0, (hl)
	jr	Z, 00153$
;src/dng_crawling.c:107: set_bkg_tiles(10,3,6,9,wall1_half_bkg);
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
;src/dng_crawling.c:109: set_bkg_tiles(10,3,6,9,wall1_right_half_c_bkg);
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
;src/dng_crawling.c:112: break;
	jp	00199$
;src/dng_crawling.c:113: case 2:
00158$:
;src/dng_crawling.c:114: if(is_door){
	ldhl	sp,	#12
	bit	0, (hl)
	jr	Z, 00172$
;src/dng_crawling.c:115: if(left_is_wall){
	ldhl	sp,	#1
	bit	0, (hl)
	jr	Z, 00160$
;src/dng_crawling.c:116: set_bkg_tiles(6,3,4,9,door2_left_half_bkg);
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
;src/dng_crawling.c:118: set_bkg_tiles(6,3,4,9,door2_left_half_c_bkg);
	ld	de, #_door2_left_half_c_bkg
	push	de
	ld	hl, #0x904
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00161$:
;src/dng_crawling.c:120: if(right_is_wall){
	ldhl	sp,	#2
	bit	0, (hl)
	jr	Z, 00163$
;src/dng_crawling.c:121: set_bkg_tiles(10,3,4,9,door2_right_half_bkg);
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
;src/dng_crawling.c:124: set_bkg_tiles(10,3,4,9,door2_right_half_c_bkg);
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
;src/dng_crawling.c:127: if(left_is_wall){
	ldhl	sp,	#1
	bit	0, (hl)
	jr	Z, 00166$
;src/dng_crawling.c:128: set_bkg_tiles(6,3,4,9,wall2_half_bkg);
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
;src/dng_crawling.c:130: set_bkg_tiles(6,3,4,9,wall2_left_half_c_bkg);
	ld	de, #_wall2_left_half_c_bkg
	push	de
	ld	hl, #0x904
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00167$:
;src/dng_crawling.c:132: if(right_is_wall){
	ldhl	sp,	#2
	bit	0, (hl)
	jr	Z, 00169$
;src/dng_crawling.c:133: set_bkg_tiles(10,3,4,9,wall2_half_bkg);
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
;src/dng_crawling.c:135: set_bkg_tiles(10,3,4,9,wall2_right_half_c_bkg);
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
;src/dng_crawling.c:138: break;
	jp	00199$
;src/dng_crawling.c:140: case 3:
00174$:
;src/dng_crawling.c:141: if(is_door){
	ldhl	sp,	#12
	bit	0, (hl)
	jr	Z, 00188$
;src/dng_crawling.c:142: if(left_is_wall){
	ldhl	sp,	#1
	bit	0, (hl)
	jr	Z, 00176$
;src/dng_crawling.c:143: set_bkg_tiles(7,3,3,9,door3_left_half_bkg);
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
;src/dng_crawling.c:145: set_bkg_tiles(7,3,3,9,door3_left_half_c_bkg);
	ld	de, #_door3_left_half_c_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x307
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00177$:
;src/dng_crawling.c:147: if(right_is_wall){
	ldhl	sp,	#2
	bit	0, (hl)
	jr	Z, 00179$
;src/dng_crawling.c:148: set_bkg_tiles(10,3,3,9,door3_right_half_bkg);
	ld	de, #_door3_right_half_bkg
	push	de
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
;src/dng_crawling.c:150: set_bkg_tiles(10,3,3,9,door3_right_half_c_bkg);
	ld	de, #_door3_right_half_c_bkg
	push	de
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
;src/dng_crawling.c:153: if(left_is_wall){
	ldhl	sp,	#1
	bit	0, (hl)
	jr	Z, 00182$
;src/dng_crawling.c:154: set_bkg_tiles(7,3,3,9,wall3_half_bkg);
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
;src/dng_crawling.c:156: set_bkg_tiles(7,3,3,9,wall3_left_half_c_bkg);
	ld	de, #_wall3_left_half_c_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x307
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00183$:
;src/dng_crawling.c:158: if(right_is_wall){
	ldhl	sp,	#2
	bit	0, (hl)
	jr	Z, 00185$
;src/dng_crawling.c:159: set_bkg_tiles(10,3,3,9,wall3_half_bkg);
	ld	de, #_wall3_half_bkg
	push	de
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
;src/dng_crawling.c:161: set_bkg_tiles(10,3,3,9,wall3_right_half_c_bkg);
	ld	de, #_wall3_right_half_c_bkg
	push	de
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
;src/dng_crawling.c:165: }
00199$:
;src/dng_crawling.c:166: }
	add	sp, #16
	pop	hl
	add	sp, #4
	jp	(hl)
;src/dng_crawling.c:168: void check_l_walls(const unsigned char *dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y ,uint8_t player_dir){
;	---------------------------------
; Function check_l_walls
; ---------------------------------
_check_l_walls::
	add	sp, #-20
	ldhl	sp,	#17
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
	ld	(hl), a
;src/dng_crawling.c:169: int8_t dirx = 0;
	ldhl	sp,	#3
;src/dng_crawling.c:170: int8_t diry = 0;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/dng_crawling.c:173: unsigned char walls[]={0,0,0};
	ldhl	sp,	#0
	xor	a, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/dng_crawling.c:174: switch (player_dir){
	ldhl	sp,	#25
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00348$
	xor	a, a
00348$:
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00350$
	xor	a, a
00350$:
	ldhl	sp,	#15
	ld	(hl), a
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00352$
	xor	a, a
00352$:
	ldhl	sp,	#19
	ld	(hl), a
	ldhl	sp,	#25
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
	ldhl	sp,	#14
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00103$
	ldhl	sp,	#19
	ld	a, (hl)
	or	a, a
	jr	NZ, 00104$
	jr	00186$
;src/dng_crawling.c:175: case 0://north
00101$:
;src/dng_crawling.c:176: dirx = 0;
	ldhl	sp,	#3
;src/dng_crawling.c:177: diry =-1;
	xor	a, a
	ld	(hl+), a
	ld	(hl), #0xff
;src/dng_crawling.c:178: break;
	jr	00186$
;src/dng_crawling.c:179: case 1://east
00102$:
;src/dng_crawling.c:180: dirx = 1;
	ldhl	sp,	#3
;src/dng_crawling.c:181: diry = 0;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;src/dng_crawling.c:182: break;
	jr	00186$
;src/dng_crawling.c:183: case 2://south
00103$:
;src/dng_crawling.c:184: dirx = 0;
	ldhl	sp,	#3
;src/dng_crawling.c:185: diry = 1;
	xor	a, a
	ld	(hl+), a
	ld	(hl), #0x01
;src/dng_crawling.c:186: break;
	jr	00186$
;src/dng_crawling.c:187: case 3://west
00104$:
;src/dng_crawling.c:188: dirx =-1;
	ldhl	sp,	#3
;src/dng_crawling.c:189: diry = 0;
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0x00
;src/dng_crawling.c:193: for(i = 2; i>=0; i--){
00186$:
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#19
	ld	(hl), #0x02
00164$:
;src/dng_crawling.c:194: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(i*dirx)+diry, player_y+(i*diry)+dirx);
	ldhl	sp,	#4
	ld	e, (hl)
	ldhl	sp,	#19
	ld	a, (hl)
	call	__mulschar
	ldhl	sp,	#24
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl), a
	add	a,c
	ldhl	sp,	#3
	add	a, (hl)
	ld	c, a
	push	bc
	ld	e, (hl)
	ldhl	sp,	#21
	ld	a, (hl)
	call	__mulschar
	ld	e, c
	pop	bc
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl), a
	add	a,e
	ldhl	sp,	#4
	add	a, (hl)
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#24
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	ldhl	sp,#15
	ld	(hl), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
;src/dng_crawling.c:198: walls[i] = 0x02;//door
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#14
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
	ldhl	sp,	#14
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
;src/dng_crawling.c:195: if(w != 0x00 && w != 0x01){
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	Z, 00130$
	ld	a, (hl)
	dec	a
	jr	Z, 00130$
;src/dng_crawling.c:196: if((w == 0x06 && player_dir == 0)||(w == 0x03 && player_dir == 1)||(w == 0x04 && player_dir == 2)||(w == 0x05 && player_dir == 3)){
	ldhl	sp,	#13
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00111$
	ldhl	sp,	#25
	ld	a, (hl)
	or	a, a
	jr	Z, 00106$
00111$:
	ldhl	sp,	#13
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ, 00113$
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	NZ, 00106$
00113$:
	ldhl	sp,	#13
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00115$
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	NZ, 00106$
00115$:
	ldhl	sp,	#13
	ld	a, (hl)
	sub	a, #0x05
	jr	NZ, 00107$
	ldhl	sp,	#7
	ld	a, (hl)
	or	a, a
	jr	Z, 00107$
00106$:
;src/dng_crawling.c:198: walls[i] = 0x02;//door
	ld	a, #0x02
	ld	(bc), a
	jp	00165$
00107$:
;src/dng_crawling.c:200: walls[i] = 0x01;//wall
	ld	a, #0x01
	ld	(bc), a
	jr	00165$
00130$:
;src/dng_crawling.c:204: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+((i+1)*dirx)+diry, player_y+((i+1)*diry)+dirx);
	ldhl	sp,	#19
	ld	d, (hl)
	inc	d
	push	bc
	push	de
	ldhl	sp,	#8
	ld	e, (hl)
	ld	a, d
	call	__mulschar
	ld	a, c
	pop	de
	pop	bc
	ldhl	sp,	#11
	add	a, (hl)
	ldhl	sp,	#3
	add	a, (hl)
	ldhl	sp,	#15
	ld	(hl), a
	push	bc
	ldhl	sp,	#5
	ld	e, (hl)
	ld	a, d
	call	__mulschar
	ld	a, c
	pop	bc
	ldhl	sp,	#12
	add	a, (hl)
	ldhl	sp,	#4
	add	a, (hl)
	push	bc
	ldhl	sp,	#17
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#26
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	bc
;src/dng_crawling.c:205: if(w != 0x00 && w != 0x01){
	ld	e,a
	or	a,a
	jr	Z, 00165$
	dec	a
	jr	Z, 00165$
;src/dng_crawling.c:206: if( (w == 0x03 && player_dir == 0)|| (w == 0x04 && player_dir == 1)||(w == 0x05 && player_dir == 2)||(w == 0x06 && player_dir == 3)){
	ld	a, e
	sub	a, #0x03
	jr	NZ, 00121$
	ldhl	sp,	#25
	ld	a, (hl)
	or	a, a
	jr	Z, 00116$
00121$:
	ld	a, e
	sub	a, #0x04
	jr	NZ, 00123$
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jr	NZ, 00116$
00123$:
	ld	a, e
	sub	a, #0x05
	jr	NZ, 00125$
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	NZ, 00116$
00125$:
	ld	a, e
	sub	a, #0x06
	jr	NZ, 00117$
	ldhl	sp,	#10
	ld	a, (hl)
	or	a, a
	jr	Z, 00117$
00116$:
;src/dng_crawling.c:207: walls[i]=0x04;//no wall with door
	ld	a, #0x04
	ld	(bc), a
	jr	00165$
00117$:
;src/dng_crawling.c:210: walls[i]=0x03;//no wall
	ld	a, #0x03
	ld	(bc), a
00165$:
;src/dng_crawling.c:193: for(i = 2; i>=0; i--){
	ldhl	sp,	#19
	dec	(hl)
	bit	7, (hl)
	jp	Z, 00164$
;src/dng_crawling.c:216: for(i = 2; i>=0; i--){
	ld	(hl), #0x02
00166$:
;src/dng_crawling.c:217: switch(walls[i]){
	ldhl	sp,	#19
	ld	a, (hl)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	hl, #0
	add	hl, sp
	add	hl, bc
	ld	c, (hl)
;src/dng_crawling.c:220: if(i == 1)set_bkg_tiles(4,3,2,9,wall2_l_bkg);
	ldhl	sp,	#19
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00373$
	xor	a, a
00373$:
	ldhl	sp,	#14
	ld	(hl), a
;src/dng_crawling.c:221: if(i == 2)set_bkg_tiles(6,3,1,9,wall3_l_bkg);
	ldhl	sp,	#19
	ld	a, (hl)
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00375$
	xor	a, a
00375$:
	ldhl	sp,	#15
	ld	(hl), a
;src/dng_crawling.c:217: switch(walls[i]){
	ld	a, c
	dec	a
	jr	Z, 00134$
	ld	a,c
	cp	a,#0x02
	jr	Z, 00141$
	cp	a,#0x03
	jp	Z,00148$
	sub	a, #0x04
	jp	Z,00155$
	jp	00167$
;src/dng_crawling.c:218: case 0x01:
00134$:
;src/dng_crawling.c:219: if(i == 0)set_bkg_tiles(1,3,3,9,wall1_l_bkg);
	ldhl	sp,	#19
	ld	a, (hl)
	or	a, a
	jr	NZ, 00136$
	ld	de, #_wall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00136$:
;src/dng_crawling.c:220: if(i == 1)set_bkg_tiles(4,3,2,9,wall2_l_bkg);
	ldhl	sp,	#14
	ld	a, (hl)
	or	a, a
	jr	Z, 00138$
	ld	de, #_wall2_l_bkg
	push	de
	ld	hl, #0x902
	push	hl
	ld	hl, #0x304
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00138$:
;src/dng_crawling.c:221: if(i == 2)set_bkg_tiles(6,3,1,9,wall3_l_bkg);
	ldhl	sp,	#15
	ld	a, (hl)
	or	a, a
	jp	Z, 00167$
	ld	de, #_wall3_l_bkg
	push	de
	ld	hl, #0x901
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/dng_crawling.c:222: break;
	jp	00167$
;src/dng_crawling.c:224: case 0x02:
00141$:
;src/dng_crawling.c:225: if(i == 0)set_bkg_tiles(1,3,3,9,door1_l_bkg);
	ldhl	sp,	#19
	ld	a, (hl)
	or	a, a
	jr	NZ, 00143$
	ld	de, #_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00143$:
;src/dng_crawling.c:226: if(i == 1)set_bkg_tiles(4,3,2,9,door2_l_bkg);
	ldhl	sp,	#14
	ld	a, (hl)
	or	a, a
	jr	Z, 00145$
	ld	de, #_door2_l_bkg
	push	de
	ld	hl, #0x902
	push	hl
	ld	hl, #0x304
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00145$:
;src/dng_crawling.c:227: if(i == 2)set_bkg_tiles(6,3,1,9,door3_l_bkg);
	ldhl	sp,	#15
	ld	a, (hl)
	or	a, a
	jp	Z, 00167$
	ld	de, #_door3_l_bkg
	push	de
	ld	hl, #0x901
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/dng_crawling.c:228: break;
	jp	00167$
;src/dng_crawling.c:230: case 0x03:
00148$:
;src/dng_crawling.c:231: if(i == 0) set_bkg_tiles(1,3,3,9,nowall1_l_bkg);
	ldhl	sp,	#19
	ld	a, (hl)
	or	a, a
	jr	NZ, 00150$
	ld	de, #_nowall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00150$:
;src/dng_crawling.c:232: if(i == 1) set_bkg_tiles(1,3,5,9,nowall2_l_bkg);
	ldhl	sp,	#14
	ld	a, (hl)
	or	a, a
	jr	Z, 00152$
	ld	de, #_nowall2_l_bkg
	push	de
	ld	hl, #0x905
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00152$:
;src/dng_crawling.c:233: if(i == 2) set_bkg_tiles(1,3,6,9,nowall3_l_bkg);
	ldhl	sp,	#15
	ld	a, (hl)
	or	a, a
	jr	Z, 00167$
	ld	de, #_nowall3_l_bkg
	push	de
	ld	hl, #0x906
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/dng_crawling.c:234: break;
	jr	00167$
;src/dng_crawling.c:236: case 0x04:
00155$:
;src/dng_crawling.c:237: if(i == 0) set_bkg_tiles(1,3,3,9,nowall_door1_l_bkg);
	ldhl	sp,	#19
	ld	a, (hl)
	or	a, a
	jr	NZ, 00157$
	ld	de, #_nowall_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00157$:
;src/dng_crawling.c:238: if(i == 1) set_bkg_tiles(1,3,5,9,nowall_door2_l_bkg);
	ldhl	sp,	#14
	ld	a, (hl)
	or	a, a
	jr	Z, 00159$
	ld	de, #_nowall_door2_l_bkg
	push	de
	ld	hl, #0x905
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00159$:
;src/dng_crawling.c:239: if(i == 2) set_bkg_tiles(1,3,6,9,nowall_door3_l_bkg);
	ldhl	sp,	#15
	ld	a, (hl)
	or	a, a
	jr	Z, 00167$
	ld	de, #_nowall_door3_l_bkg
	push	de
	ld	hl, #0x906
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/dng_crawling.c:242: }
00167$:
;src/dng_crawling.c:216: for(i = 2; i>=0; i--){
	ldhl	sp,	#19
	dec	(hl)
	ld	a, (hl)
	bit	7, a
	jp	Z, 00166$
;src/dng_crawling.c:245: }
	add	sp, #20
	pop	hl
	add	sp, #4
	jp	(hl)
;src/dng_crawling.c:248: void check_l_walls_n(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_l_walls_n
; ---------------------------------
_check_l_walls_n::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:249: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-2);
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
;src/dng_crawling.c:250: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:251: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00102$
;src/dng_crawling.c:252: set_bkg_tiles(6,3,1,9,door3_l_bkg);
	push	de
	ld	hl, #_door3_l_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00102$:
;src/dng_crawling.c:254: set_bkg_tiles(6,3,1,9,wall3_l_bkg);
	push	de
	ld	hl, #_wall3_l_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00111$:
;src/dng_crawling.c:257: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-3);
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
;src/dng_crawling.c:258: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:259: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00105$
;src/dng_crawling.c:260: set_bkg_tiles(1,3,6,9,nowall_door3_l_bkg);
	push	de
	ld	hl, #_nowall_door3_l_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00105$:
;src/dng_crawling.c:262: set_bkg_tiles(1,3,6,9,nowall3_l_bkg);
	push	de
	ld	hl, #_nowall3_l_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00112$:
;src/dng_crawling.c:266: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
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
;src/dng_crawling.c:267: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:268: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00115$
;src/dng_crawling.c:269: set_bkg_tiles(4,3,2,9,door2_l_bkg);
	push	de
	ld	hl, #_door2_l_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x304
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00115$:
;src/dng_crawling.c:271: set_bkg_tiles(4,3,2,9,wall2_l_bkg);
	push	de
	ld	hl, #_wall2_l_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x304
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00124$:
;src/dng_crawling.c:274: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-2);
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
;src/dng_crawling.c:275: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:276: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00118$
;src/dng_crawling.c:277: set_bkg_tiles(1,3,5,9,nowall_door2_l_bkg);
	push	de
	ld	hl, #_nowall_door2_l_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00118$:
;src/dng_crawling.c:279: set_bkg_tiles(1,3,5,9,nowall2_l_bkg);
	push	de
	ld	hl, #_nowall2_l_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00125$:
;src/dng_crawling.c:284: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y);
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
;src/dng_crawling.c:285: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:286: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00128$
;src/dng_crawling.c:287: set_bkg_tiles(1,3,3,9,door1_l_bkg);
	ld	de, #_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00128$:
;src/dng_crawling.c:289: set_bkg_tiles(1,3,3,9,wall1_l_bkg);
	ld	de, #_wall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00137$:
;src/dng_crawling.c:292: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
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
;src/dng_crawling.c:293: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:294: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00131$
;src/dng_crawling.c:295: set_bkg_tiles(1,3,3,9,nowall_door1_l_bkg);
	ld	de, #_nowall_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00131$:
;src/dng_crawling.c:297: set_bkg_tiles(1,3,3,9,nowall1_l_bkg);
	ld	de, #_nowall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
00140$:
;src/dng_crawling.c:301: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:303: void check_l_walls_e(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_l_walls_e
; ---------------------------------
_check_l_walls_e::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:304: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y-1);
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
;src/dng_crawling.c:305: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:306: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00102$
;src/dng_crawling.c:307: set_bkg_tiles(6,3,1,9,door3_l_bkg);
	push	de
	ld	hl, #_door3_l_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00102$:
;src/dng_crawling.c:309: set_bkg_tiles(6,3,1,9,wall3_l_bkg);
	push	de
	ld	hl, #_wall3_l_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00111$:
;src/dng_crawling.c:312: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+3, player_y-1);
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
;src/dng_crawling.c:313: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:314: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00105$
;src/dng_crawling.c:315: set_bkg_tiles(1,3,6,9,nowall_door3_l_bkg);
	push	de
	ld	hl, #_nowall_door3_l_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00105$:
;src/dng_crawling.c:317: set_bkg_tiles(1,3,6,9,nowall3_l_bkg);
	push	de
	ld	hl, #_nowall3_l_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00112$:
;src/dng_crawling.c:321: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
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
;src/dng_crawling.c:322: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:323: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00115$
;src/dng_crawling.c:324: set_bkg_tiles(4,3,2,9,door2_l_bkg);
	push	de
	ld	hl, #_door2_l_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x304
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00115$:
;src/dng_crawling.c:326: set_bkg_tiles(4,3,2,9,wall2_l_bkg);
	push	de
	ld	hl, #_wall2_l_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x304
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00124$:
;src/dng_crawling.c:329: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y-1);
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
;src/dng_crawling.c:330: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:331: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00118$
;src/dng_crawling.c:332: set_bkg_tiles(1,3,5,9,nowall_door2_l_bkg);
	push	de
	ld	hl, #_nowall_door2_l_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00118$:
;src/dng_crawling.c:334: set_bkg_tiles(1,3,5,9,nowall2_l_bkg);
	push	de
	ld	hl, #_nowall2_l_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00125$:
;src/dng_crawling.c:339: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y-1);
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
;src/dng_crawling.c:340: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:341: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00128$
;src/dng_crawling.c:342: set_bkg_tiles(1,3,3,9,door1_l_bkg);
	ld	de, #_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00128$:
;src/dng_crawling.c:344: set_bkg_tiles(1,3,3,9,wall1_l_bkg);
	ld	de, #_wall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00137$:
;src/dng_crawling.c:347: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
	push	bc
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	call	_return_value
;src/dng_crawling.c:348: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:349: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00131$
;src/dng_crawling.c:350: set_bkg_tiles(1,3,3,9,nowall_door1_l_bkg);
	ld	de, #_nowall_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00131$:
;src/dng_crawling.c:352: set_bkg_tiles(1,3,3,9,nowall1_l_bkg);
	ld	de, #_nowall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
00140$:
;src/dng_crawling.c:356: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:358: void check_l_walls_s(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_l_walls_s
; ---------------------------------
_check_l_walls_s::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:359: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+2);
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
;src/dng_crawling.c:360: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:361: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00102$
;src/dng_crawling.c:362: set_bkg_tiles(6,3,1,9,door3_l_bkg);
	push	de
	ld	hl, #_door3_l_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00102$:
;src/dng_crawling.c:364: set_bkg_tiles(6,3,1,9,wall3_l_bkg);
	push	de
	ld	hl, #_wall3_l_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00111$:
;src/dng_crawling.c:367: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+3);
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
;src/dng_crawling.c:368: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:369: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00105$
;src/dng_crawling.c:370: set_bkg_tiles(1,3,6,9,nowall_door3_l_bkg);
	push	de
	ld	hl, #_nowall_door3_l_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00105$:
;src/dng_crawling.c:372: set_bkg_tiles(1,3,6,9,nowall3_l_bkg);
	push	de
	ld	hl, #_nowall3_l_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00112$:
;src/dng_crawling.c:376: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
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
;src/dng_crawling.c:377: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:378: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00115$
;src/dng_crawling.c:379: set_bkg_tiles(4,3,2,9,door2_l_bkg);
	push	de
	ld	hl, #_door2_l_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x304
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00115$:
;src/dng_crawling.c:381: set_bkg_tiles(4,3,2,9,wall2_l_bkg);
	push	de
	ld	hl, #_wall2_l_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x304
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00124$:
;src/dng_crawling.c:384: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+2);
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
;src/dng_crawling.c:385: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:386: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00118$
;src/dng_crawling.c:387: set_bkg_tiles(1,3,5,9,nowall_door2_l_bkg);
	push	de
	ld	hl, #_nowall_door2_l_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00118$:
;src/dng_crawling.c:389: set_bkg_tiles(1,3,5,9,nowall2_l_bkg);
	push	de
	ld	hl, #_nowall2_l_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00125$:
;src/dng_crawling.c:394: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y);
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
;src/dng_crawling.c:395: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:396: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00128$
;src/dng_crawling.c:397: set_bkg_tiles(1,3,3,9,door1_l_bkg);
	ld	de, #_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00128$:
;src/dng_crawling.c:399: set_bkg_tiles(1,3,3,9,wall1_l_bkg);
	ld	de, #_wall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00137$:
;src/dng_crawling.c:402: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
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
;src/dng_crawling.c:403: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:404: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00131$
;src/dng_crawling.c:405: set_bkg_tiles(1,3,3,9,nowall_door1_l_bkg);
	ld	de, #_nowall_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00131$:
;src/dng_crawling.c:407: set_bkg_tiles(1,3,3,9,nowall1_l_bkg);
	ld	de, #_nowall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
00140$:
;src/dng_crawling.c:411: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:413: void check_l_walls_w(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_l_walls_w
; ---------------------------------
_check_l_walls_w::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:414: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y+1);
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
;src/dng_crawling.c:415: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:416: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00102$
;src/dng_crawling.c:417: set_bkg_tiles(6,3,1,9,door3_l_bkg);
	push	de
	ld	hl, #_door3_l_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00102$:
;src/dng_crawling.c:419: set_bkg_tiles(6,3,1,9,wall3_l_bkg);
	push	de
	ld	hl, #_wall3_l_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x306
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00111$:
;src/dng_crawling.c:422: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-3, player_y+1);
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
;src/dng_crawling.c:423: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:424: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00105$
;src/dng_crawling.c:425: set_bkg_tiles(1,3,6,9,nowall_door3_l_bkg);
	push	de
	ld	hl, #_nowall_door3_l_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00105$:
;src/dng_crawling.c:427: set_bkg_tiles(1,3,6,9,nowall3_l_bkg);
	push	de
	ld	hl, #_nowall3_l_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00112$:
;src/dng_crawling.c:431: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
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
;src/dng_crawling.c:432: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:433: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00115$
;src/dng_crawling.c:434: set_bkg_tiles(4,3,2,9,door2_l_bkg);
	push	de
	ld	hl, #_door2_l_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x304
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00115$:
;src/dng_crawling.c:436: set_bkg_tiles(4,3,2,9,wall2_l_bkg);
	push	de
	ld	hl, #_wall2_l_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x304
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00124$:
;src/dng_crawling.c:439: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y+1);
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
;src/dng_crawling.c:440: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:441: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00118$
;src/dng_crawling.c:442: set_bkg_tiles(1,3,5,9,nowall_door2_l_bkg);
	push	de
	ld	hl, #_nowall_door2_l_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00118$:
;src/dng_crawling.c:444: set_bkg_tiles(1,3,5,9,nowall2_l_bkg);
	push	de
	ld	hl, #_nowall2_l_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x301
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00125$:
;src/dng_crawling.c:449: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y+1);
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
;src/dng_crawling.c:450: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:451: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00128$
;src/dng_crawling.c:452: set_bkg_tiles(1,3,3,9,door1_l_bkg);
	ld	de, #_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00128$:
;src/dng_crawling.c:454: set_bkg_tiles(1,3,3,9,wall1_l_bkg);
	ld	de, #_wall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00137$:
;src/dng_crawling.c:457: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
	push	bc
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	call	_return_value
;src/dng_crawling.c:458: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:459: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00131$
;src/dng_crawling.c:460: set_bkg_tiles(1,3,3,9,nowall_door1_l_bkg);
	ld	de, #_nowall_door1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00131$:
;src/dng_crawling.c:462: set_bkg_tiles(1,3,3,9,nowall1_l_bkg);
	ld	de, #_nowall1_l_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
00140$:
;src/dng_crawling.c:466: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:468: void check_r_walls_n(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_r_walls_n
; ---------------------------------
_check_r_walls_n::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:469: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-2);
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
;src/dng_crawling.c:470: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:471: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00102$
;src/dng_crawling.c:472: set_bkg_tiles(13,3,1,9,door3_r_bkg);
	push	de
	ld	hl, #_door3_r_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00102$:
;src/dng_crawling.c:474: set_bkg_tiles(13,3,1,9,wall3_r_bkg);
	push	de
	ld	hl, #_wall3_r_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00111$:
;src/dng_crawling.c:477: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-3);
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
;src/dng_crawling.c:478: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:479: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00105$
;src/dng_crawling.c:480: set_bkg_tiles(13,3,6,9,nowall_door3_r_bkg);
	push	de
	ld	hl, #_nowall_door3_r_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00105$:
;src/dng_crawling.c:482: set_bkg_tiles(13,3,6,9,nowall3_r_bkg);
	push	de
	ld	hl, #_nowall3_r_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00112$:
;src/dng_crawling.c:486: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
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
;src/dng_crawling.c:487: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:488: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00115$
;src/dng_crawling.c:489: set_bkg_tiles(14,3,2,9,door2_r_bkg);
	push	de
	ld	hl, #_door2_r_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00115$:
;src/dng_crawling.c:491: set_bkg_tiles(14,3,2,9,wall2_r_bkg);
	push	de
	ld	hl, #_wall2_r_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00124$:
;src/dng_crawling.c:494: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-2);
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
;src/dng_crawling.c:495: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:496: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00118$
;src/dng_crawling.c:497: set_bkg_tiles(14,3,5,9,nowall_door2_r_bkg);
	push	de
	ld	hl, #_nowall_door2_r_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00118$:
;src/dng_crawling.c:499: set_bkg_tiles(14,3,5,9,nowall2_r_bkg);
	push	de
	ld	hl, #_nowall2_r_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00125$:
;src/dng_crawling.c:504: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y);
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
;src/dng_crawling.c:505: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:506: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00128$
;src/dng_crawling.c:507: set_bkg_tiles(16,3,3,9,door1_r_bkg);
	ld	de, #_door1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00128$:
;src/dng_crawling.c:509: set_bkg_tiles(16,3,3,9,wall1_r_bkg);
	ld	de, #_wall1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00137$:
;src/dng_crawling.c:512: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
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
;src/dng_crawling.c:513: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:514: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00131$
;src/dng_crawling.c:515: set_bkg_tiles(16,3,3,9,nowall_door1_r_bkg);
	ld	de, #_nowall_door1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00131$:
;src/dng_crawling.c:517: set_bkg_tiles(16,3,3,9,nowall1_r_bkg);
	ld	de, #_nowall1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
00140$:
;src/dng_crawling.c:521: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:523: void check_r_walls_e(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_r_walls_e
; ---------------------------------
_check_r_walls_e::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:524: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y+1);
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
;src/dng_crawling.c:525: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:526: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00102$
;src/dng_crawling.c:527: set_bkg_tiles(13,3,1,9,door3_r_bkg);
	push	de
	ld	hl, #_door3_r_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00102$:
;src/dng_crawling.c:529: set_bkg_tiles(13,3,1,9,wall3_r_bkg);
	push	de
	ld	hl, #_wall3_r_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00111$:
;src/dng_crawling.c:532: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+3, player_y+1);
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
;src/dng_crawling.c:533: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:534: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00105$
;src/dng_crawling.c:535: set_bkg_tiles(13,3,6,9,nowall_door3_r_bkg);
	push	de
	ld	hl, #_nowall_door3_r_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00105$:
;src/dng_crawling.c:537: set_bkg_tiles(13,3,6,9,nowall3_r_bkg);
	push	de
	ld	hl, #_nowall3_r_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00112$:
;src/dng_crawling.c:541: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
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
;src/dng_crawling.c:542: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:543: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00115$
;src/dng_crawling.c:544: set_bkg_tiles(14,3,2,9,door2_r_bkg);
	push	de
	ld	hl, #_door2_r_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00115$:
;src/dng_crawling.c:546: set_bkg_tiles(14,3,2,9,wall2_r_bkg);
	push	de
	ld	hl, #_wall2_r_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00124$:
;src/dng_crawling.c:549: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y+1);
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
;src/dng_crawling.c:550: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:551: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00118$
;src/dng_crawling.c:552: set_bkg_tiles(14,3,5,9,nowall_door2_r_bkg);
	push	de
	ld	hl, #_nowall_door2_r_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00118$:
;src/dng_crawling.c:554: set_bkg_tiles(14,3,5,9,nowall2_r_bkg);
	push	de
	ld	hl, #_nowall2_r_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00125$:
;src/dng_crawling.c:559: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y+1);
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
;src/dng_crawling.c:560: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:561: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00128$
;src/dng_crawling.c:562: set_bkg_tiles(16,3,3,9,door1_r_bkg);
	ld	de, #_door1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00128$:
;src/dng_crawling.c:564: set_bkg_tiles(16,3,3,9,wall1_r_bkg);
	ld	de, #_wall1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00137$:
;src/dng_crawling.c:567: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
	push	bc
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	call	_return_value
;src/dng_crawling.c:568: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:569: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00131$
;src/dng_crawling.c:570: set_bkg_tiles(16,3,3,9,nowall_door1_r_bkg);
	ld	de, #_nowall_door1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00131$:
;src/dng_crawling.c:572: set_bkg_tiles(16,3,3,9,nowall1_r_bkg);
	ld	de, #_nowall1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
00140$:
;src/dng_crawling.c:576: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:578: void check_r_walls_s(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_r_walls_s
; ---------------------------------
_check_r_walls_s::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:579: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+2);
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
;src/dng_crawling.c:580: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:581: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00102$
;src/dng_crawling.c:582: set_bkg_tiles(13,3,1,9,door3_r_bkg);
	push	de
	ld	hl, #_door3_r_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00102$:
;src/dng_crawling.c:584: set_bkg_tiles(13,3,1,9,wall3_r_bkg);
	push	de
	ld	hl, #_wall3_r_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00111$:
;src/dng_crawling.c:587: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+3);
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
;src/dng_crawling.c:588: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:589: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00105$
;src/dng_crawling.c:590: set_bkg_tiles(13,3,6,9,nowall_door3_r_bkg);
	push	de
	ld	hl, #_nowall_door3_r_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00105$:
;src/dng_crawling.c:592: set_bkg_tiles(13,3,6,9,nowall3_r_bkg);
	push	de
	ld	hl, #_nowall3_r_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00112$:
;src/dng_crawling.c:596: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
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
;src/dng_crawling.c:597: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:598: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00115$
;src/dng_crawling.c:599: set_bkg_tiles(14,3,2,9,door2_r_bkg);
	push	de
	ld	hl, #_door2_r_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00115$:
;src/dng_crawling.c:601: set_bkg_tiles(14,3,2,9,wall2_r_bkg);
	push	de
	ld	hl, #_wall2_r_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00124$:
;src/dng_crawling.c:604: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+2);
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
;src/dng_crawling.c:605: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:606: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00118$
;src/dng_crawling.c:607: set_bkg_tiles(14,3,5,9,nowall_door2_r_bkg);
	push	de
	ld	hl, #_nowall_door2_r_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00118$:
;src/dng_crawling.c:609: set_bkg_tiles(14,3,5,9,nowall2_r_bkg);
	push	de
	ld	hl, #_nowall2_r_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00125$:
;src/dng_crawling.c:614: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y);
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
;src/dng_crawling.c:615: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:616: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00128$
;src/dng_crawling.c:617: set_bkg_tiles(16,3,3,9,door1_r_bkg);
	ld	de, #_door1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00128$:
;src/dng_crawling.c:619: set_bkg_tiles(16,3,3,9,wall1_r_bkg);
	ld	de, #_wall1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00137$:
;src/dng_crawling.c:622: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
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
;src/dng_crawling.c:623: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:624: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00131$
;src/dng_crawling.c:625: set_bkg_tiles(16,3,3,9,nowall_door1_r_bkg);
	ld	de, #_nowall_door1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00131$:
;src/dng_crawling.c:627: set_bkg_tiles(16,3,3,9,nowall1_r_bkg);
	ld	de, #_nowall1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
00140$:
;src/dng_crawling.c:631: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
;src/dng_crawling.c:633: void check_r_walls_w(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
;	---------------------------------
; Function check_r_walls_w
; ---------------------------------
_check_r_walls_w::
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/dng_crawling.c:634: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y-1);
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
;src/dng_crawling.c:635: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/dng_crawling.c:636: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00102$
;src/dng_crawling.c:637: set_bkg_tiles(13,3,1,9,door3_r_bkg);
	push	de
	ld	hl, #_door3_r_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00102$:
;src/dng_crawling.c:639: set_bkg_tiles(13,3,1,9,wall3_r_bkg);
	push	de
	ld	hl, #_wall3_r_bkg
	push	hl
	ld	hl, #0x901
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00111$:
;src/dng_crawling.c:642: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-3, player_y-1);
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
;src/dng_crawling.c:643: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/dng_crawling.c:644: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00105$
;src/dng_crawling.c:645: set_bkg_tiles(13,3,6,9,nowall_door3_r_bkg);
	push	de
	ld	hl, #_nowall_door3_r_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00112$
00105$:
;src/dng_crawling.c:647: set_bkg_tiles(13,3,6,9,nowall3_r_bkg);
	push	de
	ld	hl, #_nowall3_r_bkg
	push	hl
	ld	hl, #0x906
	push	hl
	ld	hl, #0x30d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00112$:
;src/dng_crawling.c:651: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
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
;src/dng_crawling.c:652: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/dng_crawling.c:653: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00115$
;src/dng_crawling.c:654: set_bkg_tiles(14,3,2,9,door2_r_bkg);
	push	de
	ld	hl, #_door2_r_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00115$:
;src/dng_crawling.c:656: set_bkg_tiles(14,3,2,9,wall2_r_bkg);
	push	de
	ld	hl, #_wall2_r_bkg
	push	hl
	ld	hl, #0x902
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00124$:
;src/dng_crawling.c:659: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y-1);
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
;src/dng_crawling.c:660: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/dng_crawling.c:661: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00118$
;src/dng_crawling.c:662: set_bkg_tiles(14,3,5,9,nowall_door2_r_bkg);
	push	de
	ld	hl, #_nowall_door2_r_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
	jr	00125$
00118$:
;src/dng_crawling.c:664: set_bkg_tiles(14,3,5,9,nowall2_r_bkg);
	push	de
	ld	hl, #_nowall2_r_bkg
	push	hl
	ld	hl, #0x905
	push	hl
	ld	hl, #0x30e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
00125$:
;src/dng_crawling.c:669: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y-1);
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
;src/dng_crawling.c:670: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/dng_crawling.c:671: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00128$
;src/dng_crawling.c:672: set_bkg_tiles(16,3,3,9,door1_r_bkg);
	ld	de, #_door1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00128$:
;src/dng_crawling.c:674: set_bkg_tiles(16,3,3,9,wall1_r_bkg);
	ld	de, #_wall1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00137$:
;src/dng_crawling.c:677: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
	push	bc
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	call	_return_value
;src/dng_crawling.c:678: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/dng_crawling.c:679: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00131$
;src/dng_crawling.c:680: set_bkg_tiles(16,3,3,9,nowall_door1_r_bkg);
	ld	de, #_nowall_door1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jr	00140$
00131$:
;src/dng_crawling.c:682: set_bkg_tiles(16,3,3,9,nowall1_r_bkg);
	ld	de, #_nowall1_r_bkg
	push	de
	ld	hl, #0x903
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
00140$:
;src/dng_crawling.c:686: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
