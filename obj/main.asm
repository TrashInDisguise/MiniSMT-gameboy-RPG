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
	.globl _state_switcher
	.globl _dungeon_logic_upd
	.globl _update_dng_UI
	.globl _init_dng_UI
	.globl _collision_check
	.globl _update_dng
	.globl _init_dungeon
	.globl _check_r_walls
	.globl _check_l_walls
	.globl _check_m_walls
	.globl _return_value
	.globl _rand
	.globl _initrand
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
Fmain$global_state$0_0$0==.
_global_state:
	.ds 1
Fmain$encounter_counter$0_0$0==.
_encounter_counter:
	.ds 1
Fmain$encounter_timer$0_0$0==.
_encounter_timer:
	.ds 1
Fmain$player_x$0_0$0==.
_player_x:
	.ds 1
Fmain$player_y$0_0$0==.
_player_y:
	.ds 1
Fmain$p_str$0_0$0==.
_p_str:
	.ds 1
Fmain$p_int$0_0$0==.
_p_int:
	.ds 1
Fmain$p_agi$0_0$0==.
_p_agi:
	.ds 1
Fmain$p_con$0_0$0==.
_p_con:
	.ds 1
Fmain$p_luk$0_0$0==.
_p_luk:
	.ds 1
Fmain$inventory$0_0$0==.
_inventory:
	.ds 100
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
	C$main.c$70$0_0$113	= .
	.globl	C$main.c$70$0_0$113
;src/main.c:70: void init_dungeon(const unsigned char *dng,uint8_t dng_width, uint8_t dng_height) {
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
	C$main.c$72$1_0$113	= .
	.globl	C$main.c$72$1_0$113
;src/main.c:72: initrand(sys_time);
	ld	hl, #_sys_time
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_initrand
	pop	hl
	C$main.c$73$1_0$113	= .
	.globl	C$main.c$73$1_0$113
;src/main.c:73: encounter_counter = rand() % 15 + 5;
	call	_rand
	ld	d, #0x00
	ld	bc, #0x000f
	call	__modsint
	ld	a, c
	add	a, #0x05
	ld	(#_encounter_counter),a
	C$main.c$74$1_0$113	= .
	.globl	C$main.c$74$1_0$113
;src/main.c:74: encounter_timer = 0;// increments with every move throught the dungeon. Then it equales to encounteer_counter battle starts
	ld	hl, #_encounter_timer
	ld	(hl), #0x00
	C$main.c$77$1_0$113	= .
	.globl	C$main.c$77$1_0$113
;src/main.c:77: set_bkg_data(0,75,dng_tileset);
	ld	de, #_dng_tileset
	push	de
	ld	hl, #0x4b00
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$main.c$78$1_0$113	= .
	.globl	C$main.c$78$1_0$113
;src/main.c:78: set_sprite_data(0,25,UI_tiles);
	ld	de, #_UI_tiles
	push	de
	ld	hl, #0x1900
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$81$1_0$113	= .
	.globl	C$main.c$81$1_0$113
;src/main.c:81: for(uint8_t i = 0; i < dng_width; i++){
	ld	c, #0x00
00109$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00104$
	C$main.c$82$1_0$113	= .
	.globl	C$main.c$82$1_0$113
;src/main.c:82: for(uint8_t j = 0; j < dng_height; j++){
	push	bc
	ld	e, (hl)
	ld	a, c
	call	__muluchar
	ldhl	sp,	#2
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	pop	bc
	ld	b, #0x00
00106$:
	ld	a, b
	ldhl	sp,	#7
	sub	a, (hl)
	jr	NC, 00110$
	C$main.c$83$5_0$117	= .
	.globl	C$main.c$83$5_0$117
;src/main.c:83: if(dng[i*dng_width+j]==0x01){
	ld	e, b
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
	C$main.c$84$6_0$118	= .
	.globl	C$main.c$84$6_0$118
;src/main.c:84: player_x = j;
	ld	hl, #_player_x
	ld	(hl), b
	C$main.c$85$6_0$118	= .
	.globl	C$main.c$85$6_0$118
;src/main.c:85: player_y = i;
	ld	hl, #_player_y
	ld	(hl), c
00107$:
	C$main.c$82$4_0$116	= .
	.globl	C$main.c$82$4_0$116
;src/main.c:82: for(uint8_t j = 0; j < dng_height; j++){
	inc	b
	jr	00106$
00110$:
	C$main.c$81$2_0$114	= .
	.globl	C$main.c$81$2_0$114
;src/main.c:81: for(uint8_t i = 0; i < dng_width; i++){
	inc	c
	jr	00109$
00104$:
	C$main.c$89$1_0$113	= .
	.globl	C$main.c$89$1_0$113
;src/main.c:89: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	C$main.c$91$1_0$113	= .
	.globl	C$main.c$91$1_0$113
;src/main.c:91: }
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
	C$main.c$93$1_0$120	= .
	.globl	C$main.c$93$1_0$120
;src/main.c:93: void update_dng(unsigned char *dng,uint8_t dungeon_width, uint8_t dungeon_hieght){
;	---------------------------------
; Function update_dng
; ---------------------------------
_update_dng::
	ld	c, a
	C$main.c$96$1_0$120	= .
	.globl	C$main.c$96$1_0$120
;src/main.c:96: set_bkg_tiles(0,0,20,13,white_screen);
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
	C$main.c$98$1_0$120	= .
	.globl	C$main.c$98$1_0$120
;src/main.c:98: check_l_walls(dng,dungeon_width,dungeon_hieght,player_x, player_y, player_dir);
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
	C$main.c$99$1_0$120	= .
	.globl	C$main.c$99$1_0$120
;src/main.c:99: check_r_walls(dng,dungeon_width,dungeon_hieght,player_x, player_y, player_dir);
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
	C$main.c$100$1_0$120	= .
	.globl	C$main.c$100$1_0$120
;src/main.c:100: check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y,player_dir);
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
	C$main.c$102$1_0$120	= .
	.globl	C$main.c$102$1_0$120
;src/main.c:102: }
	pop	hl
	inc	sp
	jp	(hl)
	G$collision_check$0$0	= .
	.globl	G$collision_check$0$0
	C$main.c$104$1_0$123	= .
	.globl	C$main.c$104$1_0$123
;src/main.c:104: void collision_check(const unsigned char *dng, uint8_t dng_width, uint8_t dng_height){
;	---------------------------------
; Function collision_check
; ---------------------------------
_collision_check::
	C$main.c$106$1_0$123	= .
	.globl	C$main.c$106$1_0$123
;src/main.c:106: }
	pop	hl
	inc	sp
	jp	(hl)
	G$init_dng_UI$0$0	= .
	.globl	G$init_dng_UI$0$0
	C$main.c$108$1_0$124	= .
	.globl	C$main.c$108$1_0$124
;src/main.c:108: void init_dng_UI(){
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
;../gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 24)
;../gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x90
;../gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 28)
;../gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x1c
	ld	(hl+), a
	ld	(hl), #0x90
;../gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 32)
;../gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x98
;../gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 36)
;../gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x1c
	ld	(hl+), a
	ld	(hl), #0x98
	C$main.c$121$3_0$124	= .
	.globl	C$main.c$121$3_0$124
;src/main.c:121: move_sprite(9,152,28);
	C$main.c$124$3_0$124	= .
	.globl	C$main.c$124$3_0$124
;src/main.c:124: }
	C$main.c$124$3_0$124	= .
	.globl	C$main.c$124$3_0$124
	XG$init_dng_UI$0$0	= .
	.globl	XG$init_dng_UI$0$0
	ret
	G$update_dng_UI$0$0	= .
	.globl	G$update_dng_UI$0$0
	C$main.c$126$3_0$155	= .
	.globl	C$main.c$126$3_0$155
;src/main.c:126: void update_dng_UI (){
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
	C$main.c$132$1_0$155	= .
	.globl	C$main.c$132$1_0$155
;src/main.c:132: switch(player_dir){
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
	C$main.c$133$2_0$156	= .
	.globl	C$main.c$133$2_0$156
;src/main.c:133: case 0:            
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
	C$main.c$140$2_0$156	= .
	.globl	C$main.c$140$2_0$156
;src/main.c:140: break;
	jr	00105$
	C$main.c$142$2_0$156	= .
	.globl	C$main.c$142$2_0$156
;src/main.c:142: case 1:            
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
	C$main.c$149$2_0$156	= .
	.globl	C$main.c$149$2_0$156
;src/main.c:149: break;
	jr	00105$
	C$main.c$151$2_0$156	= .
	.globl	C$main.c$151$2_0$156
;src/main.c:151: case 2:
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
	C$main.c$160$2_0$156	= .
	.globl	C$main.c$160$2_0$156
;src/main.c:160: break;
	jr	00105$
	C$main.c$162$2_0$156	= .
	.globl	C$main.c$162$2_0$156
;src/main.c:162: case 3:
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
	C$main.c$170$1_0$155	= .
	.globl	C$main.c$170$1_0$155
;src/main.c:170: }
00105$:
	C$main.c$173$1_0$155	= .
	.globl	C$main.c$173$1_0$155
;src/main.c:173: switch(player_dir){
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
	jr	00110$
	C$main.c$174$2_0$157	= .
	.globl	C$main.c$174$2_0$157
;src/main.c:174: case 0:            
00106$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0c
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x0a
	C$main.c$177$2_0$157	= .
	.globl	C$main.c$177$2_0$157
;src/main.c:177: break;
	jr	00110$
	C$main.c$179$2_0$157	= .
	.globl	C$main.c$179$2_0$157
;src/main.c:179: case 1:            
00107$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x09
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x0b
	C$main.c$182$2_0$157	= .
	.globl	C$main.c$182$2_0$157
;src/main.c:182: break;
	jr	00110$
	C$main.c$184$2_0$157	= .
	.globl	C$main.c$184$2_0$157
;src/main.c:184: case 2:
00108$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0a
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x0c
	C$main.c$189$2_0$157	= .
	.globl	C$main.c$189$2_0$157
;src/main.c:189: break;
	jr	00110$
	C$main.c$191$2_0$157	= .
	.globl	C$main.c$191$2_0$157
;src/main.c:191: case 3:
00109$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0b
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x09
	C$main.c$195$1_0$155	= .
	.globl	C$main.c$195$1_0$155
;src/main.c:195: }
00110$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x0e
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x0e
;../gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 31)
	ld	(hl), #0x40
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), #0x0d
;../gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 35)
	ld	(hl), #0x20
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x0d
;../gbdk/include/gb/gb.h:1648: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 39)
	ld	(hl), #0x60
	C$main.c$204$3_0$155	= .
	.globl	C$main.c$204$3_0$155
;src/main.c:204: set_sprite_prop(9,S_FLIPX | S_FLIPY);
	C$main.c$207$3_0$155	= .
	.globl	C$main.c$207$3_0$155
;src/main.c:207: }
	C$main.c$207$3_0$155	= .
	.globl	C$main.c$207$3_0$155
	XG$update_dng_UI$0$0	= .
	.globl	XG$update_dng_UI$0$0
	ret
	G$dungeon_logic_upd$0$0	= .
	.globl	G$dungeon_logic_upd$0$0
	C$main.c$209$3_0$287	= .
	.globl	C$main.c$209$3_0$287
;src/main.c:209: void dungeon_logic_upd(){
;	---------------------------------
; Function dungeon_logic_upd
; ---------------------------------
_dungeon_logic_upd::
	C$main.c$210$1_0$287	= .
	.globl	C$main.c$210$1_0$287
;src/main.c:210: joypad_previous = joypad_current;
	ld	a, (#_joypad_current)
	ld	(#_joypad_previous),a
	C$main.c$211$1_0$287	= .
	.globl	C$main.c$211$1_0$287
;src/main.c:211: joypad_current = joypad();
	call	_joypad
	ld	hl, #_joypad_current
	ld	(hl), a
	C$main.c$213$1_0$287	= .
	.globl	C$main.c$213$1_0$287
;src/main.c:213: if((joypad_current & J_LEFT) && !(joypad_previous & J_LEFT)){
	bit	1, (hl)
	jr	Z, 00104$
	ld	a, (#_joypad_previous)
	bit	1, a
	jr	NZ, 00104$
	C$main.c$214$2_0$288	= .
	.globl	C$main.c$214$2_0$288
;src/main.c:214: player_dir--;
	ld	hl, #_player_dir
	dec	(hl)
	C$main.c$215$2_0$288	= .
	.globl	C$main.c$215$2_0$288
;src/main.c:215: if (player_dir==255){
	ld	a, (hl)
	inc	a
	jr	NZ, 00102$
	C$main.c$216$3_0$289	= .
	.globl	C$main.c$216$3_0$289
;src/main.c:216: player_dir = west;
	ld	hl, #_player_dir
	ld	(hl), #0x03
00102$:
	C$main.c$218$2_0$288	= .
	.globl	C$main.c$218$2_0$288
;src/main.c:218: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
00104$:
	C$main.c$222$1_0$287	= .
	.globl	C$main.c$222$1_0$287
;src/main.c:222: if((joypad_current & J_RIGHT) && !(joypad_previous & J_RIGHT)){
	ld	a, (#_joypad_current)
	rrca
	jr	NC, 00109$
	ld	a, (#_joypad_previous)
	rrca
	jr	C, 00109$
	C$main.c$223$2_0$290	= .
	.globl	C$main.c$223$2_0$290
;src/main.c:223: player_dir++;
	ld	hl, #_player_dir
	inc	(hl)
	C$main.c$224$2_0$290	= .
	.globl	C$main.c$224$2_0$290
;src/main.c:224: if(player_dir==4){
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00107$
	C$main.c$225$3_0$291	= .
	.globl	C$main.c$225$3_0$291
;src/main.c:225: player_dir=north;
	ld	hl, #_player_dir
	ld	(hl), #0x00
00107$:
	C$main.c$227$2_0$290	= .
	.globl	C$main.c$227$2_0$290
;src/main.c:227: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
00109$:
	C$main.c$230$1_0$287	= .
	.globl	C$main.c$230$1_0$287
;src/main.c:230: if((joypad_current & J_UP) && !(joypad_previous & J_UP)){
	ld	a, (#_joypad_current)
	bit	2, a
	jp	Z,00129$
	ld	a, (#_joypad_previous)
	bit	2, a
	jp	NZ,00129$
	C$main.c$233$1_0$287	= .
	.globl	C$main.c$233$1_0$287
;src/main.c:233: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
	ld	hl, #_player_y
	ld	c, (hl)
	C$main.c$231$2_0$292	= .
	.globl	C$main.c$231$2_0$292
;src/main.c:231: switch(player_dir){
	ld	a, (#_player_dir)
	or	a, a
	jr	Z, 00111$
	C$main.c$239$1_0$287	= .
	.globl	C$main.c$239$1_0$287
;src/main.c:239: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
	ld	hl, #_player_x
	ld	e, (hl)
	C$main.c$231$2_0$292	= .
	.globl	C$main.c$231$2_0$292
;src/main.c:231: switch(player_dir){
	ld	a, (#_player_dir)
	dec	a
	jr	Z, 00115$
	ld	a,(#_player_dir)
	cp	a,#0x02
	jp	Z,00119$
	sub	a, #0x03
	jp	Z,00123$
	jp	00127$
	C$main.c$232$3_0$293	= .
	.globl	C$main.c$232$3_0$293
;src/main.c:232: case north:
00111$:
	C$main.c$233$3_0$293	= .
	.globl	C$main.c$233$3_0$293
;src/main.c:233: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
	dec	c
	ld	a, c
	push	af
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
	jp	NZ,00127$
00112$:
	C$main.c$234$4_0$294	= .
	.globl	C$main.c$234$4_0$294
;src/main.c:234: player_y--;
	ld	hl, #_player_y
	dec	(hl)
	C$main.c$235$4_0$294	= .
	.globl	C$main.c$235$4_0$294
;src/main.c:235: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$237$3_0$293	= .
	.globl	C$main.c$237$3_0$293
;src/main.c:237: break;
	jp	00127$
	C$main.c$238$3_0$293	= .
	.globl	C$main.c$238$3_0$293
;src/main.c:238: case east:
00115$:
	C$main.c$239$3_0$293	= .
	.globl	C$main.c$239$3_0$293
;src/main.c:239: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
	ld	b, e
	inc	b
	ld	a, (#_player_y)
	push	af
	inc	sp
	ld	c, #0x0f
	push	bc
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
	jp	NZ,00127$
00116$:
	C$main.c$240$4_0$295	= .
	.globl	C$main.c$240$4_0$295
;src/main.c:240: player_x++;
	ld	hl, #_player_x
	inc	(hl)
	C$main.c$241$4_0$295	= .
	.globl	C$main.c$241$4_0$295
;src/main.c:241: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$243$3_0$293	= .
	.globl	C$main.c$243$3_0$293
;src/main.c:243: break;
	jp	00127$
	C$main.c$244$3_0$293	= .
	.globl	C$main.c$244$3_0$293
;src/main.c:244: case south:
00119$:
	C$main.c$245$3_0$293	= .
	.globl	C$main.c$245$3_0$293
;src/main.c:245: if(return_value(test_dungeon,15,15,player_x,player_y+1)==0x00||return_value(test_dungeon,15,15,player_x,player_y+1)==0x01){
	inc	c
	ld	a, c
	push	af
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
	jr	NZ, 00127$
00120$:
	C$main.c$246$4_0$296	= .
	.globl	C$main.c$246$4_0$296
;src/main.c:246: player_y++;
	ld	hl, #_player_y
	inc	(hl)
	C$main.c$247$4_0$296	= .
	.globl	C$main.c$247$4_0$296
;src/main.c:247: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$249$3_0$293	= .
	.globl	C$main.c$249$3_0$293
;src/main.c:249: break;
	jr	00127$
	C$main.c$250$3_0$293	= .
	.globl	C$main.c$250$3_0$293
;src/main.c:250: case west:
00123$:
	C$main.c$251$3_0$293	= .
	.globl	C$main.c$251$3_0$293
;src/main.c:251: if(return_value(test_dungeon,15,15,player_x-1,player_y)==0x00||return_value(test_dungeon,15,15,player_x-1,player_y)==0x01){
	ld	b, e
	dec	b
	ld	a, (#_player_y)
	push	af
	inc	sp
	ld	c, #0x0f
	push	bc
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
	jr	NZ, 00127$
00124$:
	C$main.c$252$4_0$297	= .
	.globl	C$main.c$252$4_0$297
;src/main.c:252: player_x--;
	ld	hl, #_player_x
	dec	(hl)
	C$main.c$253$4_0$297	= .
	.globl	C$main.c$253$4_0$297
;src/main.c:253: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$256$2_0$292	= .
	.globl	C$main.c$256$2_0$292
;src/main.c:256: }
00127$:
	C$main.c$257$2_0$292	= .
	.globl	C$main.c$257$2_0$292
;src/main.c:257: encounter_timer++;
	ld	hl, #_encounter_timer
	inc	(hl)
00129$:
	C$main.c$259$1_0$287	= .
	.globl	C$main.c$259$1_0$287
;src/main.c:259: if((joypad_current & J_DOWN) && !(joypad_previous & J_DOWN)){
	ld	a, (#_joypad_current)
	bit	3, a
	jp	Z,00149$
	ld	a, (#_joypad_previous)
	bit	3, a
	jp	NZ,00149$
	C$main.c$233$1_0$287	= .
	.globl	C$main.c$233$1_0$287
;src/main.c:233: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
	ld	hl, #_player_y
	ld	c, (hl)
	C$main.c$260$2_0$298	= .
	.globl	C$main.c$260$2_0$298
;src/main.c:260: switch(player_dir){
	ld	a, (#_player_dir)
	or	a, a
	jr	Z, 00131$
	C$main.c$239$1_0$287	= .
	.globl	C$main.c$239$1_0$287
;src/main.c:239: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
	ld	hl, #_player_x
	ld	e, (hl)
	C$main.c$260$2_0$298	= .
	.globl	C$main.c$260$2_0$298
;src/main.c:260: switch(player_dir){
	ld	a, (#_player_dir)
	dec	a
	jr	Z, 00135$
	ld	a,(#_player_dir)
	cp	a,#0x02
	jp	Z,00139$
	sub	a, #0x03
	jp	Z,00143$
	jp	00147$
	C$main.c$261$3_0$299	= .
	.globl	C$main.c$261$3_0$299
;src/main.c:261: case north:
00131$:
	C$main.c$262$3_0$299	= .
	.globl	C$main.c$262$3_0$299
;src/main.c:262: if(return_value(test_dungeon,15,15,player_x,player_y+1)==0x00||return_value(test_dungeon,15,15,player_x,player_y+1)==0x01){
	inc	c
	ld	a, c
	push	af
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
	jp	NZ,00147$
00132$:
	C$main.c$263$4_0$300	= .
	.globl	C$main.c$263$4_0$300
;src/main.c:263: player_y++;
	ld	hl, #_player_y
	inc	(hl)
	C$main.c$264$4_0$300	= .
	.globl	C$main.c$264$4_0$300
;src/main.c:264: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$266$3_0$299	= .
	.globl	C$main.c$266$3_0$299
;src/main.c:266: break;
	jp	00147$
	C$main.c$267$3_0$299	= .
	.globl	C$main.c$267$3_0$299
;src/main.c:267: case east:
00135$:
	C$main.c$268$3_0$299	= .
	.globl	C$main.c$268$3_0$299
;src/main.c:268: if(return_value(test_dungeon,15,15,player_x-1,player_y)==0x00||return_value(test_dungeon,15,15,player_x-1,player_y)==0x01){
	ld	b, e
	dec	b
	ld	a, (#_player_y)
	push	af
	inc	sp
	ld	c, #0x0f
	push	bc
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
	jp	NZ,00147$
00136$:
	C$main.c$269$4_0$301	= .
	.globl	C$main.c$269$4_0$301
;src/main.c:269: player_x--;
	ld	hl, #_player_x
	dec	(hl)
	C$main.c$270$4_0$301	= .
	.globl	C$main.c$270$4_0$301
;src/main.c:270: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$272$3_0$299	= .
	.globl	C$main.c$272$3_0$299
;src/main.c:272: break;
	jp	00147$
	C$main.c$273$3_0$299	= .
	.globl	C$main.c$273$3_0$299
;src/main.c:273: case south:
00139$:
	C$main.c$274$3_0$299	= .
	.globl	C$main.c$274$3_0$299
;src/main.c:274: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
	dec	c
	ld	a, c
	push	af
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
	jr	NZ, 00147$
00140$:
	C$main.c$275$4_0$302	= .
	.globl	C$main.c$275$4_0$302
;src/main.c:275: player_y--;
	ld	hl, #_player_y
	dec	(hl)
	C$main.c$276$4_0$302	= .
	.globl	C$main.c$276$4_0$302
;src/main.c:276: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$278$3_0$299	= .
	.globl	C$main.c$278$3_0$299
;src/main.c:278: break;
	jr	00147$
	C$main.c$279$3_0$299	= .
	.globl	C$main.c$279$3_0$299
;src/main.c:279: case west:
00143$:
	C$main.c$280$3_0$299	= .
	.globl	C$main.c$280$3_0$299
;src/main.c:280: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
	ld	b, e
	inc	b
	ld	a, (#_player_y)
	push	af
	inc	sp
	ld	c, #0x0f
	push	bc
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
	jr	NZ, 00147$
00144$:
	C$main.c$281$4_0$303	= .
	.globl	C$main.c$281$4_0$303
;src/main.c:281: player_x++;
	ld	hl, #_player_x
	inc	(hl)
	C$main.c$282$4_0$303	= .
	.globl	C$main.c$282$4_0$303
;src/main.c:282: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$285$2_0$298	= .
	.globl	C$main.c$285$2_0$298
;src/main.c:285: }
00147$:
	C$main.c$286$2_0$298	= .
	.globl	C$main.c$286$2_0$298
;src/main.c:286: encounter_timer++;
	ld	hl, #_encounter_timer
	inc	(hl)
00149$:
	C$main.c$288$1_0$287	= .
	.globl	C$main.c$288$1_0$287
;src/main.c:288: if(encounter_counter==encounter_timer){
	ld	a, (#_encounter_counter)
	ld	hl, #_encounter_timer
	sub	a, (hl)
	ret	NZ
	C$main.c$289$2_0$304	= .
	.globl	C$main.c$289$2_0$304
;src/main.c:289: global_state = 2;
	ld	hl, #_global_state
	ld	(hl), #0x02
	C$main.c$291$1_0$287	= .
	.globl	C$main.c$291$1_0$287
;src/main.c:291: }
	C$main.c$291$1_0$287	= .
	.globl	C$main.c$291$1_0$287
	XG$dungeon_logic_upd$0$0	= .
	.globl	XG$dungeon_logic_upd$0$0
	ret
	G$state_switcher$0$0	= .
	.globl	G$state_switcher$0$0
	C$main.c$293$1_0$306	= .
	.globl	C$main.c$293$1_0$306
;src/main.c:293: void state_switcher(uint8_t t){
;	---------------------------------
; Function state_switcher
; ---------------------------------
_state_switcher::
	ld	c, a
	C$main.c$294$1_0$306	= .
	.globl	C$main.c$294$1_0$306
;src/main.c:294: switch(t){
	ld	a, #0x05
	sub	a, c
	ret	C
	ld	b, #0x00
	ld	hl, #00115$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00115$:
	C$main.c$323$1_0$306	= .
	.globl	C$main.c$323$1_0$306
;src/main.c:323: }
	C$main.c$324$1_0$306	= .
	.globl	C$main.c$324$1_0$306
;src/main.c:324: }
	C$main.c$324$1_0$306	= .
	.globl	C$main.c$324$1_0$306
	XG$state_switcher$0$0	= .
	.globl	XG$state_switcher$0$0
	ret
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$326$1_0$309	= .
	.globl	C$main.c$326$1_0$309
;src/main.c:326: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$328$1_0$309	= .
	.globl	C$main.c$328$1_0$309
;src/main.c:328: init_dungeon(test_dungeon, 15, 15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_init_dungeon
	C$main.c$329$1_0$309	= .
	.globl	C$main.c$329$1_0$309
;src/main.c:329: init_dng_UI();
	call	_init_dng_UI
	C$main.c$330$1_0$309	= .
	.globl	C$main.c$330$1_0$309
;src/main.c:330: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$331$1_0$309	= .
	.globl	C$main.c$331$1_0$309
;src/main.c:331: set_sprite_data(0,26,UI_tiles);
	ld	de, #_UI_tiles
	push	de
	ld	hl, #0x1a00
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$339$1_0$309	= .
	.globl	C$main.c$339$1_0$309
;src/main.c:339: state_switcher(2);
	ld	a, #0x02
	call	_state_switcher
	C$main.c$342$1_0$309	= .
	.globl	C$main.c$342$1_0$309
;src/main.c:342: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
	C$main.c$344$1_0$309	= .
	.globl	C$main.c$344$1_0$309
;src/main.c:344: while(1) {
00102$:
	C$main.c$347$2_0$310	= .
	.globl	C$main.c$347$2_0$310
;src/main.c:347: dungeon_logic_upd();
	call	_dungeon_logic_upd
	C$main.c$348$2_0$310	= .
	.globl	C$main.c$348$2_0$310
;src/main.c:348: update_dng_UI();
	call	_update_dng_UI
	C$main.c$360$2_0$310	= .
	.globl	C$main.c$360$2_0$310
;src/main.c:360: wait_vbl_done();
	call	_wait_vbl_done
	C$main.c$362$1_0$309	= .
	.globl	C$main.c$362$1_0$309
;src/main.c:362: }
	C$main.c$362$1_0$309	= .
	.globl	C$main.c$362$1_0$309
	XG$main$0$0	= .
	.globl	XG$main$0$0
	jr	00102$
	.area _CODE
	.area _INITIALIZER
Fmain$__xinit_global_state$0_0$0 == .
__xinit__global_state:
	.db #0x01	; 1
Fmain$__xinit_encounter_counter$0_0$0 == .
__xinit__encounter_counter:
	.db #0x00	; 0
Fmain$__xinit_encounter_timer$0_0$0 == .
__xinit__encounter_timer:
	.db #0x00	; 0
Fmain$__xinit_player_x$0_0$0 == .
__xinit__player_x:
	.db #0x00	; 0
Fmain$__xinit_player_y$0_0$0 == .
__xinit__player_y:
	.db #0x00	; 0
Fmain$__xinit_p_str$0_0$0 == .
__xinit__p_str:
	.db #0x00	; 0
Fmain$__xinit_p_int$0_0$0 == .
__xinit__p_int:
	.db #0x00	; 0
Fmain$__xinit_p_agi$0_0$0 == .
__xinit__p_agi:
	.db #0x00	; 0
Fmain$__xinit_p_con$0_0$0 == .
__xinit__p_con:
	.db #0x00	; 0
Fmain$__xinit_p_luk$0_0$0 == .
__xinit__p_luk:
	.db #0x00	; 0
Fmain$__xinit_inventory$0_0$0 == .
__xinit__inventory:
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
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
