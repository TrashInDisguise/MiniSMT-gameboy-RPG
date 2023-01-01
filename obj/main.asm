;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _update_dng
	.globl _init_gfx
	.globl _check_r_walls_e
	.globl _check_r_walls_w
	.globl _check_r_walls_s
	.globl _check_r_walls_n
	.globl _check_l_walls_e
	.globl _check_l_walls_w
	.globl _check_l_walls_s
	.globl _check_l_walls_n
	.globl _check_m_walls
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _test_dungeon
	.globl _white_screen
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
_player_x:
	.ds 1
_player_y:
	.ds 1
_global_state:
	.ds 1
_player_dir:
	.ds 1
_joypadCurrent:
	.ds 1
_joypadPrevious:
	.ds 1
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
;src/main.c:60: void init_gfx() {
;	---------------------------------
; Function init_gfx
; ---------------------------------
_init_gfx::
;src/main.c:63: set_bkg_data(0,74,dng_tileset);
	ld	de, #_dng_tileset
	push	de
	ld	hl, #0x4a00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:65: for(uint8_t i = 0; i < 15; i++){
	ld	c, #0x00
00109$:
	ld	a, c
	sub	a, #0x0f
	jr	NC, 00104$
;src/main.c:66: for(uint8_t j = 0; j < 15; j++){
	ld	b, #0x00
00106$:
	ld	a, b
	sub	a, #0x0f
	jr	NC, 00110$
;src/main.c:67: if(test_dungeon[i*15+j]==0x01){
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ld	e, b
	ld	d, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_test_dungeon
	add	hl, de
	ld	a, (hl)
	dec	a
	jr	NZ, 00107$
;src/main.c:68: player_x = j;
	ld	hl, #_player_x
	ld	(hl), b
;src/main.c:69: player_y = i;
	ld	hl, #_player_y
	ld	(hl), c
00107$:
;src/main.c:66: for(uint8_t j = 0; j < 15; j++){
	inc	b
	jr	00106$
00110$:
;src/main.c:65: for(uint8_t i = 0; i < 15; i++){
	inc	c
	jr	00109$
00104$:
;src/main.c:73: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:75: }
	ret
_white_screen:
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
_test_dungeon:
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x06	; 6
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
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x05	; 5
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
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
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
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
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
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
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
	.db #0x02	; 2
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
;src/main.c:77: void update_dng(unsigned char *dng,uint8_t dungeon_width, uint8_t dungeon_hieght){
;	---------------------------------
; Function update_dng
; ---------------------------------
_update_dng::
	ld	c, a
;src/main.c:80: set_bkg_tiles(0,0,20,10,white_screen);
	push	de
	ld	hl, #_white_screen
	push	hl
	ld	hl, #0xa14
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
;src/main.c:82: switch (player_dir){
	ld	a, (#_player_dir)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_player_dir)
	dec	a
	jp	Z,00104$
	ld	a, (#_player_dir)
	sub	a, #0x02
	jr	Z, 00102$
	ld	a, (#_player_dir)
	sub	a, #0x03
	jp	Z,00103$
	jp	00106$
;src/main.c:83: case north:
00101$:
;src/main.c:84: check_l_walls_n(dng,dungeon_width,dungeon_hieght,player_x,player_y);
	push	bc
	push	de
	ld	a, (#_player_y)
	ld	h, a
	ld	a, (#_player_x)
	ld	l, a
	push	hl
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_l_walls_n
	pop	de
	pop	bc
;src/main.c:85: check_r_walls_n(dng,dungeon_width,dungeon_hieght,player_x,player_y);
	push	bc
	push	de
	ld	a, (#_player_y)
	ld	h, a
	ld	a, (#_player_x)
	ld	l, a
	push	hl
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_r_walls_n
	pop	de
	pop	bc
;src/main.c:86: check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y, 0, -1);
	ld	hl, #0xff00
	push	hl
	ld	a, (#_player_y)
	ld	h, a
	ld	a, (#_player_x)
	ld	l, a
	push	hl
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_m_walls
;src/main.c:88: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:89: break;
	jp	00106$
;src/main.c:90: case south:
00102$:
;src/main.c:91: check_l_walls_s(dng,dungeon_width,dungeon_hieght,player_x,player_y);
	push	bc
	push	de
	ld	a, (#_player_y)
	ld	h, a
	ld	a, (#_player_x)
	ld	l, a
	push	hl
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_l_walls_s
	pop	de
	pop	bc
;src/main.c:92: check_r_walls_s(dng,dungeon_width,dungeon_hieght,player_x,player_y);
	push	bc
	push	de
	ld	a, (#_player_y)
	ld	h, a
	ld	a, (#_player_x)
	ld	l, a
	push	hl
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_r_walls_s
	pop	de
	pop	bc
;src/main.c:93: check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y,0,+1);
	xor	a, a
	inc	a
	push	af
	ld	a, (#_player_y)
	ld	h, a
	ld	a, (#_player_x)
	ld	l, a
	push	hl
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_m_walls
;src/main.c:94: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:95: break;
	jp	00106$
;src/main.c:96: case west:
00103$:
;src/main.c:97: check_l_walls_w(dng,dungeon_width,dungeon_hieght,player_x,player_y);
	push	bc
	push	de
	ld	a, (#_player_y)
	ld	h, a
	ld	a, (#_player_x)
	ld	l, a
	push	hl
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_l_walls_w
	pop	de
	pop	bc
;src/main.c:98: check_r_walls_w(dng,dungeon_width,dungeon_hieght,player_x,player_y);
	push	bc
	push	de
	ld	a, (#_player_y)
	ld	h, a
	ld	a, (#_player_x)
	ld	l, a
	push	hl
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_r_walls_w
	pop	de
	pop	bc
;src/main.c:99: check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y,-1,0);
	ld	hl, #0xff
	push	hl
	ld	a, (#_player_y)
	ld	h, a
	ld	a, (#_player_x)
	ld	l, a
	push	hl
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_m_walls
;src/main.c:101: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:102: break;
	jr	00106$
;src/main.c:103: case east:
00104$:
;src/main.c:104: check_l_walls_e(dng,dungeon_width,dungeon_hieght,player_x,player_y);
	push	bc
	push	de
	ld	a, (#_player_y)
	ld	h, a
	ld	a, (#_player_x)
	ld	l, a
	push	hl
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_l_walls_e
	pop	de
	pop	bc
;src/main.c:105: check_r_walls_e(dng,dungeon_width,dungeon_hieght,player_x,player_y);
	push	bc
	push	de
	ld	a, (#_player_y)
	ld	h, a
	ld	a, (#_player_x)
	ld	l, a
	push	hl
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_r_walls_e
	pop	de
	pop	bc
;src/main.c:106: check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y,+1,0);
	ld	hl, #0x01
	push	hl
	ld	a, (#_player_y)
	ld	h, a
	ld	a, (#_player_x)
	ld	l, a
	push	hl
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_m_walls
;src/main.c:108: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:110: }
00106$:
;src/main.c:112: }
	pop	hl
	inc	sp
	jp	(hl)
;src/main.c:115: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:118: init_gfx();
	call	_init_gfx
;src/main.c:119: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:120: set_sprite_data(0,4,news);
	ld	de, #_news
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;src/main.c:121: set_sprite_tile(0,player_dir);
	ld	hl, #_player_dir
	ld	c, (hl)
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;../gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;../gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	(hl), #0x10
	inc	hl
	ld	(hl), #0x0a
;src/main.c:123: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:125: while(1) {
00128$:
;src/main.c:127: joypadPrevious = joypadCurrent;
	ld	a, (#_joypadCurrent)
	ld	(#_joypadPrevious),a
;src/main.c:128: joypadCurrent = joypad();
	call	_joypad
	ld	hl, #_joypadCurrent
	ld	(hl), a
;src/main.c:130: if((joypadCurrent & J_LEFT) && !(joypadPrevious & J_LEFT)){
	bit	1, (hl)
	jr	Z, 00104$
	ld	a, (#_joypadPrevious)
	bit	1, a
	jr	NZ, 00104$
;src/main.c:131: player_dir--;
	ld	hl, #_player_dir
	dec	(hl)
;src/main.c:132: if (player_dir==255){
	ld	a, (hl)
	inc	a
	jr	NZ, 00102$
;src/main.c:133: player_dir = west;
	ld	hl, #_player_dir
	ld	(hl), #0x03
00102$:
;src/main.c:135: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:136: set_sprite_tile(0,player_dir);
	ld	hl, #_player_dir
	ld	c, (hl)
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;src/main.c:136: set_sprite_tile(0,player_dir);
00104$:
;src/main.c:138: if((joypadCurrent & J_RIGHT) && !(joypadPrevious & J_RIGHT)){
	ld	a, (#_joypadCurrent)
	rrca
	jr	NC, 00109$
	ld	a, (#_joypadPrevious)
	rrca
	jr	C, 00109$
;src/main.c:139: player_dir++;
	ld	hl, #_player_dir
	inc	(hl)
;src/main.c:140: if(player_dir==4){
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00107$
;src/main.c:141: player_dir=north;
	ld	hl, #_player_dir
	ld	(hl), #0x00
00107$:
;src/main.c:143: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:144: set_sprite_tile(0,player_dir);
	ld	hl, #_player_dir
	ld	c, (hl)
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;src/main.c:144: set_sprite_tile(0,player_dir);
00109$:
;src/main.c:146: if((joypadCurrent & J_UP) && !(joypadPrevious & J_UP)){
	ld	a, (#_joypadCurrent)
	bit	2, a
	jr	Z, 00117$
	ld	a, (#_joypadPrevious)
	bit	2, a
	jr	NZ, 00117$
;src/main.c:147: switch(player_dir){
	ld	a, (#_player_dir)
	or	a, a
	jr	Z, 00111$
	ld	a, (#_player_dir)
	dec	a
	jr	Z, 00112$
	ld	a, (#_player_dir)
	sub	a, #0x02
	jr	Z, 00113$
	ld	a, (#_player_dir)
	sub	a, #0x03
	jr	Z, 00114$
	jr	00115$
;src/main.c:148: case north:
00111$:
;src/main.c:149: player_y--;
	ld	hl, #_player_y
	dec	(hl)
;src/main.c:150: break;
	jr	00115$
;src/main.c:151: case east:
00112$:
;src/main.c:152: player_x++;
	ld	hl, #_player_x
	inc	(hl)
;src/main.c:153: break;
	jr	00115$
;src/main.c:154: case south:
00113$:
;src/main.c:155: player_y++;
	ld	hl, #_player_y
	inc	(hl)
;src/main.c:156: break;
	jr	00115$
;src/main.c:157: case west:
00114$:
;src/main.c:158: player_x--;
	ld	hl, #_player_x
	dec	(hl)
;src/main.c:160: }
00115$:
;src/main.c:161: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:162: set_sprite_tile(0,player_dir);
	ld	hl, #_player_dir
	ld	c, (hl)
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;src/main.c:162: set_sprite_tile(0,player_dir);
00117$:
;src/main.c:164: if((joypadCurrent & J_DOWN) && !(joypadPrevious & J_DOWN)){
	ld	a, (#_joypadCurrent)
	bit	3, a
	jr	Z, 00125$
	ld	a, (#_joypadPrevious)
	bit	3, a
	jr	NZ, 00125$
;src/main.c:165: switch(player_dir){
	ld	a, (#_player_dir)
	or	a, a
	jr	Z, 00119$
	ld	a, (#_player_dir)
	dec	a
	jr	Z, 00120$
	ld	a, (#_player_dir)
	sub	a, #0x02
	jr	Z, 00121$
	ld	a, (#_player_dir)
	sub	a, #0x03
	jr	Z, 00122$
	jr	00123$
;src/main.c:166: case north:
00119$:
;src/main.c:167: player_y++;
	ld	hl, #_player_y
	inc	(hl)
;src/main.c:168: break;
	jr	00123$
;src/main.c:169: case east:
00120$:
;src/main.c:170: player_x--;
	ld	hl, #_player_x
	dec	(hl)
;src/main.c:171: break;
	jr	00123$
;src/main.c:172: case south:
00121$:
;src/main.c:173: player_y--;
	ld	hl, #_player_y
	dec	(hl)
;src/main.c:174: break;
	jr	00123$
;src/main.c:175: case west:
00122$:
;src/main.c:176: player_x++;
	ld	hl, #_player_x
	inc	(hl)
;src/main.c:178: }
00123$:
;src/main.c:179: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:180: set_sprite_tile(0,player_dir);
	ld	hl, #_player_dir
	ld	c, (hl)
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;src/main.c:180: set_sprite_tile(0,player_dir);
00125$:
;src/main.c:192: wait_vbl_done();
	call	_wait_vbl_done
;src/main.c:194: }
	jp	00128$
	.area _CODE
	.area _INITIALIZER
__xinit__player_x:
	.db #0x00	; 0
__xinit__player_y:
	.db #0x00	; 0
__xinit__global_state:
	.db #0x01	; 1
__xinit__player_dir:
	.db #0x00	; 0
__xinit__joypadCurrent:
	.db #0x00	; 0
__xinit__joypadPrevious:
	.db #0x00	; 0
	.area _CABS (ABS)
