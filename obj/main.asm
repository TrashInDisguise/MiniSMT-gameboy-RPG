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
	.globl _update_dng
	.globl _init_dungeon
	.globl _combat_view_upd
	.globl _init_combat
	.globl _unload_enemy
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
	.globl _sl3
	.globl _sl2
	.globl _sl1
	.globl _test_dungeon
	.globl _white_screen
	.globl _state_switcher
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$sl1$0_0$0==.
_sl1::
	.ds 21
G$sl2$0_0$0==.
_sl2::
	.ds 21
G$sl3$0_0$0==.
_sl3::
	.ds 21
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
Fmain$dng_w$0_0$0==.
_dng_w:
	.ds 1
Fmain$dng_h$0_0$0==.
_dng_h:
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
	C$main.c$80$0_0$118	= .
	.globl	C$main.c$80$0_0$118
;src/main.c:80: void init_dungeon(const unsigned char *dng,uint8_t dng_width, uint8_t dng_height) {
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
	C$main.c$82$1_0$118	= .
	.globl	C$main.c$82$1_0$118
;src/main.c:82: initrand(sys_time);
	ld	hl, #_sys_time
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_initrand
	pop	hl
	C$main.c$83$1_0$118	= .
	.globl	C$main.c$83$1_0$118
;src/main.c:83: encounter_counter = rand() % 15 + 5;
	call	_rand
	ld	d, #0x00
	ld	bc, #0x000f
	call	__modsint
	ld	a, c
	add	a, #0x05
	ld	(#_encounter_counter),a
	C$main.c$84$1_0$118	= .
	.globl	C$main.c$84$1_0$118
;src/main.c:84: encounter_timer = 0;// increments with every move throught the dungeon. Then it equales to encounteer_counter battle starts
	ld	hl, #_encounter_timer
	ld	(hl), #0x00
	C$main.c$87$1_0$118	= .
	.globl	C$main.c$87$1_0$118
;src/main.c:87: set_bkg_data(0,75,dng_tileset);
	ld	de, #_dng_tileset
	push	de
	ld	hl, #0x4b00
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$main.c$88$1_0$118	= .
	.globl	C$main.c$88$1_0$118
;src/main.c:88: set_sprite_data(0,25,UI_tiles);
	ld	de, #_UI_tiles
	push	de
	ld	hl, #0x1900
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$main.c$91$1_0$118	= .
	.globl	C$main.c$91$1_0$118
;src/main.c:91: if(player_x==0&&player_y==0){
	ld	a, (#_player_x)
	or	a, a
	jr	NZ, 00106$
	ld	a, (#_player_y)
	C$main.c$92$1_0$118	= .
	.globl	C$main.c$92$1_0$118
;src/main.c:92: for(uint8_t i = 0; i < dng_width; i++){
	or	a,a
	jr	NZ, 00106$
	ld	c,a
00112$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00106$
	C$main.c$93$1_0$118	= .
	.globl	C$main.c$93$1_0$118
;src/main.c:93: for(uint8_t j = 0; j < dng_height; j++){
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
00109$:
	ld	a, b
	ldhl	sp,	#7
	sub	a, (hl)
	jr	NC, 00113$
	C$main.c$94$6_0$123	= .
	.globl	C$main.c$94$6_0$123
;src/main.c:94: if(dng[i*dng_width+j]==0x01){
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
	jr	NZ, 00110$
	C$main.c$95$7_0$124	= .
	.globl	C$main.c$95$7_0$124
;src/main.c:95: player_x = j;
	ld	hl, #_player_x
	ld	(hl), b
	C$main.c$96$7_0$124	= .
	.globl	C$main.c$96$7_0$124
;src/main.c:96: player_y = i;
	ld	hl, #_player_y
	ld	(hl), c
00110$:
	C$main.c$93$5_0$122	= .
	.globl	C$main.c$93$5_0$122
;src/main.c:93: for(uint8_t j = 0; j < dng_height; j++){
	inc	b
	jr	00109$
00113$:
	C$main.c$92$3_0$120	= .
	.globl	C$main.c$92$3_0$120
;src/main.c:92: for(uint8_t i = 0; i < dng_width; i++){
	inc	c
	jr	00112$
00106$:
	C$main.c$101$1_0$118	= .
	.globl	C$main.c$101$1_0$118
;src/main.c:101: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	C$main.c$103$1_0$118	= .
	.globl	C$main.c$103$1_0$118
;src/main.c:103: }
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
	C$main.c$105$1_0$126	= .
	.globl	C$main.c$105$1_0$126
;src/main.c:105: void update_dng(unsigned char *dng,uint8_t dungeon_width, uint8_t dungeon_hieght){
;	---------------------------------
; Function update_dng
; ---------------------------------
_update_dng::
	ld	c, a
	C$main.c$106$1_0$126	= .
	.globl	C$main.c$106$1_0$126
;src/main.c:106: set_bkg_tiles(0,0,20,13,white_screen);
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
	C$main.c$108$1_0$126	= .
	.globl	C$main.c$108$1_0$126
;src/main.c:108: check_l_walls(dng, dungeon_width, dungeon_hieght, player_x, player_y, player_dir);
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
	C$main.c$109$1_0$126	= .
	.globl	C$main.c$109$1_0$126
;src/main.c:109: check_r_walls(dng, dungeon_width, dungeon_hieght, player_x, player_y, player_dir);
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
	C$main.c$110$1_0$126	= .
	.globl	C$main.c$110$1_0$126
;src/main.c:110: check_m_walls(dng, dungeon_width, dungeon_hieght, player_x, player_y,player_dir);
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
	C$main.c$112$1_0$126	= .
	.globl	C$main.c$112$1_0$126
;src/main.c:112: }
	pop	hl
	inc	sp
	jp	(hl)
	G$init_dng_UI$0$0	= .
	.globl	G$init_dng_UI$0$0
	C$main.c$118$1_0$127	= .
	.globl	C$main.c$118$1_0$127
;src/main.c:118: void init_dng_UI(){
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
	C$main.c$131$3_0$127	= .
	.globl	C$main.c$131$3_0$127
;src/main.c:131: move_sprite(9,152,28);
	C$main.c$134$3_0$127	= .
	.globl	C$main.c$134$3_0$127
;src/main.c:134: }
	C$main.c$134$3_0$127	= .
	.globl	C$main.c$134$3_0$127
	XG$init_dng_UI$0$0	= .
	.globl	XG$init_dng_UI$0$0
	ret
	G$update_dng_UI$0$0	= .
	.globl	G$update_dng_UI$0$0
	C$main.c$136$3_0$158	= .
	.globl	C$main.c$136$3_0$158
;src/main.c:136: void update_dng_UI (){
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
	C$main.c$142$1_0$158	= .
	.globl	C$main.c$142$1_0$158
;src/main.c:142: switch(player_dir){
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
	C$main.c$143$2_0$159	= .
	.globl	C$main.c$143$2_0$159
;src/main.c:143: case 0:            
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
	C$main.c$150$2_0$159	= .
	.globl	C$main.c$150$2_0$159
;src/main.c:150: break;
	jr	00105$
	C$main.c$152$2_0$159	= .
	.globl	C$main.c$152$2_0$159
;src/main.c:152: case 1:            
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
	C$main.c$159$2_0$159	= .
	.globl	C$main.c$159$2_0$159
;src/main.c:159: break;
	jr	00105$
	C$main.c$161$2_0$159	= .
	.globl	C$main.c$161$2_0$159
;src/main.c:161: case 2:
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
	C$main.c$170$2_0$159	= .
	.globl	C$main.c$170$2_0$159
;src/main.c:170: break;
	jr	00105$
	C$main.c$172$2_0$159	= .
	.globl	C$main.c$172$2_0$159
;src/main.c:172: case 3:
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
	C$main.c$180$1_0$158	= .
	.globl	C$main.c$180$1_0$158
;src/main.c:180: }
00105$:
	C$main.c$183$1_0$158	= .
	.globl	C$main.c$183$1_0$158
;src/main.c:183: switch(player_dir){
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
	C$main.c$184$2_0$160	= .
	.globl	C$main.c$184$2_0$160
;src/main.c:184: case 0:            
00106$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0c
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x0a
	C$main.c$187$2_0$160	= .
	.globl	C$main.c$187$2_0$160
;src/main.c:187: break;
	jr	00110$
	C$main.c$189$2_0$160	= .
	.globl	C$main.c$189$2_0$160
;src/main.c:189: case 1:            
00107$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x09
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x0b
	C$main.c$192$2_0$160	= .
	.globl	C$main.c$192$2_0$160
;src/main.c:192: break;
	jr	00110$
	C$main.c$194$2_0$160	= .
	.globl	C$main.c$194$2_0$160
;src/main.c:194: case 2:
00108$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0a
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x0c
	C$main.c$199$2_0$160	= .
	.globl	C$main.c$199$2_0$160
;src/main.c:199: break;
	jr	00110$
	C$main.c$201$2_0$160	= .
	.globl	C$main.c$201$2_0$160
;src/main.c:201: case 3:
00109$:
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0b
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x09
	C$main.c$205$1_0$158	= .
	.globl	C$main.c$205$1_0$158
;src/main.c:205: }
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
	C$main.c$214$3_0$158	= .
	.globl	C$main.c$214$3_0$158
;src/main.c:214: set_sprite_prop(9,S_FLIPX | S_FLIPY);
	C$main.c$217$3_0$158	= .
	.globl	C$main.c$217$3_0$158
;src/main.c:217: }
	C$main.c$217$3_0$158	= .
	.globl	C$main.c$217$3_0$158
	XG$update_dng_UI$0$0	= .
	.globl	XG$update_dng_UI$0$0
	ret
	G$dungeon_logic_upd$0$0	= .
	.globl	G$dungeon_logic_upd$0$0
	C$main.c$219$3_0$291	= .
	.globl	C$main.c$219$3_0$291
;src/main.c:219: void dungeon_logic_upd(uint8_t joypad_current,uint8_t joypad_previous){
;	---------------------------------
; Function dungeon_logic_upd
; ---------------------------------
_dungeon_logic_upd::
	ld	d, a
	C$main.c$222$1_0$291	= .
	.globl	C$main.c$222$1_0$291
;src/main.c:222: if((joypad_current & J_LEFT) && !(joypad_previous & J_LEFT)){
	bit	1, d
	jr	Z, 00104$
	bit	1, e
	jr	NZ, 00104$
	C$main.c$223$2_0$292	= .
	.globl	C$main.c$223$2_0$292
;src/main.c:223: player_dir--;
	ld	hl, #_player_dir
	dec	(hl)
	C$main.c$224$2_0$292	= .
	.globl	C$main.c$224$2_0$292
;src/main.c:224: if (player_dir==255){
	ld	a, (hl)
	inc	a
	jr	NZ, 00102$
	C$main.c$225$3_0$293	= .
	.globl	C$main.c$225$3_0$293
;src/main.c:225: player_dir = west;
	ld	hl, #_player_dir
	ld	(hl), #0x03
00102$:
	C$main.c$227$2_0$292	= .
	.globl	C$main.c$227$2_0$292
;src/main.c:227: update_dng(test_dungeon,dng_w,dng_h);
	push	de
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_update_dng
	pop	de
00104$:
	C$main.c$231$1_0$291	= .
	.globl	C$main.c$231$1_0$291
;src/main.c:231: if((joypad_current & J_RIGHT) && !(joypad_previous & J_RIGHT)){
	bit	0, d
	jr	Z, 00109$
	bit	0, e
	jr	NZ, 00109$
	C$main.c$232$2_0$294	= .
	.globl	C$main.c$232$2_0$294
;src/main.c:232: player_dir++;
	ld	hl, #_player_dir
	inc	(hl)
	C$main.c$233$2_0$294	= .
	.globl	C$main.c$233$2_0$294
;src/main.c:233: if(player_dir==4){
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00107$
	C$main.c$234$3_0$295	= .
	.globl	C$main.c$234$3_0$295
;src/main.c:234: player_dir=north;
	ld	hl, #_player_dir
	ld	(hl), #0x00
00107$:
	C$main.c$236$2_0$294	= .
	.globl	C$main.c$236$2_0$294
;src/main.c:236: update_dng(test_dungeon,dng_w,dng_h);
	push	de
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_update_dng
	pop	de
00109$:
	C$main.c$239$1_0$291	= .
	.globl	C$main.c$239$1_0$291
;src/main.c:239: if((joypad_current & J_UP) && !(joypad_previous & J_UP)){
	bit	2, d
	jp	Z,00129$
	bit	2, e
	jp	NZ,00129$
	C$main.c$242$1_0$291	= .
	.globl	C$main.c$242$1_0$291
;src/main.c:242: if(return_value(test_dungeon,dng_w,dng_h,player_x,player_y-1)==0x00||return_value(test_dungeon,dng_w,dng_h,player_x,player_y-1)==0x01){
	ld	hl, #_player_y
	ld	c, (hl)
	C$main.c$240$2_0$296	= .
	.globl	C$main.c$240$2_0$296
;src/main.c:240: switch(player_dir){
	ld	a, (#_player_dir)
	or	a, a
	jr	Z, 00111$
	C$main.c$248$1_0$291	= .
	.globl	C$main.c$248$1_0$291
;src/main.c:248: if(return_value(test_dungeon,dng_w,dng_h,player_x+1,player_y)==0x00||return_value(test_dungeon,dng_w,dng_h,player_x+1,player_y)==0x01){
	ld	hl, #_player_x
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	C$main.c$240$2_0$296	= .
	.globl	C$main.c$240$2_0$296
;src/main.c:240: switch(player_dir){
	push	hl
	ld	a, (#_player_dir)
	dec	a
	pop	hl
	jr	Z, 00115$
	push	hl
	ld	a, (#_player_dir)
	sub	a, #0x02
	pop	hl
	jp	Z,00119$
	push	hl
	ld	a, (#_player_dir)
	sub	a, #0x03
	pop	hl
	jp	Z,00123$
	jp	00127$
	C$main.c$241$3_0$297	= .
	.globl	C$main.c$241$3_0$297
;src/main.c:241: case north:
00111$:
	C$main.c$242$3_0$297	= .
	.globl	C$main.c$242$3_0$297
;src/main.c:242: if(return_value(test_dungeon,dng_w,dng_h,player_x,player_y-1)==0x00||return_value(test_dungeon,dng_w,dng_h,player_x,player_y-1)==0x01){
	dec	c
	push	de
	ld	a, c
	push	af
	inc	sp
	ld	a, (#_player_x)
	ld	h, a
	ld	a, (#_dng_h)
	ld	l, a
	push	hl
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_return_value
	pop	de
	or	a, a
	jr	Z, 00112$
	ld	a, (#_player_y)
	dec	a
	push	de
	push	af
	inc	sp
	ld	a, (#_player_x)
	ld	h, a
	ld	a, (#_dng_h)
	ld	l, a
	push	hl
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_return_value
	pop	de
	dec	a
	jp	NZ,00127$
00112$:
	C$main.c$243$4_0$298	= .
	.globl	C$main.c$243$4_0$298
;src/main.c:243: player_y--;
	ld	hl, #_player_y
	dec	(hl)
	C$main.c$244$4_0$298	= .
	.globl	C$main.c$244$4_0$298
;src/main.c:244: update_dng(test_dungeon,dng_w,dng_h);
	push	de
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_update_dng
	pop	de
	C$main.c$246$3_0$297	= .
	.globl	C$main.c$246$3_0$297
;src/main.c:246: break;
	jp	00127$
	C$main.c$247$3_0$297	= .
	.globl	C$main.c$247$3_0$297
;src/main.c:247: case east:
00115$:
	C$main.c$248$3_0$297	= .
	.globl	C$main.c$248$3_0$297
;src/main.c:248: if(return_value(test_dungeon,dng_w,dng_h,player_x+1,player_y)==0x00||return_value(test_dungeon,dng_w,dng_h,player_x+1,player_y)==0x01){
	ld	b, l
	inc	b
	push	de
	ld	a, (#_player_y)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_return_value
	pop	de
	or	a, a
	jr	Z, 00116$
	ld	a, (#_player_x)
	inc	a
	push	de
	ld	hl, #_player_y
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_return_value
	pop	de
	dec	a
	jp	NZ,00127$
00116$:
	C$main.c$249$4_0$299	= .
	.globl	C$main.c$249$4_0$299
;src/main.c:249: player_x++;
	ld	hl, #_player_x
	inc	(hl)
	C$main.c$250$4_0$299	= .
	.globl	C$main.c$250$4_0$299
;src/main.c:250: update_dng(test_dungeon,dng_w,dng_h);
	push	de
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_update_dng
	pop	de
	C$main.c$252$3_0$297	= .
	.globl	C$main.c$252$3_0$297
;src/main.c:252: break;
	jp	00127$
	C$main.c$253$3_0$297	= .
	.globl	C$main.c$253$3_0$297
;src/main.c:253: case south:
00119$:
	C$main.c$254$3_0$297	= .
	.globl	C$main.c$254$3_0$297
;src/main.c:254: if(return_value(test_dungeon,dng_w,dng_h,player_x,player_y+1)==0x00||return_value(test_dungeon,dng_w,dng_h,player_x,player_y+1)==0x01){
	inc	c
	push	de
	ld	a, c
	push	af
	inc	sp
	ld	a, (#_player_x)
	ld	h, a
	ld	a, (#_dng_h)
	ld	l, a
	push	hl
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_return_value
	pop	de
	or	a, a
	jr	Z, 00120$
	ld	a, (#_player_y)
	inc	a
	push	de
	push	af
	inc	sp
	ld	a, (#_player_x)
	ld	h, a
	ld	a, (#_dng_h)
	ld	l, a
	push	hl
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_return_value
	pop	de
	dec	a
	jr	NZ, 00127$
00120$:
	C$main.c$255$4_0$300	= .
	.globl	C$main.c$255$4_0$300
;src/main.c:255: player_y++;
	ld	hl, #_player_y
	inc	(hl)
	C$main.c$256$4_0$300	= .
	.globl	C$main.c$256$4_0$300
;src/main.c:256: update_dng(test_dungeon,dng_w,dng_h);
	push	de
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_update_dng
	pop	de
	C$main.c$258$3_0$297	= .
	.globl	C$main.c$258$3_0$297
;src/main.c:258: break;
	jr	00127$
	C$main.c$259$3_0$297	= .
	.globl	C$main.c$259$3_0$297
;src/main.c:259: case west:
00123$:
	C$main.c$260$3_0$297	= .
	.globl	C$main.c$260$3_0$297
;src/main.c:260: if(return_value(test_dungeon,dng_w,dng_h,player_x-1,player_y)==0x00||return_value(test_dungeon,dng_w,dng_h,player_x-1,player_y)==0x01){
	ld	b, l
	dec	b
	push	de
	ld	a, (#_player_y)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_return_value
	pop	de
	or	a, a
	jr	Z, 00124$
	ld	a, (#_player_x)
	dec	a
	push	de
	ld	hl, #_player_y
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_return_value
	pop	de
	dec	a
	jr	NZ, 00127$
00124$:
	C$main.c$261$4_0$301	= .
	.globl	C$main.c$261$4_0$301
;src/main.c:261: player_x--;
	ld	hl, #_player_x
	dec	(hl)
	C$main.c$262$4_0$301	= .
	.globl	C$main.c$262$4_0$301
;src/main.c:262: update_dng(test_dungeon,dng_w,dng_h);
	push	de
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_update_dng
	pop	de
	C$main.c$265$2_0$296	= .
	.globl	C$main.c$265$2_0$296
;src/main.c:265: }
00127$:
	C$main.c$266$2_0$296	= .
	.globl	C$main.c$266$2_0$296
;src/main.c:266: encounter_timer++;
	ld	hl, #_encounter_timer
	inc	(hl)
00129$:
	C$main.c$268$1_0$291	= .
	.globl	C$main.c$268$1_0$291
;src/main.c:268: if((joypad_current & J_DOWN) && !(joypad_previous & J_DOWN)){
	bit	3, d
	jp	Z,00149$
	bit	3, e
	jp	NZ,00149$
	C$main.c$242$1_0$291	= .
	.globl	C$main.c$242$1_0$291
;src/main.c:242: if(return_value(test_dungeon,dng_w,dng_h,player_x,player_y-1)==0x00||return_value(test_dungeon,dng_w,dng_h,player_x,player_y-1)==0x01){
	ld	hl, #_player_y
	ld	c, (hl)
	C$main.c$269$2_0$302	= .
	.globl	C$main.c$269$2_0$302
;src/main.c:269: switch(player_dir){
	ld	a, (#_player_dir)
	or	a, a
	jr	Z, 00131$
	C$main.c$248$1_0$291	= .
	.globl	C$main.c$248$1_0$291
;src/main.c:248: if(return_value(test_dungeon,dng_w,dng_h,player_x+1,player_y)==0x00||return_value(test_dungeon,dng_w,dng_h,player_x+1,player_y)==0x01){
	ld	hl, #_player_x
	ld	e, (hl)
	C$main.c$269$2_0$302	= .
	.globl	C$main.c$269$2_0$302
;src/main.c:269: switch(player_dir){
	ld	a, (#_player_dir)
	dec	a
	jr	Z, 00135$
	ld	a,(#_player_dir)
	cp	a,#0x02
	jp	Z,00139$
	sub	a, #0x03
	jp	Z,00143$
	jp	00147$
	C$main.c$270$3_0$303	= .
	.globl	C$main.c$270$3_0$303
;src/main.c:270: case north:
00131$:
	C$main.c$271$3_0$303	= .
	.globl	C$main.c$271$3_0$303
;src/main.c:271: if(return_value(test_dungeon,dng_w,dng_h,player_x,player_y+1)==0x00||return_value(test_dungeon,dng_w,dng_h,player_x,player_y+1)==0x01){
	inc	c
	ld	a, c
	push	af
	inc	sp
	ld	a, (#_player_x)
	ld	h, a
	ld	a, (#_dng_h)
	ld	l, a
	push	hl
	ld	a, (#_dng_w)
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
	ld	a, (#_dng_h)
	ld	l, a
	push	hl
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_return_value
	dec	a
	jp	NZ,00147$
00132$:
	C$main.c$272$4_0$304	= .
	.globl	C$main.c$272$4_0$304
;src/main.c:272: player_y++;
	ld	hl, #_player_y
	inc	(hl)
	C$main.c$273$4_0$304	= .
	.globl	C$main.c$273$4_0$304
;src/main.c:273: update_dng(test_dungeon,dng_w,dng_h);
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$275$3_0$303	= .
	.globl	C$main.c$275$3_0$303
;src/main.c:275: break;
	jp	00147$
	C$main.c$276$3_0$303	= .
	.globl	C$main.c$276$3_0$303
;src/main.c:276: case east:
00135$:
	C$main.c$277$3_0$303	= .
	.globl	C$main.c$277$3_0$303
;src/main.c:277: if(return_value(test_dungeon,dng_w,dng_h,player_x-1,player_y)==0x00||return_value(test_dungeon,dng_w,dng_h,player_x-1,player_y)==0x01){
	ld	b, e
	dec	b
	ld	a, (#_player_y)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
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
	push	af
	inc	sp
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_return_value
	dec	a
	jp	NZ,00147$
00136$:
	C$main.c$278$4_0$305	= .
	.globl	C$main.c$278$4_0$305
;src/main.c:278: player_x--;
	ld	hl, #_player_x
	dec	(hl)
	C$main.c$279$4_0$305	= .
	.globl	C$main.c$279$4_0$305
;src/main.c:279: update_dng(test_dungeon,dng_w,dng_h);
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$281$3_0$303	= .
	.globl	C$main.c$281$3_0$303
;src/main.c:281: break;
	jp	00147$
	C$main.c$282$3_0$303	= .
	.globl	C$main.c$282$3_0$303
;src/main.c:282: case south:
00139$:
	C$main.c$283$3_0$303	= .
	.globl	C$main.c$283$3_0$303
;src/main.c:283: if(return_value(test_dungeon,dng_w,dng_h,player_x,player_y-1)==0x00||return_value(test_dungeon,dng_w,dng_h,player_x,player_y-1)==0x01){
	dec	c
	ld	a, c
	push	af
	inc	sp
	ld	a, (#_player_x)
	ld	h, a
	ld	a, (#_dng_h)
	ld	l, a
	push	hl
	ld	a, (#_dng_w)
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
	ld	a, (#_dng_h)
	ld	l, a
	push	hl
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_return_value
	dec	a
	jr	NZ, 00147$
00140$:
	C$main.c$284$4_0$306	= .
	.globl	C$main.c$284$4_0$306
;src/main.c:284: player_y--;
	ld	hl, #_player_y
	dec	(hl)
	C$main.c$285$4_0$306	= .
	.globl	C$main.c$285$4_0$306
;src/main.c:285: update_dng(test_dungeon,dng_w,dng_h);
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$287$3_0$303	= .
	.globl	C$main.c$287$3_0$303
;src/main.c:287: break;
	jr	00147$
	C$main.c$288$3_0$303	= .
	.globl	C$main.c$288$3_0$303
;src/main.c:288: case west:
00143$:
	C$main.c$289$3_0$303	= .
	.globl	C$main.c$289$3_0$303
;src/main.c:289: if(return_value(test_dungeon,dng_w,dng_h,player_x+1,player_y)==0x00||return_value(test_dungeon,dng_w,dng_h,player_x+1,player_y)==0x01){
	ld	b, e
	inc	b
	ld	a, (#_player_y)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
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
	push	af
	inc	sp
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_return_value
	dec	a
	jr	NZ, 00147$
00144$:
	C$main.c$290$4_0$307	= .
	.globl	C$main.c$290$4_0$307
;src/main.c:290: player_x++;
	ld	hl, #_player_x
	inc	(hl)
	C$main.c$291$4_0$307	= .
	.globl	C$main.c$291$4_0$307
;src/main.c:291: update_dng(test_dungeon,dng_w,dng_h);
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$294$2_0$302	= .
	.globl	C$main.c$294$2_0$302
;src/main.c:294: }
00147$:
	C$main.c$295$2_0$302	= .
	.globl	C$main.c$295$2_0$302
;src/main.c:295: encounter_timer++;
	ld	hl, #_encounter_timer
	inc	(hl)
00149$:
	C$main.c$297$1_0$291	= .
	.globl	C$main.c$297$1_0$291
;src/main.c:297: if(encounter_counter==encounter_timer){
	ld	a, (#_encounter_counter)
	ld	hl, #_encounter_timer
	sub	a, (hl)
	ret	NZ
	C$main.c$298$2_0$308	= .
	.globl	C$main.c$298$2_0$308
;src/main.c:298: state_switcher(2);
	ld	a, #0x02
	C$main.c$300$1_0$291	= .
	.globl	C$main.c$300$1_0$291
;src/main.c:300: }
	C$main.c$300$1_0$291	= .
	.globl	C$main.c$300$1_0$291
	XG$dungeon_logic_upd$0$0	= .
	.globl	XG$dungeon_logic_upd$0$0
	jp	_state_switcher
	G$state_switcher$0$0	= .
	.globl	G$state_switcher$0$0
	C$main.c$302$1_0$310	= .
	.globl	C$main.c$302$1_0$310
;src/main.c:302: void state_switcher(uint8_t state){
;	---------------------------------
; Function state_switcher
; ---------------------------------
_state_switcher::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
	C$main.c$303$1_0$310	= .
	.globl	C$main.c$303$1_0$310
;src/main.c:303: if(global_state==1&&state==2){
	ld	a, (#_global_state)
	dec	a
	jp	NZ,00102$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x02
	jp	NZ,00102$
	C$main.c$304$2_0$311	= .
	.globl	C$main.c$304$2_0$311
;src/main.c:304: initrand(sys_time);
	ld	hl, #_sys_time
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_initrand
	pop	hl
	C$main.c$305$2_0$311	= .
	.globl	C$main.c$305$2_0$311
;src/main.c:305: init_combat(rand()%GROUP_COUNT,sl1,sl2,sl3);
	call	_rand
	ld	a, e
	and	a, #0x01
	ld	c, a
	ld	hl, #_sl3
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	push	af
	inc	sp
	ld	hl, #_sl2
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	push	af
	inc	sp
	ld	hl, #_sl1
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl-)
	ld	e, a
	push	de
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, c
	call	_init_combat
	C$main.c$306$2_0$311	= .
	.globl	C$main.c$306$2_0$311
;src/main.c:306: global_state = 2;
	ld	hl, #_global_state
	ld	(hl), #0x02
00102$:
	C$main.c$308$1_0$310	= .
	.globl	C$main.c$308$1_0$310
;src/main.c:308: if(global_state==2&&state==1){
	ld	a, (#_global_state)
	sub	a, #0x02
	jr	NZ, 00110$
	ldhl	sp,	#0
	ld	a, (hl)
	C$main.c$310$1_0$310	= .
	.globl	C$main.c$310$1_0$310
;src/main.c:310: for(i=0;i<3;i++){
	dec	a
	jr	NZ, 00110$
	ld	c,a
00108$:
	C$main.c$311$4_0$314	= .
	.globl	C$main.c$311$4_0$314
;src/main.c:311: unload_enemy(i);
	push	bc
	ld	a, c
	call	_unload_enemy
	pop	bc
	C$main.c$310$3_0$313	= .
	.globl	C$main.c$310$3_0$313
;src/main.c:310: for(i=0;i<3;i++){
	inc	c
	ld	a, c
	sub	a, #0x03
	jr	C, 00108$
	C$main.c$313$2_0$312	= .
	.globl	C$main.c$313$2_0$312
;src/main.c:313: init_dungeon(test_dungeon,dng_w,dng_h);
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_init_dungeon
	C$main.c$314$2_0$312	= .
	.globl	C$main.c$314$2_0$312
;src/main.c:314: init_dng_UI();
	call	_init_dng_UI
	C$main.c$315$2_0$312	= .
	.globl	C$main.c$315$2_0$312
;src/main.c:315: global_state = 1;
	ld	hl, #_global_state
	ld	(hl), #0x01
00110$:
	C$main.c$317$1_0$310	= .
	.globl	C$main.c$317$1_0$310
;src/main.c:317: }
	inc	sp
	C$main.c$317$1_0$310	= .
	.globl	C$main.c$317$1_0$310
	XG$state_switcher$0$0	= .
	.globl	XG$state_switcher$0$0
	ret
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$319$1_0$316	= .
	.globl	C$main.c$319$1_0$316
;src/main.c:319: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$321$1_0$316	= .
	.globl	C$main.c$321$1_0$316
;src/main.c:321: init_dungeon(test_dungeon, dng_w, dng_h);
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_init_dungeon
	C$main.c$322$1_0$316	= .
	.globl	C$main.c$322$1_0$316
;src/main.c:322: init_dng_UI();
	call	_init_dng_UI
	C$main.c$323$1_0$316	= .
	.globl	C$main.c$323$1_0$316
;src/main.c:323: update_dng(test_dungeon,dng_w,dng_h);
	ld	a, (#_dng_h)
	push	af
	inc	sp
	ld	a, (#_dng_w)
	ld	de, #_test_dungeon
	call	_update_dng
	C$main.c$338$1_0$316	= .
	.globl	C$main.c$338$1_0$316
;src/main.c:338: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
	C$main.c$340$1_0$316	= .
	.globl	C$main.c$340$1_0$316
;src/main.c:340: while(1) {
00110$:
	C$main.c$342$2_0$317	= .
	.globl	C$main.c$342$2_0$317
;src/main.c:342: joypad_previous = joypad_current;
	ld	a, (#_joypad_current)
	ld	(#_joypad_previous),a
	C$main.c$343$2_0$317	= .
	.globl	C$main.c$343$2_0$317
;src/main.c:343: joypad_current = joypad();
	call	_joypad
	ld	(#_joypad_current),a
	C$main.c$346$2_0$317	= .
	.globl	C$main.c$346$2_0$317
;src/main.c:346: switch (global_state)
	ld	a, #0x05
	ld	hl, #_global_state
	sub	a, (hl)
	jr	C, 00107$
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #00125$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00125$:
	jp	00108$
	jp	00102$
	jp	00103$
	jp	00108$
	jp	00108$
	jp	00108$
	C$main.c$350$3_0$318	= .
	.globl	C$main.c$350$3_0$318
;src/main.c:350: case 1://dungeon crawling
00102$:
	C$main.c$351$3_0$318	= .
	.globl	C$main.c$351$3_0$318
;src/main.c:351: dungeon_logic_upd(joypad_current, joypad_previous);
	ld	hl, #_joypad_previous
	ld	e, (hl)
	ld	a, (#_joypad_current)
	call	_dungeon_logic_upd
	C$main.c$352$3_0$318	= .
	.globl	C$main.c$352$3_0$318
;src/main.c:352: update_dng_UI();
	call	_update_dng_UI
	C$main.c$353$3_0$318	= .
	.globl	C$main.c$353$3_0$318
;src/main.c:353: break;
	jr	00108$
	C$main.c$354$3_0$318	= .
	.globl	C$main.c$354$3_0$318
;src/main.c:354: case 2://combat
00103$:
	C$main.c$355$3_0$318	= .
	.globl	C$main.c$355$3_0$318
;src/main.c:355: combat_view_upd(joypad_current, joypad_previous);
	ld	hl, #_joypad_previous
	ld	e, (hl)
	ld	a, (#_joypad_current)
	call	_combat_view_upd
	C$main.c$356$3_0$318	= .
	.globl	C$main.c$356$3_0$318
;src/main.c:356: state_switcher(1);//test code delete later
	ld	a, #0x01
	call	_state_switcher
	C$main.c$357$3_0$318	= .
	.globl	C$main.c$357$3_0$318
;src/main.c:357: break;        
	jr	00108$
	C$main.c$364$3_0$318	= .
	.globl	C$main.c$364$3_0$318
;src/main.c:364: default:
00107$:
	C$main.c$365$3_0$318	= .
	.globl	C$main.c$365$3_0$318
;src/main.c:365: global_state = 0;
	ld	hl, #_global_state
	ld	(hl), #0x00
	C$main.c$367$2_0$317	= .
	.globl	C$main.c$367$2_0$317
;src/main.c:367: }
00108$:
	C$main.c$380$2_0$317	= .
	.globl	C$main.c$380$2_0$317
;src/main.c:380: wait_vbl_done();
	call	_wait_vbl_done
	C$main.c$382$1_0$316	= .
	.globl	C$main.c$382$1_0$316
;src/main.c:382: }
	C$main.c$382$1_0$316	= .
	.globl	C$main.c$382$1_0$316
	XG$main$0$0	= .
	.globl	XG$main$0$0
	jr	00110$
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
Fmain$__xinit_dng_w$0_0$0 == .
__xinit__dng_w:
	.db #0x0f	; 15
Fmain$__xinit_dng_h$0_0$0 == .
__xinit__dng_h:
	.db #0x0f	; 15
Fmain$__xinit_joypad_current$0_0$0 == .
__xinit__joypad_current:
	.db #0x00	; 0
Fmain$__xinit_joypad_previous$0_0$0 == .
__xinit__joypad_previous:
	.db #0x00	; 0
	.area _CABS (ABS)
