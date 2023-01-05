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
	.globl _pull_letters
	.globl _check_r_walls
	.globl _check_l_walls
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
Fmain$player_x$0_0$0==.
_player_x:
	.ds 1
Fmain$player_y$0_0$0==.
_player_y:
	.ds 1
Fmain$global_state$0_0$0==.
_global_state:
	.ds 1
Fmain$inventory$0_0$0==.
_inventory:
	.ds 200
Fmain$player_dir$0_0$0==.
_player_dir:
	.ds 1
Fmain$joypad_current$0_0$0==.
_joypad_current:
	.ds 1
Fmain$joypad_previous$0_0$0==.
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
	G$init_dungeon$0$0	= .
	.globl	G$init_dungeon$0$0
	C$main.c$56$0_0$111	= .
	.globl	C$main.c$56$0_0$111
;src/main.c:56: void init_dungeon(const unsigned char *dng,uint8_t dng_width, uint8_t dng_height) {
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
	C$main.c$59$1_0$111	= .
	.globl	C$main.c$59$1_0$111
;src/main.c:59: set_bkg_data(0,75,dng_tileset);
	ld	de, #_dng_tileset
	push	de
	ld	hl, #0x4b00
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$main.c$60$1_0$111	= .
	.globl	C$main.c$60$1_0$111
;src/main.c:60: set_sprite_data(0,25,UI_tiles);
	ld	de, #_UI_tiles
	push	de
	ld	hl, #0x1900
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$62$1_0$111	= .
	.globl	C$main.c$62$1_0$111
;src/main.c:62: for(uint8_t i = 0; i < dng_width; i++){
	ld	b, #0x00
00109$:
	ld	a, b
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00104$
	C$main.c$63$1_0$111	= .
	.globl	C$main.c$63$1_0$111
;src/main.c:63: for(uint8_t j = 0; j < dng_height; j++){
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
	C$main.c$64$5_0$115	= .
	.globl	C$main.c$64$5_0$115
;src/main.c:64: if(dng[i*dng_width+j]==0x01){
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
	C$main.c$65$6_0$116	= .
	.globl	C$main.c$65$6_0$116
;src/main.c:65: player_x = j;
	ld	hl, #_player_x
	ld	(hl), c
	C$main.c$66$6_0$116	= .
	.globl	C$main.c$66$6_0$116
;src/main.c:66: player_y = i;
	ld	hl, #_player_y
	ld	(hl), b
00107$:
	C$main.c$63$4_0$114	= .
	.globl	C$main.c$63$4_0$114
;src/main.c:63: for(uint8_t j = 0; j < dng_height; j++){
	inc	c
	jr	00106$
00110$:
	C$main.c$62$2_0$112	= .
	.globl	C$main.c$62$2_0$112
;src/main.c:62: for(uint8_t i = 0; i < dng_width; i++){
	inc	b
	jr	00109$
00104$:
	C$main.c$70$1_0$111	= .
	.globl	C$main.c$70$1_0$111
;src/main.c:70: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	C$main.c$72$1_0$111	= .
	.globl	C$main.c$72$1_0$111
;src/main.c:72: }
	add	sp, #5
	pop	hl
	inc	sp
	jp	(hl)
G$white_screen$0_0$0 == .
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
G$test_dungeon$0_0$0 == .
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
	G$update_dng$0$0	= .
	.globl	G$update_dng$0$0
	C$main.c$74$1_0$118	= .
	.globl	C$main.c$74$1_0$118
;src/main.c:74: void update_dng(unsigned char *dng,uint8_t dungeon_width, uint8_t dungeon_hieght){
;	---------------------------------
; Function update_dng
; ---------------------------------
_update_dng::
	ld	c, a
	C$main.c$77$1_0$118	= .
	.globl	C$main.c$77$1_0$118
;src/main.c:77: set_bkg_tiles(0,0,20,13,white_screen);
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
	C$main.c$79$1_0$118	= .
	.globl	C$main.c$79$1_0$118
;src/main.c:79: check_l_walls(dng,dungeon_width,dungeon_hieght,player_x, player_y, player_dir);
	push	bc
	push	de
	ld	a, (#_player_dir)
	ld	h, a
	ld	a, (#_player_y)
	ld	l, a
	push	hl
	ld	a, (#_player_x)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_l_walls
	pop	de
	pop	bc
	C$main.c$80$1_0$118	= .
	.globl	C$main.c$80$1_0$118
;src/main.c:80: check_r_walls(dng,dungeon_width,dungeon_hieght,player_x, player_y, player_dir);
	push	bc
	push	de
	ld	a, (#_player_dir)
	ld	h, a
	ld	a, (#_player_y)
	ld	l, a
	push	hl
	ld	a, (#_player_x)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_r_walls
	pop	de
	pop	bc
	C$main.c$81$1_0$118	= .
	.globl	C$main.c$81$1_0$118
;src/main.c:81: check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y,player_dir);
	ld	a, (#_player_dir)
	ld	h, a
	ld	a, (#_player_y)
	ld	l, a
	push	hl
	ld	a, (#_player_x)
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_m_walls
	C$main.c$83$1_0$118	= .
	.globl	C$main.c$83$1_0$118
;src/main.c:83: }
	pop	hl
	inc	sp
	jp	(hl)
	G$collision_check$0$0	= .
	.globl	G$collision_check$0$0
	C$main.c$85$1_0$121	= .
	.globl	C$main.c$85$1_0$121
;src/main.c:85: void collision_check(const unsigned char *dng, uint8_t dng_width, uint8_t dng_height){
;	---------------------------------
; Function collision_check
; ---------------------------------
_collision_check::
	C$main.c$87$1_0$121	= .
	.globl	C$main.c$87$1_0$121
;src/main.c:87: }
	pop	hl
	inc	sp
	jp	(hl)
	G$init_dng_UI$0$0	= .
	.globl	G$init_dng_UI$0$0
	C$main.c$89$1_0$122	= .
	.globl	C$main.c$89$1_0$122
;src/main.c:89: void init_dng_UI(){
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
	C$main.c$97$3_0$122	= .
	.globl	C$main.c$97$3_0$122
;src/main.c:97: move_sprite(5,104,20);
	C$main.c$101$3_0$122	= .
	.globl	C$main.c$101$3_0$122
;src/main.c:101: }
	C$main.c$101$3_0$122	= .
	.globl	C$main.c$101$3_0$122
	XG$init_dng_UI$0$0	= .
	.globl	XG$init_dng_UI$0$0
	ret
	G$update_dng_UI$0$0	= .
	.globl	G$update_dng_UI$0$0
	C$main.c$103$3_0$141	= .
	.globl	C$main.c$103$3_0$141
;src/main.c:103: void update_dng_UI (){
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
	C$main.c$109$1_0$141	= .
	.globl	C$main.c$109$1_0$141
;src/main.c:109: switch(player_dir){
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
	C$main.c$110$2_0$142	= .
	.globl	C$main.c$110$2_0$142
;src/main.c:110: case 0:            
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
	C$main.c$117$2_0$142	= .
	.globl	C$main.c$117$2_0$142
;src/main.c:117: break;
	jr	00105$
	C$main.c$119$2_0$142	= .
	.globl	C$main.c$119$2_0$142
;src/main.c:119: case 1:            
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
	C$main.c$126$2_0$142	= .
	.globl	C$main.c$126$2_0$142
;src/main.c:126: break;
	jr	00105$
	C$main.c$128$2_0$142	= .
	.globl	C$main.c$128$2_0$142
;src/main.c:128: case 2:
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
	C$main.c$137$2_0$142	= .
	.globl	C$main.c$137$2_0$142
;src/main.c:137: break;
	jr	00105$
	C$main.c$139$2_0$142	= .
	.globl	C$main.c$139$2_0$142
;src/main.c:139: case 3:
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
	C$main.c$147$1_0$141	= .
	.globl	C$main.c$147$1_0$141
;src/main.c:147: }
00105$:
	C$main.c$150$1_0$141	= .
	.globl	C$main.c$150$1_0$141
;src/main.c:150: switch(player_dir){
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
	C$main.c$151$2_0$143	= .
	.globl	C$main.c$151$2_0$143
;src/main.c:151: case 0:            
00106$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0c
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x0a
	C$main.c$154$2_0$143	= .
	.globl	C$main.c$154$2_0$143
;src/main.c:154: break;
	ret
	C$main.c$156$2_0$143	= .
	.globl	C$main.c$156$2_0$143
;src/main.c:156: case 1:            
00107$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x09
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x0b
	C$main.c$159$2_0$143	= .
	.globl	C$main.c$159$2_0$143
;src/main.c:159: break;
	ret
	C$main.c$161$2_0$143	= .
	.globl	C$main.c$161$2_0$143
;src/main.c:161: case 2:
00108$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0a
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x0c
	C$main.c$166$2_0$143	= .
	.globl	C$main.c$166$2_0$143
;src/main.c:166: break;
	ret
	C$main.c$168$2_0$143	= .
	.globl	C$main.c$168$2_0$143
;src/main.c:168: case 3:
00109$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0b
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x09
	C$main.c$172$1_0$141	= .
	.globl	C$main.c$172$1_0$141
;src/main.c:172: }
	C$main.c$175$1_0$141	= .
	.globl	C$main.c$175$1_0$141
;src/main.c:175: }
	C$main.c$175$1_0$141	= .
	.globl	C$main.c$175$1_0$141
	XG$update_dng_UI$0$0	= .
	.globl	XG$update_dng_UI$0$0
	ret
	G$dungeon_logic_upd$0$0	= .
	.globl	G$dungeon_logic_upd$0$0
	C$main.c$177$1_0$252	= .
	.globl	C$main.c$177$1_0$252
;src/main.c:177: void dungeon_logic_upd(){
;	---------------------------------
; Function dungeon_logic_upd
; ---------------------------------
_dungeon_logic_upd::
	C$main.c$178$1_0$252	= .
	.globl	C$main.c$178$1_0$252
;src/main.c:178: joypad_previous = joypad_current;
	ld	a, (#_joypad_current)
	ld	(#_joypad_previous),a
	C$main.c$179$1_0$252	= .
	.globl	C$main.c$179$1_0$252
;src/main.c:179: joypad_current = joypad();
	call	_joypad
	ld	hl, #_joypad_current
	ld	(hl), a
	C$main.c$181$1_0$252	= .
	.globl	C$main.c$181$1_0$252
;src/main.c:181: if((joypad_current & J_LEFT) && !(joypad_previous & J_LEFT)){
	bit	1, (hl)
	jr	Z, 00104$
	ld	a, (#_joypad_previous)
	bit	1, a
	jr	NZ, 00104$
	C$main.c$182$2_0$253	= .
	.globl	C$main.c$182$2_0$253
;src/main.c:182: player_dir--;
	ld	hl, #_player_dir
	dec	(hl)
	C$main.c$183$2_0$253	= .
	.globl	C$main.c$183$2_0$253
;src/main.c:183: if (player_dir==255){
	ld	a, (hl)
	inc	a
	jr	NZ, 00102$
	C$main.c$184$3_0$254	= .
	.globl	C$main.c$184$3_0$254
;src/main.c:184: player_dir = west;
	ld	hl, #_player_dir
	ld	(hl), #0x03
00102$:
	C$main.c$186$2_0$253	= .
	.globl	C$main.c$186$2_0$253
;src/main.c:186: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
00104$:
	C$main.c$189$1_0$252	= .
	.globl	C$main.c$189$1_0$252
;src/main.c:189: if((joypad_current & J_RIGHT) && !(joypad_previous & J_RIGHT)){
	ld	a, (#_joypad_current)
	rrca
	jr	NC, 00109$
	ld	a, (#_joypad_previous)
	rrca
	jr	C, 00109$
	C$main.c$190$2_0$255	= .
	.globl	C$main.c$190$2_0$255
;src/main.c:190: player_dir++;
	ld	hl, #_player_dir
	inc	(hl)
	C$main.c$191$2_0$255	= .
	.globl	C$main.c$191$2_0$255
;src/main.c:191: if(player_dir==4){
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00107$
	C$main.c$192$3_0$256	= .
	.globl	C$main.c$192$3_0$256
;src/main.c:192: player_dir=north;
	ld	hl, #_player_dir
	ld	(hl), #0x00
00107$:
	C$main.c$194$2_0$255	= .
	.globl	C$main.c$194$2_0$255
;src/main.c:194: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
00109$:
	C$main.c$197$1_0$252	= .
	.globl	C$main.c$197$1_0$252
;src/main.c:197: if((joypad_current & J_UP) && !(joypad_previous & J_UP)){
	ld	a, (#_joypad_current)
	bit	2, a
	jp	Z,00129$
	ld	a, (#_joypad_previous)
	bit	2, a
	jp	NZ,00129$
	C$main.c$200$1_0$252	= .
	.globl	C$main.c$200$1_0$252
;src/main.c:200: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
	ld	hl, #_player_y
	ld	e, (hl)
	C$main.c$198$2_0$257	= .
	.globl	C$main.c$198$2_0$257
;src/main.c:198: switch(player_dir){
	ld	a, (#_player_dir)
	or	a, a
	jr	Z, 00111$
	C$main.c$206$1_0$252	= .
	.globl	C$main.c$206$1_0$252
;src/main.c:206: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
	ld	hl, #_player_x
	ld	c, (hl)
	C$main.c$198$2_0$257	= .
	.globl	C$main.c$198$2_0$257
;src/main.c:198: switch(player_dir){
	ld	a, (#_player_dir)
	dec	a
	jr	Z, 00115$
	ld	a,(#_player_dir)
	cp	a,#0x02
	jp	Z,00119$
	sub	a, #0x03
	jp	Z,00123$
	jp	00129$
	C$main.c$199$3_0$258	= .
	.globl	C$main.c$199$3_0$258
;src/main.c:199: case north:
00111$:
	C$main.c$200$3_0$258	= .
	.globl	C$main.c$200$3_0$258
;src/main.c:200: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
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
	C$main.c$201$4_0$259	= .
	.globl	C$main.c$201$4_0$259
;src/main.c:201: player_y--;
	ld	hl, #_player_y
	dec	(hl)
	C$main.c$202$4_0$259	= .
	.globl	C$main.c$202$4_0$259
;src/main.c:202: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$204$3_0$258	= .
	.globl	C$main.c$204$3_0$258
;src/main.c:204: break;
	jp	00129$
	C$main.c$205$3_0$258	= .
	.globl	C$main.c$205$3_0$258
;src/main.c:205: case east:
00115$:
	C$main.c$206$3_0$258	= .
	.globl	C$main.c$206$3_0$258
;src/main.c:206: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
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
	C$main.c$207$4_0$260	= .
	.globl	C$main.c$207$4_0$260
;src/main.c:207: player_x++;
	ld	hl, #_player_x
	inc	(hl)
	C$main.c$208$4_0$260	= .
	.globl	C$main.c$208$4_0$260
;src/main.c:208: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$210$3_0$258	= .
	.globl	C$main.c$210$3_0$258
;src/main.c:210: break;
	jp	00129$
	C$main.c$211$3_0$258	= .
	.globl	C$main.c$211$3_0$258
;src/main.c:211: case south:
00119$:
	C$main.c$212$3_0$258	= .
	.globl	C$main.c$212$3_0$258
;src/main.c:212: if(return_value(test_dungeon,15,15,player_x,player_y+1)==0x00||return_value(test_dungeon,15,15,player_x,player_y+1)==0x01){
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
	C$main.c$213$4_0$261	= .
	.globl	C$main.c$213$4_0$261
;src/main.c:213: player_y++;
	ld	hl, #_player_y
	inc	(hl)
	C$main.c$214$4_0$261	= .
	.globl	C$main.c$214$4_0$261
;src/main.c:214: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$216$3_0$258	= .
	.globl	C$main.c$216$3_0$258
;src/main.c:216: break;
	jr	00129$
	C$main.c$217$3_0$258	= .
	.globl	C$main.c$217$3_0$258
;src/main.c:217: case west:
00123$:
	C$main.c$218$3_0$258	= .
	.globl	C$main.c$218$3_0$258
;src/main.c:218: if(return_value(test_dungeon,15,15,player_x-1,player_y)==0x00||return_value(test_dungeon,15,15,player_x-1,player_y)==0x01){
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
	C$main.c$219$4_0$262	= .
	.globl	C$main.c$219$4_0$262
;src/main.c:219: player_x--;
	ld	hl, #_player_x
	dec	(hl)
	C$main.c$220$4_0$262	= .
	.globl	C$main.c$220$4_0$262
;src/main.c:220: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$223$1_0$252	= .
	.globl	C$main.c$223$1_0$252
;src/main.c:223: }
00129$:
	C$main.c$225$1_0$252	= .
	.globl	C$main.c$225$1_0$252
;src/main.c:225: if((joypad_current & J_DOWN) && !(joypad_previous & J_DOWN)){
	ld	a, (#_joypad_current)
	bit	3, a
	ret	Z
	ld	a, (#_joypad_previous)
	bit	3, a
	ret	NZ
	C$main.c$200$1_0$252	= .
	.globl	C$main.c$200$1_0$252
;src/main.c:200: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
	ld	hl, #_player_y
	ld	e, (hl)
	C$main.c$226$2_0$263	= .
	.globl	C$main.c$226$2_0$263
;src/main.c:226: switch(player_dir){
	ld	a, (#_player_dir)
	or	a, a
	jr	Z, 00131$
	C$main.c$206$1_0$252	= .
	.globl	C$main.c$206$1_0$252
;src/main.c:206: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
	ld	hl, #_player_x
	ld	c, (hl)
	C$main.c$226$2_0$263	= .
	.globl	C$main.c$226$2_0$263
;src/main.c:226: switch(player_dir){
	ld	a, (#_player_dir)
	dec	a
	jr	Z, 00135$
	ld	a,(#_player_dir)
	cp	a,#0x02
	jp	Z,00139$
	sub	a, #0x03
	jp	Z,00143$
	ret
	C$main.c$227$3_0$264	= .
	.globl	C$main.c$227$3_0$264
;src/main.c:227: case north:
00131$:
	C$main.c$228$3_0$264	= .
	.globl	C$main.c$228$3_0$264
;src/main.c:228: if(return_value(test_dungeon,15,15,player_x,player_y+1)==0x00||return_value(test_dungeon,15,15,player_x,player_y+1)==0x01){
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
	C$main.c$229$4_0$265	= .
	.globl	C$main.c$229$4_0$265
;src/main.c:229: player_y++;
	ld	hl, #_player_y
	inc	(hl)
	C$main.c$230$4_0$265	= .
	.globl	C$main.c$230$4_0$265
;src/main.c:230: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$232$3_0$264	= .
	.globl	C$main.c$232$3_0$264
;src/main.c:232: break;
	ret
	C$main.c$233$3_0$264	= .
	.globl	C$main.c$233$3_0$264
;src/main.c:233: case east:
00135$:
	C$main.c$234$3_0$264	= .
	.globl	C$main.c$234$3_0$264
;src/main.c:234: if(return_value(test_dungeon,15,15,player_x-1,player_y)==0x00||return_value(test_dungeon,15,15,player_x-1,player_y)==0x01){
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
	C$main.c$235$4_0$266	= .
	.globl	C$main.c$235$4_0$266
;src/main.c:235: player_x--;
	ld	hl, #_player_x
	dec	(hl)
	C$main.c$236$4_0$266	= .
	.globl	C$main.c$236$4_0$266
;src/main.c:236: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$238$3_0$264	= .
	.globl	C$main.c$238$3_0$264
;src/main.c:238: break;
	ret
	C$main.c$239$3_0$264	= .
	.globl	C$main.c$239$3_0$264
;src/main.c:239: case south:
00139$:
	C$main.c$240$3_0$264	= .
	.globl	C$main.c$240$3_0$264
;src/main.c:240: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
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
	C$main.c$241$4_0$267	= .
	.globl	C$main.c$241$4_0$267
;src/main.c:241: player_y--;
	ld	hl, #_player_y
	dec	(hl)
	C$main.c$242$4_0$267	= .
	.globl	C$main.c$242$4_0$267
;src/main.c:242: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$244$3_0$264	= .
	.globl	C$main.c$244$3_0$264
;src/main.c:244: break;
	ret
	C$main.c$245$3_0$264	= .
	.globl	C$main.c$245$3_0$264
;src/main.c:245: case west:
00143$:
	C$main.c$246$3_0$264	= .
	.globl	C$main.c$246$3_0$264
;src/main.c:246: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
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
	C$main.c$247$4_0$268	= .
	.globl	C$main.c$247$4_0$268
;src/main.c:247: player_x++;
	ld	hl, #_player_x
	inc	(hl)
	C$main.c$248$4_0$268	= .
	.globl	C$main.c$248$4_0$268
;src/main.c:248: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$251$1_0$252	= .
	.globl	C$main.c$251$1_0$252
;src/main.c:251: }
	C$main.c$253$1_0$252	= .
	.globl	C$main.c$253$1_0$252
;src/main.c:253: }
	C$main.c$253$1_0$252	= .
	.globl	C$main.c$253$1_0$252
	XG$dungeon_logic_upd$0$0	= .
	.globl	XG$dungeon_logic_upd$0$0
	ret
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$255$1_0$270	= .
	.globl	C$main.c$255$1_0$270
;src/main.c:255: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$257$1_0$270	= .
	.globl	C$main.c$257$1_0$270
;src/main.c:257: init_dungeon(test_dungeon, 15, 15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_init_dungeon
	C$main.c$258$1_0$270	= .
	.globl	C$main.c$258$1_0$270
;src/main.c:258: init_dng_UI();
	call	_init_dng_UI
	C$main.c$259$1_0$270	= .
	.globl	C$main.c$259$1_0$270
;src/main.c:259: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$260$1_0$270	= .
	.globl	C$main.c$260$1_0$270
;src/main.c:260: set_sprite_data(0,26,UI_tiles);
	ld	de, #_UI_tiles
	push	de
	ld	hl, #0x1a00
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$269$1_0$270	= .
	.globl	C$main.c$269$1_0$270
;src/main.c:269: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
	C$main.c$271$1_0$270	= .
	.globl	C$main.c$271$1_0$270
;src/main.c:271: while(1) {
00102$:
	C$main.c$274$2_0$271	= .
	.globl	C$main.c$274$2_0$271
;src/main.c:274: dungeon_logic_upd();
	call	_dungeon_logic_upd
	C$main.c$275$2_0$271	= .
	.globl	C$main.c$275$2_0$271
;src/main.c:275: update_dng_UI();
	call	_update_dng_UI
	C$main.c$277$2_0$271	= .
	.globl	C$main.c$277$2_0$271
;src/main.c:277: pull_letters("It's dangerous to go alone take this",37,224);
	ld	a, #0xe0
	push	af
	inc	sp
	ld	a, #0x25
	ld	de, #___str_0
	call	_pull_letters
	C$main.c$291$2_0$271	= .
	.globl	C$main.c$291$2_0$271
;src/main.c:291: wait_vbl_done();
	call	_wait_vbl_done
	C$main.c$293$1_0$270	= .
	.globl	C$main.c$293$1_0$270
;src/main.c:293: }
	C$main.c$293$1_0$270	= .
	.globl	C$main.c$293$1_0$270
	XG$main$0$0	= .
	.globl	XG$main$0$0
	jr	00102$
Fmain$__str_0$0_0$0 == .
___str_0:
	.ascii "It's dangerous to go alone take this"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
Fmain$__xinit_player_x$0_0$0 == .
__xinit__player_x:
	.db #0x00	; 0
Fmain$__xinit_player_y$0_0$0 == .
__xinit__player_y:
	.db #0x00	; 0
Fmain$__xinit_global_state$0_0$0 == .
__xinit__global_state:
	.db #0x01	; 1
Fmain$__xinit_inventory$0_0$0 == .
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
Fmain$__xinit_player_dir$0_0$0 == .
__xinit__player_dir:
	.db #0x00	; 0
Fmain$__xinit_joypad_current$0_0$0 == .
__xinit__joypad_current:
	.db #0x00	; 0
Fmain$__xinit_joypad_previous$0_0$0 == .
__xinit__joypad_previous:
	.db #0x00	; 0
	.area _CABS (ABS)
