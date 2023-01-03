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
	.globl _update_dng_UI
	.globl _init_dng_UI
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
_inventory:
	.ds 200
_player_dir:
	.ds 1
_joypad_current:
	.ds 1
_joypad_previous:
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
;src/main.c:57: void init_dungeon(const unsigned char *dng,uint8_t dng_width, uint8_t dng_height) {
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
;src/main.c:60: set_bkg_data(0,75,dng_tileset);
	ld	de, #_dng_tileset
	push	de
	ld	hl, #0x4b00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:61: set_sprite_data(0,25,UI_tiles);
	ld	de, #_UI_tiles
	push	de
	ld	hl, #0x1900
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/main.c:63: for(uint8_t i = 0; i < dng_width; i++){
	ld	b, #0x00
00109$:
	ld	a, b
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00104$
;src/main.c:64: for(uint8_t j = 0; j < dng_height; j++){
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
;src/main.c:65: if(dng[i*dng_width+j]==0x01){
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
;src/main.c:66: player_x = j;
	ld	hl, #_player_x
	ld	(hl), c
;src/main.c:67: player_y = i;
	ld	hl, #_player_y
	ld	(hl), b
00107$:
;src/main.c:64: for(uint8_t j = 0; j < dng_height; j++){
	inc	c
	jr	00106$
00110$:
;src/main.c:63: for(uint8_t i = 0; i < dng_width; i++){
	inc	b
	jr	00109$
00104$:
;src/main.c:71: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:73: }
	add	sp, #5
	pop	hl
	inc	sp
	jp	(hl)
_white_screen:
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
;src/main.c:75: void update_dng(unsigned char *dng,uint8_t dungeon_width, uint8_t dungeon_hieght){
;	---------------------------------
; Function update_dng
; ---------------------------------
_update_dng::
	ld	c, a
;src/main.c:78: set_bkg_tiles(0,0,20,13,white_screen);
	push	de
	ld	hl, #_white_screen
	push	hl
	ld	hl, #0xd14
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
;src/main.c:80: switch (player_dir){
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
;src/main.c:81: case north:
00101$:
;src/main.c:82: check_l_walls_n(dng,dungeon_width,dungeon_hieght,player_x,player_y);
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
;src/main.c:84: check_r_walls_n(dng,dungeon_width,dungeon_hieght,player_x,player_y);
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
;src/main.c:85: check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y, 0, -1);
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
;src/main.c:87: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:88: break;
	jp	00106$
;src/main.c:89: case south:
00102$:
;src/main.c:90: check_l_walls_s(dng,dungeon_width,dungeon_hieght,player_x,player_y);
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
;src/main.c:99: check_r_walls_w(dng,dungeon_width,dungeon_hieght,player_x,player_y);
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
;src/main.c:100: check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y,-1,0);
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
;src/main.c:102: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:103: break;
	jr	00106$
;src/main.c:104: case east:
00104$:
;src/main.c:106: check_l_walls_e(dng,dungeon_width,dungeon_hieght,player_x,player_y);
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
;src/main.c:107: check_r_walls_e(dng,dungeon_width,dungeon_hieght,player_x,player_y);
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
;src/main.c:108: check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y,+1,0);
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
;src/main.c:110: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:112: }
00106$:
;src/main.c:114: }
	pop	hl
	inc	sp
	jp	(hl)
;src/main.c:116: void collision_check(const unsigned char *dng, uint8_t dng_width, uint8_t dng_height){
;	---------------------------------
; Function collision_check
; ---------------------------------
_collision_check::
;src/main.c:118: }
	pop	hl
	inc	sp
	jp	(hl)
;src/main.c:120: void init_dng_UI(){
;	---------------------------------
; Function init_dng_UI
; ---------------------------------
_init_dng_UI::
;../gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;../gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x50
;../gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;../gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x1c
	ld	(hl+), a
	ld	(hl), #0x50
;../gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;../gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x1c
	ld	(hl+), a
	ld	(hl), #0x58
;../gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;../gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x58
;../gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;../gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x40
;../gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 20)
;../gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x68
;src/main.c:126: move_sprite(5,104,20);
;src/main.c:128: }
	ret
;src/main.c:130: void update_dng_UI (){
;	---------------------------------
; Function update_dng_UI
; ---------------------------------
_update_dng_UI::
;../gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 3)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 11)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 15)
	ld	(hl), #0x00
;src/main.c:136: switch(player_dir){
	ld	a, (#_player_dir)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_player_dir)
	dec	a
	jr	Z, 00102$
	ld	a, (#_player_dir)
	sub	a, #0x02
	jr	Z, 00103$
	ld	a, (#_player_dir)
	sub	a, #0x03
	jr	Z, 00104$
	jp	00105$
;src/main.c:137: case 0:            
00101$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x02
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x02
;../gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 11)
	ld	(hl), #0x60
	ld	hl, #(_shadow_OAM + 15)
	ld	(hl), #0x60
;src/main.c:144: break;
	jr	00105$
;src/main.c:146: case 1:            
00102$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x03
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x03
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x04
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x04
;../gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 11)
	ld	(hl), #0x40
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), #0x40
;src/main.c:153: break;
	jr	00105$
;src/main.c:155: case 2:
00103$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x06
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x05
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x06
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x05
;../gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), #0x60
	ld	hl, #(_shadow_OAM + 11)
	ld	(hl), #0x60
;src/main.c:164: break;
	jr	00105$
;src/main.c:166: case 3:
00104$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x07
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x08
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x08
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x07
;../gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 11)
	ld	(hl), #0x20
	ld	hl, #(_shadow_OAM + 15)
	ld	(hl), #0x20
;src/main.c:174: }
00105$:
;src/main.c:177: switch(player_dir){
	ld	a, (#_player_dir)
	or	a, a
	jr	Z, 00106$
	ld	a, (#_player_dir)
	dec	a
	jr	Z, 00107$
	ld	a, (#_player_dir)
	sub	a, #0x02
	jr	Z, 00108$
	ld	a, (#_player_dir)
	sub	a, #0x03
	jr	Z, 00109$
	ret
;src/main.c:178: case 0:            
00106$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0c
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x0a
;src/main.c:181: break;
	ret
;src/main.c:183: case 1:            
00107$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x09
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x0b
;src/main.c:186: break;
	ret
;src/main.c:188: case 2:
00108$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0a
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x0c
;src/main.c:193: break;
	ret
;src/main.c:195: case 3:
00109$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0b
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x09
;src/main.c:199: }
;src/main.c:202: }
	ret
;src/main.c:204: void dungeon_logic_upd(){
;	---------------------------------
; Function dungeon_logic_upd
; ---------------------------------
_dungeon_logic_upd::
;src/main.c:205: joypad_previous = joypad_current;
	ld	a, (#_joypad_current)
	ld	(#_joypad_previous),a
;src/main.c:206: joypad_current = joypad();
	call	_joypad
	ld	hl, #_joypad_current
	ld	(hl), a
;src/main.c:208: if((joypad_current & J_LEFT) && !(joypad_previous & J_LEFT)){
	bit	1, (hl)
	jr	Z, 00104$
	ld	a, (#_joypad_previous)
	bit	1, a
	jr	NZ, 00104$
;src/main.c:209: player_dir--;
	ld	hl, #_player_dir
	dec	(hl)
;src/main.c:210: if (player_dir==255){
	ld	a, (hl)
	inc	a
	jr	NZ, 00102$
;src/main.c:211: player_dir = west;
	ld	hl, #_player_dir
	ld	(hl), #0x03
00102$:
;src/main.c:213: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
00104$:
;src/main.c:216: if((joypad_current & J_RIGHT) && !(joypad_previous & J_RIGHT)){
	ld	a, (#_joypad_current)
	rrca
	jr	NC, 00109$
	ld	a, (#_joypad_previous)
	rrca
	jr	C, 00109$
;src/main.c:217: player_dir++;
	ld	hl, #_player_dir
	inc	(hl)
;src/main.c:218: if(player_dir==4){
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00107$
;src/main.c:219: player_dir=north;
	ld	hl, #_player_dir
	ld	(hl), #0x00
00107$:
;src/main.c:221: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
00109$:
;src/main.c:224: if((joypad_current & J_UP) && !(joypad_previous & J_UP)){
	ld	a, (#_joypad_current)
	bit	2, a
	jp	Z,00129$
	ld	a, (#_joypad_previous)
	bit	2, a
	jp	NZ,00129$
;src/main.c:227: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
	ld	hl, #_player_y
	ld	e, (hl)
;src/main.c:225: switch(player_dir){
	ld	a, (#_player_dir)
	or	a, a
	jr	Z, 00111$
;src/main.c:233: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
	ld	hl, #_player_x
	ld	c, (hl)
;src/main.c:225: switch(player_dir){
	ld	a, (#_player_dir)
	dec	a
	jr	Z, 00115$
	ld	a,(#_player_dir)
	cp	a,#0x02
	jp	Z,00119$
	sub	a, #0x03
	jp	Z,00123$
	jp	00129$
;src/main.c:226: case north:
00111$:
;src/main.c:227: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
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
;src/main.c:228: player_y--;
	ld	hl, #_player_y
	dec	(hl)
;src/main.c:229: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:231: break;
	jp	00129$
;src/main.c:232: case east:
00115$:
;src/main.c:233: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
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
;src/main.c:234: player_x++;
	ld	hl, #_player_x
	inc	(hl)
;src/main.c:235: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:237: break;
	jp	00129$
;src/main.c:238: case south:
00119$:
;src/main.c:239: if(return_value(test_dungeon,15,15,player_x,player_y+1)==0x00||return_value(test_dungeon,15,15,player_x,player_y+1)==0x01){
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
;src/main.c:240: player_y++;
	ld	hl, #_player_y
	inc	(hl)
;src/main.c:241: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:243: break;
	jr	00129$
;src/main.c:244: case west:
00123$:
;src/main.c:245: if(return_value(test_dungeon,15,15,player_x-1,player_y)==0x00||return_value(test_dungeon,15,15,player_x-1,player_y)==0x01){
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
;src/main.c:246: player_x--;
	ld	hl, #_player_x
	dec	(hl)
;src/main.c:247: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:250: }
00129$:
;src/main.c:252: if((joypad_current & J_DOWN) && !(joypad_previous & J_DOWN)){
	ld	a, (#_joypad_current)
	bit	3, a
	ret	Z
	ld	a, (#_joypad_previous)
	bit	3, a
	ret	NZ
;src/main.c:227: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
	ld	hl, #_player_y
	ld	e, (hl)
;src/main.c:253: switch(player_dir){
	ld	a, (#_player_dir)
	or	a, a
	jr	Z, 00131$
;src/main.c:233: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
	ld	hl, #_player_x
	ld	c, (hl)
;src/main.c:253: switch(player_dir){
	ld	a, (#_player_dir)
	dec	a
	jr	Z, 00135$
	ld	a,(#_player_dir)
	cp	a,#0x02
	jp	Z,00139$
	sub	a, #0x03
	jp	Z,00143$
	ret
;src/main.c:254: case north:
00131$:
;src/main.c:255: if(return_value(test_dungeon,15,15,player_x,player_y+1)==0x00||return_value(test_dungeon,15,15,player_x,player_y+1)==0x01){
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
;src/main.c:256: player_y++;
	ld	hl, #_player_y
	inc	(hl)
;src/main.c:257: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:259: break;
	ret
;src/main.c:260: case east:
00135$:
;src/main.c:261: if(return_value(test_dungeon,15,15,player_x-1,player_y)==0x00||return_value(test_dungeon,15,15,player_x-1,player_y)==0x01){
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
;src/main.c:262: player_x--;
	ld	hl, #_player_x
	dec	(hl)
;src/main.c:263: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:265: break;
	ret
;src/main.c:266: case south:
00139$:
;src/main.c:267: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
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
;src/main.c:268: player_y--;
	ld	hl, #_player_y
	dec	(hl)
;src/main.c:269: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:271: break;
	ret
;src/main.c:272: case west:
00143$:
;src/main.c:273: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
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
;src/main.c:274: player_x++;
	ld	hl, #_player_x
	inc	(hl)
;src/main.c:275: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:278: }
;src/main.c:280: }
	ret
;src/main.c:282: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:285: init_dungeon(test_dungeon, 15, 15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_init_dungeon
;src/main.c:286: init_dng_UI();
	call	_init_dng_UI
;src/main.c:287: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:288: set_sprite_data(0,26,UI_tiles);
	ld	de, #_UI_tiles
	push	de
	ld	hl, #0x1a00
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/main.c:291: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:293: while(1) {
00102$:
;src/main.c:295: dungeon_logic_upd();
	call	_dungeon_logic_upd
;src/main.c:296: update_dng_UI();
	call	_update_dng_UI
;src/main.c:312: wait_vbl_done();
	call	_wait_vbl_done
;src/main.c:314: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
__xinit__player_x:
	.db #0x00	; 0
__xinit__player_y:
	.db #0x00	; 0
__xinit__global_state:
	.db #0x01	; 1
__xinit__inventory:
	.dw #0x0000
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
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
__xinit__player_dir:
	.db #0x00	; 0
__xinit__joypad_current:
	.db #0x00	; 0
__xinit__joypad_previous:
	.db #0x00	; 0
	.area _CABS (ABS)
