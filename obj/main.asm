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
	.globl _load_enemy
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
	C$main.c$71$0_0$114	= .
	.globl	C$main.c$71$0_0$114
;src/main.c:71: void init_dungeon(const unsigned char *dng,uint8_t dng_width, uint8_t dng_height) {
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
	C$main.c$73$1_0$114	= .
	.globl	C$main.c$73$1_0$114
;src/main.c:73: initrand(sys_time);
	ld	hl, #_sys_time
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_initrand
	pop	hl
	C$main.c$74$1_0$114	= .
	.globl	C$main.c$74$1_0$114
;src/main.c:74: encounter_counter = rand() % 15 + 5;
	call	_rand
	ld	d, #0x00
	ld	bc, #0x000f
	call	__modsint
	ld	a, c
	add	a, #0x05
	ld	(#_encounter_counter),a
	C$main.c$75$1_0$114	= .
	.globl	C$main.c$75$1_0$114
;src/main.c:75: encounter_timer = 0;// increments with every move throught the dungeon. Then it equales to encounteer_counter battle starts
	ld	hl, #_encounter_timer
	ld	(hl), #0x00
	C$main.c$78$1_0$114	= .
	.globl	C$main.c$78$1_0$114
;src/main.c:78: set_bkg_data(0,75,dng_tileset);
	ld	de, #_dng_tileset
	push	de
	ld	hl, #0x4b00
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$main.c$79$1_0$114	= .
	.globl	C$main.c$79$1_0$114
;src/main.c:79: set_sprite_data(0,25,UI_tiles);
	ld	de, #_UI_tiles
	push	de
	ld	hl, #0x1900
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$82$1_0$114	= .
	.globl	C$main.c$82$1_0$114
;src/main.c:82: for(uint8_t i = 0; i < dng_width; i++){
	ld	c, #0x00
00109$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00104$
	C$main.c$83$1_0$114	= .
	.globl	C$main.c$83$1_0$114
;src/main.c:83: for(uint8_t j = 0; j < dng_height; j++){
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
	C$main.c$84$5_0$118	= .
	.globl	C$main.c$84$5_0$118
;src/main.c:84: if(dng[i*dng_width+j]==0x01){
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
	C$main.c$85$6_0$119	= .
	.globl	C$main.c$85$6_0$119
;src/main.c:85: player_x = j;
	ld	hl, #_player_x
	ld	(hl), b
	C$main.c$86$6_0$119	= .
	.globl	C$main.c$86$6_0$119
;src/main.c:86: player_y = i;
	ld	hl, #_player_y
	ld	(hl), c
00107$:
	C$main.c$83$4_0$117	= .
	.globl	C$main.c$83$4_0$117
;src/main.c:83: for(uint8_t j = 0; j < dng_height; j++){
	inc	b
	jr	00106$
00110$:
	C$main.c$82$2_0$115	= .
	.globl	C$main.c$82$2_0$115
;src/main.c:82: for(uint8_t i = 0; i < dng_width; i++){
	inc	c
	jr	00109$
00104$:
	C$main.c$90$1_0$114	= .
	.globl	C$main.c$90$1_0$114
;src/main.c:90: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	C$main.c$92$1_0$114	= .
	.globl	C$main.c$92$1_0$114
;src/main.c:92: }
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
	C$main.c$94$1_0$121	= .
	.globl	C$main.c$94$1_0$121
;src/main.c:94: void update_dng(unsigned char *dng,uint8_t dungeon_width, uint8_t dungeon_hieght){
;	---------------------------------
; Function update_dng
; ---------------------------------
_update_dng::
	ld	c, a
	C$main.c$97$1_0$121	= .
	.globl	C$main.c$97$1_0$121
;src/main.c:97: set_bkg_tiles(0,0,20,13,white_screen);
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
	C$main.c$99$1_0$121	= .
	.globl	C$main.c$99$1_0$121
;src/main.c:99: check_l_walls(dng,dungeon_width,dungeon_hieght,player_x, player_y, player_dir);
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
	C$main.c$100$1_0$121	= .
	.globl	C$main.c$100$1_0$121
;src/main.c:100: check_r_walls(dng,dungeon_width,dungeon_hieght,player_x, player_y, player_dir);
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
	C$main.c$101$1_0$121	= .
	.globl	C$main.c$101$1_0$121
;src/main.c:101: check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y,player_dir);
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
	C$main.c$103$1_0$121	= .
	.globl	C$main.c$103$1_0$121
;src/main.c:103: }
	pop	hl
	inc	sp
	jp	(hl)
	G$collision_check$0$0	= .
	.globl	G$collision_check$0$0
	C$main.c$105$1_0$124	= .
	.globl	C$main.c$105$1_0$124
;src/main.c:105: void collision_check(const unsigned char *dng, uint8_t dng_width, uint8_t dng_height){
;	---------------------------------
; Function collision_check
; ---------------------------------
_collision_check::
	C$main.c$107$1_0$124	= .
	.globl	C$main.c$107$1_0$124
;src/main.c:107: }
	pop	hl
	inc	sp
	jp	(hl)
	G$init_dng_UI$0$0	= .
	.globl	G$init_dng_UI$0$0
	C$main.c$109$1_0$125	= .
	.globl	C$main.c$109$1_0$125
;src/main.c:109: void init_dng_UI(){
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
	C$main.c$122$3_0$125	= .
	.globl	C$main.c$122$3_0$125
;src/main.c:122: move_sprite(9,152,28);
	C$main.c$125$3_0$125	= .
	.globl	C$main.c$125$3_0$125
;src/main.c:125: }
	C$main.c$125$3_0$125	= .
	.globl	C$main.c$125$3_0$125
	XG$init_dng_UI$0$0	= .
	.globl	XG$init_dng_UI$0$0
	ret
	G$update_dng_UI$0$0	= .
	.globl	G$update_dng_UI$0$0
	C$main.c$127$3_0$156	= .
	.globl	C$main.c$127$3_0$156
;src/main.c:127: void update_dng_UI (){
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
	C$main.c$133$1_0$156	= .
	.globl	C$main.c$133$1_0$156
;src/main.c:133: switch(player_dir){
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
	C$main.c$134$2_0$157	= .
	.globl	C$main.c$134$2_0$157
;src/main.c:134: case 0:            
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
	C$main.c$141$2_0$157	= .
	.globl	C$main.c$141$2_0$157
;src/main.c:141: break;
	jr	00105$
	C$main.c$143$2_0$157	= .
	.globl	C$main.c$143$2_0$157
;src/main.c:143: case 1:            
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
	C$main.c$150$2_0$157	= .
	.globl	C$main.c$150$2_0$157
;src/main.c:150: break;
	jr	00105$
	C$main.c$152$2_0$157	= .
	.globl	C$main.c$152$2_0$157
;src/main.c:152: case 2:
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
	C$main.c$161$2_0$157	= .
	.globl	C$main.c$161$2_0$157
;src/main.c:161: break;
	jr	00105$
	C$main.c$163$2_0$157	= .
	.globl	C$main.c$163$2_0$157
;src/main.c:163: case 3:
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
	C$main.c$171$1_0$156	= .
	.globl	C$main.c$171$1_0$156
;src/main.c:171: }
00105$:
	C$main.c$174$1_0$156	= .
	.globl	C$main.c$174$1_0$156
;src/main.c:174: switch(player_dir){
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
	C$main.c$175$2_0$158	= .
	.globl	C$main.c$175$2_0$158
;src/main.c:175: case 0:            
00106$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0c
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x0a
	C$main.c$178$2_0$158	= .
	.globl	C$main.c$178$2_0$158
;src/main.c:178: break;
	jr	00110$
	C$main.c$180$2_0$158	= .
	.globl	C$main.c$180$2_0$158
;src/main.c:180: case 1:            
00107$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x09
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x0b
	C$main.c$183$2_0$158	= .
	.globl	C$main.c$183$2_0$158
;src/main.c:183: break;
	jr	00110$
	C$main.c$185$2_0$158	= .
	.globl	C$main.c$185$2_0$158
;src/main.c:185: case 2:
00108$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0a
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x0c
	C$main.c$190$2_0$158	= .
	.globl	C$main.c$190$2_0$158
;src/main.c:190: break;
	jr	00110$
	C$main.c$192$2_0$158	= .
	.globl	C$main.c$192$2_0$158
;src/main.c:192: case 3:
00109$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0b
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x09
	C$main.c$196$1_0$156	= .
	.globl	C$main.c$196$1_0$156
;src/main.c:196: }
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
	C$main.c$205$3_0$156	= .
	.globl	C$main.c$205$3_0$156
;src/main.c:205: set_sprite_prop(9,S_FLIPX | S_FLIPY);
	C$main.c$208$3_0$156	= .
	.globl	C$main.c$208$3_0$156
;src/main.c:208: }
	C$main.c$208$3_0$156	= .
	.globl	C$main.c$208$3_0$156
	XG$update_dng_UI$0$0	= .
	.globl	XG$update_dng_UI$0$0
	ret
	G$dungeon_logic_upd$0$0	= .
	.globl	G$dungeon_logic_upd$0$0
	C$main.c$210$3_0$288	= .
	.globl	C$main.c$210$3_0$288
;src/main.c:210: void dungeon_logic_upd(){
;	---------------------------------
; Function dungeon_logic_upd
; ---------------------------------
_dungeon_logic_upd::
	C$main.c$211$1_0$288	= .
	.globl	C$main.c$211$1_0$288
;src/main.c:211: joypad_previous = joypad_current;
	ld	a, (#_joypad_current)
	ld	(#_joypad_previous),a
	C$main.c$212$1_0$288	= .
	.globl	C$main.c$212$1_0$288
;src/main.c:212: joypad_current = joypad();
	call	_joypad
	ld	hl, #_joypad_current
	ld	(hl), a
	C$main.c$214$1_0$288	= .
	.globl	C$main.c$214$1_0$288
;src/main.c:214: if((joypad_current & J_LEFT) && !(joypad_previous & J_LEFT)){
	bit	1, (hl)
	jr	Z, 00104$
	ld	a, (#_joypad_previous)
	bit	1, a
	jr	NZ, 00104$
	C$main.c$215$2_0$289	= .
	.globl	C$main.c$215$2_0$289
;src/main.c:215: player_dir--;
	ld	hl, #_player_dir
	dec	(hl)
	C$main.c$216$2_0$289	= .
	.globl	C$main.c$216$2_0$289
;src/main.c:216: if (player_dir==255){
	ld	a, (hl)
	inc	a
	jr	NZ, 00102$
	C$main.c$217$3_0$290	= .
	.globl	C$main.c$217$3_0$290
;src/main.c:217: player_dir = west;
	ld	hl, #_player_dir
	ld	(hl), #0x03
00102$:
	C$main.c$219$2_0$289	= .
	.globl	C$main.c$219$2_0$289
;src/main.c:219: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
00104$:
	C$main.c$223$1_0$288	= .
	.globl	C$main.c$223$1_0$288
;src/main.c:223: if((joypad_current & J_RIGHT) && !(joypad_previous & J_RIGHT)){
	ld	a, (#_joypad_current)
	rrca
	jr	NC, 00109$
	ld	a, (#_joypad_previous)
	rrca
	jr	C, 00109$
	C$main.c$224$2_0$291	= .
	.globl	C$main.c$224$2_0$291
;src/main.c:224: player_dir++;
	ld	hl, #_player_dir
	inc	(hl)
	C$main.c$225$2_0$291	= .
	.globl	C$main.c$225$2_0$291
;src/main.c:225: if(player_dir==4){
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00107$
	C$main.c$226$3_0$292	= .
	.globl	C$main.c$226$3_0$292
;src/main.c:226: player_dir=north;
	ld	hl, #_player_dir
	ld	(hl), #0x00
00107$:
	C$main.c$228$2_0$291	= .
	.globl	C$main.c$228$2_0$291
;src/main.c:228: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
00109$:
	C$main.c$231$1_0$288	= .
	.globl	C$main.c$231$1_0$288
;src/main.c:231: if((joypad_current & J_UP) && !(joypad_previous & J_UP)){
	ld	a, (#_joypad_current)
	bit	2, a
	jp	Z,00129$
	ld	a, (#_joypad_previous)
	bit	2, a
	jp	NZ,00129$
	C$main.c$234$1_0$288	= .
	.globl	C$main.c$234$1_0$288
;src/main.c:234: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
	ld	hl, #_player_y
	ld	c, (hl)
	C$main.c$232$2_0$293	= .
	.globl	C$main.c$232$2_0$293
;src/main.c:232: switch(player_dir){
	ld	a, (#_player_dir)
	or	a, a
	jr	Z, 00111$
	C$main.c$240$1_0$288	= .
	.globl	C$main.c$240$1_0$288
;src/main.c:240: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
	ld	hl, #_player_x
	ld	e, (hl)
	C$main.c$232$2_0$293	= .
	.globl	C$main.c$232$2_0$293
;src/main.c:232: switch(player_dir){
	ld	a, (#_player_dir)
	dec	a
	jr	Z, 00115$
	ld	a,(#_player_dir)
	cp	a,#0x02
	jp	Z,00119$
	sub	a, #0x03
	jp	Z,00123$
	jp	00127$
	C$main.c$233$3_0$294	= .
	.globl	C$main.c$233$3_0$294
;src/main.c:233: case north:
00111$:
	C$main.c$234$3_0$294	= .
	.globl	C$main.c$234$3_0$294
;src/main.c:234: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
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
	C$main.c$235$4_0$295	= .
	.globl	C$main.c$235$4_0$295
;src/main.c:235: player_y--;
	ld	hl, #_player_y
	dec	(hl)
	C$main.c$236$4_0$295	= .
	.globl	C$main.c$236$4_0$295
;src/main.c:236: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$238$3_0$294	= .
	.globl	C$main.c$238$3_0$294
;src/main.c:238: break;
	jp	00127$
	C$main.c$239$3_0$294	= .
	.globl	C$main.c$239$3_0$294
;src/main.c:239: case east:
00115$:
	C$main.c$240$3_0$294	= .
	.globl	C$main.c$240$3_0$294
;src/main.c:240: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
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
	C$main.c$241$4_0$296	= .
	.globl	C$main.c$241$4_0$296
;src/main.c:241: player_x++;
	ld	hl, #_player_x
	inc	(hl)
	C$main.c$242$4_0$296	= .
	.globl	C$main.c$242$4_0$296
;src/main.c:242: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$244$3_0$294	= .
	.globl	C$main.c$244$3_0$294
;src/main.c:244: break;
	jp	00127$
	C$main.c$245$3_0$294	= .
	.globl	C$main.c$245$3_0$294
;src/main.c:245: case south:
00119$:
	C$main.c$246$3_0$294	= .
	.globl	C$main.c$246$3_0$294
;src/main.c:246: if(return_value(test_dungeon,15,15,player_x,player_y+1)==0x00||return_value(test_dungeon,15,15,player_x,player_y+1)==0x01){
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
	C$main.c$247$4_0$297	= .
	.globl	C$main.c$247$4_0$297
;src/main.c:247: player_y++;
	ld	hl, #_player_y
	inc	(hl)
	C$main.c$248$4_0$297	= .
	.globl	C$main.c$248$4_0$297
;src/main.c:248: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$250$3_0$294	= .
	.globl	C$main.c$250$3_0$294
;src/main.c:250: break;
	jr	00127$
	C$main.c$251$3_0$294	= .
	.globl	C$main.c$251$3_0$294
;src/main.c:251: case west:
00123$:
	C$main.c$252$3_0$294	= .
	.globl	C$main.c$252$3_0$294
;src/main.c:252: if(return_value(test_dungeon,15,15,player_x-1,player_y)==0x00||return_value(test_dungeon,15,15,player_x-1,player_y)==0x01){
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
	C$main.c$253$4_0$298	= .
	.globl	C$main.c$253$4_0$298
;src/main.c:253: player_x--;
	ld	hl, #_player_x
	dec	(hl)
	C$main.c$254$4_0$298	= .
	.globl	C$main.c$254$4_0$298
;src/main.c:254: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$257$2_0$293	= .
	.globl	C$main.c$257$2_0$293
;src/main.c:257: }
00127$:
	C$main.c$258$2_0$293	= .
	.globl	C$main.c$258$2_0$293
;src/main.c:258: encounter_timer++;
	ld	hl, #_encounter_timer
	inc	(hl)
00129$:
	C$main.c$260$1_0$288	= .
	.globl	C$main.c$260$1_0$288
;src/main.c:260: if((joypad_current & J_DOWN) && !(joypad_previous & J_DOWN)){
	ld	a, (#_joypad_current)
	bit	3, a
	jp	Z,00149$
	ld	a, (#_joypad_previous)
	bit	3, a
	jp	NZ,00149$
	C$main.c$234$1_0$288	= .
	.globl	C$main.c$234$1_0$288
;src/main.c:234: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
	ld	hl, #_player_y
	ld	c, (hl)
	C$main.c$261$2_0$299	= .
	.globl	C$main.c$261$2_0$299
;src/main.c:261: switch(player_dir){
	ld	a, (#_player_dir)
	or	a, a
	jr	Z, 00131$
	C$main.c$240$1_0$288	= .
	.globl	C$main.c$240$1_0$288
;src/main.c:240: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
	ld	hl, #_player_x
	ld	e, (hl)
	C$main.c$261$2_0$299	= .
	.globl	C$main.c$261$2_0$299
;src/main.c:261: switch(player_dir){
	ld	a, (#_player_dir)
	dec	a
	jr	Z, 00135$
	ld	a,(#_player_dir)
	cp	a,#0x02
	jp	Z,00139$
	sub	a, #0x03
	jp	Z,00143$
	jp	00147$
	C$main.c$262$3_0$300	= .
	.globl	C$main.c$262$3_0$300
;src/main.c:262: case north:
00131$:
	C$main.c$263$3_0$300	= .
	.globl	C$main.c$263$3_0$300
;src/main.c:263: if(return_value(test_dungeon,15,15,player_x,player_y+1)==0x00||return_value(test_dungeon,15,15,player_x,player_y+1)==0x01){
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
	C$main.c$264$4_0$301	= .
	.globl	C$main.c$264$4_0$301
;src/main.c:264: player_y++;
	ld	hl, #_player_y
	inc	(hl)
	C$main.c$265$4_0$301	= .
	.globl	C$main.c$265$4_0$301
;src/main.c:265: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$267$3_0$300	= .
	.globl	C$main.c$267$3_0$300
;src/main.c:267: break;
	jp	00147$
	C$main.c$268$3_0$300	= .
	.globl	C$main.c$268$3_0$300
;src/main.c:268: case east:
00135$:
	C$main.c$269$3_0$300	= .
	.globl	C$main.c$269$3_0$300
;src/main.c:269: if(return_value(test_dungeon,15,15,player_x-1,player_y)==0x00||return_value(test_dungeon,15,15,player_x-1,player_y)==0x01){
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
	C$main.c$270$4_0$302	= .
	.globl	C$main.c$270$4_0$302
;src/main.c:270: player_x--;
	ld	hl, #_player_x
	dec	(hl)
	C$main.c$271$4_0$302	= .
	.globl	C$main.c$271$4_0$302
;src/main.c:271: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$273$3_0$300	= .
	.globl	C$main.c$273$3_0$300
;src/main.c:273: break;
	jp	00147$
	C$main.c$274$3_0$300	= .
	.globl	C$main.c$274$3_0$300
;src/main.c:274: case south:
00139$:
	C$main.c$275$3_0$300	= .
	.globl	C$main.c$275$3_0$300
;src/main.c:275: if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
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
	C$main.c$276$4_0$303	= .
	.globl	C$main.c$276$4_0$303
;src/main.c:276: player_y--;
	ld	hl, #_player_y
	dec	(hl)
	C$main.c$277$4_0$303	= .
	.globl	C$main.c$277$4_0$303
;src/main.c:277: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$279$3_0$300	= .
	.globl	C$main.c$279$3_0$300
;src/main.c:279: break;
	jr	00147$
	C$main.c$280$3_0$300	= .
	.globl	C$main.c$280$3_0$300
;src/main.c:280: case west:
00143$:
	C$main.c$281$3_0$300	= .
	.globl	C$main.c$281$3_0$300
;src/main.c:281: if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
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
	C$main.c$282$4_0$304	= .
	.globl	C$main.c$282$4_0$304
;src/main.c:282: player_x++;
	ld	hl, #_player_x
	inc	(hl)
	C$main.c$283$4_0$304	= .
	.globl	C$main.c$283$4_0$304
;src/main.c:283: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$286$2_0$299	= .
	.globl	C$main.c$286$2_0$299
;src/main.c:286: }
00147$:
	C$main.c$287$2_0$299	= .
	.globl	C$main.c$287$2_0$299
;src/main.c:287: encounter_timer++;
	ld	hl, #_encounter_timer
	inc	(hl)
00149$:
	C$main.c$289$1_0$288	= .
	.globl	C$main.c$289$1_0$288
;src/main.c:289: if(encounter_counter==encounter_timer){
	ld	a, (#_encounter_counter)
	ld	hl, #_encounter_timer
	sub	a, (hl)
	ret	NZ
	C$main.c$290$2_0$305	= .
	.globl	C$main.c$290$2_0$305
;src/main.c:290: global_state = 2;
	ld	hl, #_global_state
	ld	(hl), #0x02
	C$main.c$292$1_0$288	= .
	.globl	C$main.c$292$1_0$288
;src/main.c:292: }
	C$main.c$292$1_0$288	= .
	.globl	C$main.c$292$1_0$288
	XG$dungeon_logic_upd$0$0	= .
	.globl	XG$dungeon_logic_upd$0$0
	ret
	G$state_switcher$0$0	= .
	.globl	G$state_switcher$0$0
	C$main.c$294$1_0$307	= .
	.globl	C$main.c$294$1_0$307
;src/main.c:294: void state_switcher(uint8_t t){
;	---------------------------------
; Function state_switcher
; ---------------------------------
_state_switcher::
	ld	c, a
	C$main.c$295$1_0$307	= .
	.globl	C$main.c$295$1_0$307
;src/main.c:295: switch(t){
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
	C$main.c$324$1_0$307	= .
	.globl	C$main.c$324$1_0$307
;src/main.c:324: }
	C$main.c$325$1_0$307	= .
	.globl	C$main.c$325$1_0$307
;src/main.c:325: }
	C$main.c$325$1_0$307	= .
	.globl	C$main.c$325$1_0$307
	XG$state_switcher$0$0	= .
	.globl	XG$state_switcher$0$0
	ret
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$327$1_0$310	= .
	.globl	C$main.c$327$1_0$310
;src/main.c:327: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$329$1_0$310	= .
	.globl	C$main.c$329$1_0$310
;src/main.c:329: init_dungeon(test_dungeon, 15, 15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_init_dungeon
	C$main.c$331$1_0$310	= .
	.globl	C$main.c$331$1_0$310
;src/main.c:331: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$333$1_0$310	= .
	.globl	C$main.c$333$1_0$310
;src/main.c:333: load_enemy(0,0);
	xor	a, a
	ld	e, a
	call	_load_enemy
	C$main.c$334$1_0$310	= .
	.globl	C$main.c$334$1_0$310
;src/main.c:334: load_enemy(1,1);
	ld	a,#0x01
	ld	e,a
	call	_load_enemy
	C$main.c$335$1_0$310	= .
	.globl	C$main.c$335$1_0$310
;src/main.c:335: load_enemy(0,2);
	ld	e, #0x02
	xor	a, a
	call	_load_enemy
	C$main.c$347$1_0$310	= .
	.globl	C$main.c$347$1_0$310
;src/main.c:347: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
	C$main.c$349$1_0$310	= .
	.globl	C$main.c$349$1_0$310
;src/main.c:349: while(1) {
00102$:
	C$main.c$352$2_0$311	= .
	.globl	C$main.c$352$2_0$311
;src/main.c:352: dungeon_logic_upd();
	call	_dungeon_logic_upd
	C$main.c$365$2_0$311	= .
	.globl	C$main.c$365$2_0$311
;src/main.c:365: wait_vbl_done();
	call	_wait_vbl_done
	C$main.c$367$1_0$310	= .
	.globl	C$main.c$367$1_0$310
;src/main.c:367: }
	C$main.c$367$1_0$310	= .
	.globl	C$main.c$367$1_0$310
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
