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
	.globl _dungeon_logic_upd
	.globl _collision_check
	.globl _update_dng
	.globl _init_dungeon
	.globl _check_r_walls_e
	.globl _check_r_walls_w
	.globl _check_r_walls_s
	.globl _check_r_walls_n
	.globl _check_l_walls_e
	.globl _check_l_walls_w
	.globl _check_l_walls_s
	.globl _check_l_walls_n
	.globl _check_m_walls
	.globl _return_value
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
;src/main.c:60: void init_dungeon(const unsigned char *dng,uint8_t dng_width, uint8_t dng_height) {
;	---------------------------------
; Function init_dungeon
; ---------------------------------
_init_dungeon::
	add	sp, #-5
	ldhl	sp,	#3
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
	ld	(hl), a
;src/main.c:63: set_bkg_data(0,74,dng_tileset);
	ld	de, #_dng_tileset
	push	de
	ld	hl, #0x4a00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:65: for(uint8_t i = 0; i < dng_width; i++){
	ld	b, #0x00
00109$:
	ld	a, b
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00104$
;src/main.c:66: for(uint8_t j = 0; j < dng_height; j++){
	push	bc
	ld	e, (hl)
	ld	a, b
	call	__muluchar
	ldhl	sp,	#2
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	pop	bc
	ld	c, #0x00
00106$:
	ld	a, c
	ldhl	sp,	#7
	sub	a, (hl)
	jr	NC, 00110$
;src/main.c:67: if(dng[i*dng_width+j]==0x01){
	ld	e, c
	ld	d, #0x00
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	dec	a
	jr	NZ, 00107$
;src/main.c:68: player_x = j;
	ld	hl, #_player_x
	ld	(hl), c
;src/main.c:69: player_y = i;
	ld	hl, #_player_y
	ld	(hl), b
00107$:
;src/main.c:66: for(uint8_t j = 0; j < dng_height; j++){
	inc	c
	jr	00106$
00110$:
;src/main.c:65: for(uint8_t i = 0; i < dng_width; i++){
	inc	b
	jr	00109$
00104$:
;src/main.c:73: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:75: }
	add	sp, #5
	pop	hl
	inc	sp
	jp	(hl)
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
;src/main.c:86: check_r_walls_n(dng,dungeon_width,dungeon_hieght,player_x,player_y);
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
;src/main.c:87: check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y, 0, -1);
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
;src/main.c:89: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:90: break;
	jp	00106$
;src/main.c:91: case south:
00102$:
;src/main.c:92: check_l_walls_s(dng,dungeon_width,dungeon_hieght,player_x,player_y);
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
;src/main.c:94: check_r_walls_s(dng,dungeon_width,dungeon_hieght,player_x,player_y);
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
;src/main.c:95: check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y,0,+1);
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
;src/main.c:96: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:97: break;
	jp	00106$
;src/main.c:98: case west:
00103$:
;src/main.c:99: check_l_walls_w(dng,dungeon_width,dungeon_hieght,player_x,player_y);
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
;src/main.c:101: check_r_walls_w(dng,dungeon_width,dungeon_hieght,player_x,player_y);
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
;src/main.c:102: check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y,-1,0);
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
;src/main.c:104: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:105: break;
	jr	00106$
;src/main.c:106: case east:
00104$:
;src/main.c:108: check_l_walls_e(dng,dungeon_width,dungeon_hieght,player_x,player_y);
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
;src/main.c:109: check_r_walls_e(dng,dungeon_width,dungeon_hieght,player_x,player_y);
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
;src/main.c:110: check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y,+1,0);
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
;src/main.c:112: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:114: }
00106$:
;src/main.c:116: }
	pop	hl
	inc	sp
	jp	(hl)
;src/main.c:118: void collision_check(const unsigned char *dng, uint8_t dng_width, uint8_t dng_height){
;	---------------------------------
; Function collision_check
; ---------------------------------
_collision_check::
;src/main.c:120: }
	pop	hl
	inc	sp
	jp	(hl)
;src/main.c:122: void dungeon_logic_upd(){
;	---------------------------------
; Function dungeon_logic_upd
; ---------------------------------
_dungeon_logic_upd::
;src/main.c:123: joypadPrevious = joypadCurrent;
	ld	a, (#_joypadCurrent)
	ld	(#_joypadPrevious),a
;src/main.c:124: joypadCurrent = joypad();
	call	_joypad
	ld	hl, #_joypadCurrent
	ld	(hl), a
;src/main.c:126: if((joypadCurrent & J_LEFT) && !(joypadPrevious & J_LEFT)){
	bit	1, (hl)
	jr	Z, 00104$
	ld	a, (#_joypadPrevious)
	bit	1, a
	jr	NZ, 00104$
;src/main.c:127: player_dir--;
	ld	hl, #_player_dir
	dec	(hl)
;src/main.c:128: if (player_dir==255){
	ld	a, (hl)
	inc	a
	jr	NZ, 00102$
;src/main.c:129: player_dir = west;
	ld	hl, #_player_dir
	ld	(hl), #0x03
00102$:
;src/main.c:131: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:132: set_sprite_tile(0,player_dir);
	ld	hl, #_player_dir
	ld	c, (hl)
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;src/main.c:132: set_sprite_tile(0,player_dir);
00104$:
;src/main.c:134: if((joypadCurrent & J_RIGHT) && !(joypadPrevious & J_RIGHT)){
	ld	a, (#_joypadCurrent)
	rrca
	jr	NC, 00109$
	ld	a, (#_joypadPrevious)
	rrca
	jr	C, 00109$
;src/main.c:135: player_dir++;
	ld	hl, #_player_dir
	inc	(hl)
;src/main.c:136: if(player_dir==4){
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00107$
;src/main.c:137: player_dir=north;
	ld	hl, #_player_dir
	ld	(hl), #0x00
00107$:
;src/main.c:139: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:140: set_sprite_tile(0,player_dir);
	ld	hl, #_player_dir
	ld	c, (hl)
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;src/main.c:140: set_sprite_tile(0,player_dir);
00109$:
;src/main.c:142: if((joypadCurrent & J_UP) && !(joypadPrevious & J_UP)){
	ld	a, (#_joypadCurrent)
	bit	2, a
	jp	Z,00129$
	ld	a, (#_joypadPrevious)
	bit	2, a
	jp	NZ,00129$
;src/main.c:145: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
	ld	hl, #_player_y
	ld	e, (hl)
;src/main.c:143: switch(player_dir){
	ld	a, (#_player_dir)
	or	a, a
	jr	Z, 00111$
;src/main.c:151: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
	ld	hl, #_player_x
	ld	c, (hl)
;src/main.c:143: switch(player_dir){
	ld	a, (#_player_dir)
	dec	a
	jr	Z, 00115$
	ld	a, (#_player_dir)
	sub	a, #0x02
	jp	Z,00119$
	ld	a, (#_player_dir)
	sub	a, #0x03
	jp	Z,00123$
	jp	00129$
;src/main.c:144: case north:
00111$:
;src/main.c:145: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
	ld	b, e
	dec	b
	push	bc
	inc	sp
	ld	a, (#_player_x)
	ld	h, a
	ld	l, #0x0f
	push	hl
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_return_value
	or	a, a
	jr	Z, 00112$
	ld	a, (#_player_y)
	dec	a
	push	af
	inc	sp
	ld	a, (#_player_x)
	ld	h, a
	ld	l, #0x0f
	push	hl
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_return_value
	dec	a
	jp	NZ,00129$
00112$:
;src/main.c:146: player_y--;
	ld	hl, #_player_y
	dec	(hl)
;src/main.c:147: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:149: break;
	jp	00129$
;src/main.c:150: case east:
00115$:
;src/main.c:151: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
	inc	c
	ld	a, (#_player_y)
	push	af
	inc	sp
	ld	h, c
	ld	l, #0x0f
	push	hl
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_return_value
	or	a, a
	jr	Z, 00116$
	ld	a, (#_player_x)
	inc	a
	ld	hl, #_player_y
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x0f
	push	hl
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_return_value
	dec	a
	jp	NZ,00129$
00116$:
;src/main.c:152: player_x++;
	ld	hl, #_player_x
	inc	(hl)
;src/main.c:153: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:155: break;
	jp	00129$
;src/main.c:156: case south:
00119$:
;src/main.c:157: if(return_value(test_dungeon,15,15,player_x,player_y+1)==0x00||return_value(test_dungeon,15,15,player_x,player_y+1)==0x01){
	ld	b, e
	inc	b
	push	bc
	inc	sp
	ld	a, (#_player_x)
	ld	h, a
	ld	l, #0x0f
	push	hl
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_return_value
	or	a, a
	jr	Z, 00120$
	ld	a, (#_player_y)
	inc	a
	push	af
	inc	sp
	ld	a, (#_player_x)
	ld	h, a
	ld	l, #0x0f
	push	hl
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_return_value
	dec	a
	jr	NZ, 00129$
00120$:
;src/main.c:158: player_y++;
	ld	hl, #_player_y
	inc	(hl)
;src/main.c:159: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:161: break;
	jr	00129$
;src/main.c:162: case west:
00123$:
;src/main.c:163: if(return_value(test_dungeon,15,15,player_x-1,player_y)==0x00||return_value(test_dungeon,15,15,player_x-1,player_y)==0x01){
	dec	c
	ld	a, (#_player_y)
	push	af
	inc	sp
	ld	h, c
	ld	l, #0x0f
	push	hl
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_return_value
	or	a, a
	jr	Z, 00124$
	ld	a, (#_player_x)
	dec	a
	ld	hl, #_player_y
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x0f
	push	hl
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_return_value
	dec	a
	jr	NZ, 00129$
00124$:
;src/main.c:164: player_x--;
	ld	hl, #_player_x
	dec	(hl)
;src/main.c:165: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:168: }
00129$:
;src/main.c:170: if((joypadCurrent & J_DOWN) && !(joypadPrevious & J_DOWN)){
	ld	a, (#_joypadCurrent)
	bit	3, a
	ret	Z
	ld	a, (#_joypadPrevious)
	bit	3, a
	ret	NZ
;src/main.c:145: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
	ld	hl, #_player_y
	ld	e, (hl)
;src/main.c:171: switch(player_dir){
	ld	a, (#_player_dir)
	or	a, a
	jr	Z, 00131$
;src/main.c:151: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
	ld	hl, #_player_x
	ld	c, (hl)
;src/main.c:171: switch(player_dir){
	ld	a, (#_player_dir)
	dec	a
	jr	Z, 00135$
	ld	a, (#_player_dir)
	sub	a, #0x02
	jp	Z,00139$
	ld	a, (#_player_dir)
	sub	a, #0x03
	jp	Z,00143$
	ret
;src/main.c:172: case north:
00131$:
;src/main.c:173: if(return_value(test_dungeon,15,15,player_x,player_y+1)==0x00||return_value(test_dungeon,15,15,player_x,player_y+1)==0x01){
	ld	b, e
	inc	b
	push	bc
	inc	sp
	ld	a, (#_player_x)
	ld	h, a
	ld	l, #0x0f
	push	hl
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_return_value
	or	a, a
	jr	Z, 00132$
	ld	a, (#_player_y)
	inc	a
	push	af
	inc	sp
	ld	a, (#_player_x)
	ld	h, a
	ld	l, #0x0f
	push	hl
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_return_value
	dec	a
	ret	NZ
00132$:
;src/main.c:174: player_y++;
	ld	hl, #_player_y
	inc	(hl)
;src/main.c:175: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:177: break;
	ret
;src/main.c:178: case east:
00135$:
;src/main.c:179: if(return_value(test_dungeon,15,15,player_x-1,player_y)==0x00||return_value(test_dungeon,15,15,player_x-1,player_y)==0x01){
	dec	c
	ld	a, (#_player_y)
	push	af
	inc	sp
	ld	h, c
	ld	l, #0x0f
	push	hl
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_return_value
	or	a, a
	jr	Z, 00136$
	ld	a, (#_player_x)
	dec	a
	ld	hl, #_player_y
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x0f
	push	hl
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_return_value
	dec	a
	ret	NZ
00136$:
;src/main.c:180: player_x--;
	ld	hl, #_player_x
	dec	(hl)
;src/main.c:181: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:183: break;
	ret
;src/main.c:184: case south:
00139$:
;src/main.c:185: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
	ld	b, e
	dec	b
	push	bc
	inc	sp
	ld	a, (#_player_x)
	ld	h, a
	ld	l, #0x0f
	push	hl
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_return_value
	or	a, a
	jr	Z, 00140$
	ld	a, (#_player_y)
	dec	a
	push	af
	inc	sp
	ld	a, (#_player_x)
	ld	h, a
	ld	l, #0x0f
	push	hl
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_return_value
	dec	a
	ret	NZ
00140$:
;src/main.c:186: player_y--;
	ld	hl, #_player_y
	dec	(hl)
;src/main.c:187: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:189: break;
	ret
;src/main.c:190: case west:
00143$:
;src/main.c:191: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
	inc	c
	ld	a, (#_player_y)
	push	af
	inc	sp
	ld	h, c
	ld	l, #0x0f
	push	hl
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_return_value
	or	a, a
	jr	Z, 00144$
	ld	a, (#_player_x)
	inc	a
	ld	hl, #_player_y
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x0f
	push	hl
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_return_value
	dec	a
	ret	NZ
00144$:
;src/main.c:192: player_x++;
	ld	hl, #_player_x
	inc	(hl)
;src/main.c:193: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:196: }
;src/main.c:198: }
	ret
;src/main.c:200: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:203: init_dungeon(test_dungeon, 15, 15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_init_dungeon
;src/main.c:204: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:205: set_sprite_data(0,4,news);
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
;src/main.c:206: set_sprite_tile(0,player_dir);
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
;src/main.c:208: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:210: while(1) {
00102$:
;src/main.c:212: dungeon_logic_upd();
	call	_dungeon_logic_upd
;src/main.c:223: wait_vbl_done();
	call	_wait_vbl_done
;src/main.c:225: }
	jr	00102$
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
