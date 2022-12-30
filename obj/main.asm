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
	.globl _check_r_walls_w
	.globl _check_r_walls_s
	.globl _check_r_walls_e
	.globl _check_r_walls_n
	.globl _check_l_walls_w
	.globl _check_l_walls_s
	.globl _check_l_walls_e
	.globl _check_l_walls_n
	.globl _check_m_walls
	.globl _init_gfx
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
_player_dir:
	.ds 1
_dist:
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
;src/main.c:57: unsigned char return_value(const unsigned char *dng, uint8_t width, uint8_t height,uint8_t x ,uint8_t y){
;	---------------------------------
; Function return_value
; ---------------------------------
_return_value::
	push	de
	ld	d, a
;src/main.c:58: if(y*width + x < height*width)
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
;src/main.c:59: return dng[ y*width + x ];
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	jr	00104$
00102$:
;src/main.c:61: return NULL;
	xor	a, a
00104$:
;src/main.c:62: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #3
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
;src/main.c:64: void init_gfx() {
;	---------------------------------
; Function init_gfx
; ---------------------------------
_init_gfx::
;src/main.c:67: set_bkg_data(0,74,dng_tileset);
	ld	de, #_dng_tileset
	push	de
	ld	hl, #0x4a00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:69: for(uint8_t i = 0; i < 15; i++){
	ld	c, #0x00
00109$:
	ld	a, c
	sub	a, #0x0f
	jr	NC, 00104$
;src/main.c:70: for(uint8_t j = 0; j < 15; j++){
	ld	b, #0x00
00106$:
	ld	a, b
	sub	a, #0x0f
	jr	NC, 00110$
;src/main.c:71: if(test_dungeon[i*15+j]==0x01){
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
;src/main.c:72: player_x = j;
	ld	hl, #_player_x
	ld	(hl), b
;src/main.c:73: player_y = i;
	ld	hl, #_player_y
	ld	(hl), c
00107$:
;src/main.c:70: for(uint8_t j = 0; j < 15; j++){
	inc	b
	jr	00106$
00110$:
;src/main.c:69: for(uint8_t i = 0; i < 15; i++){
	inc	c
	jr	00109$
00104$:
;src/main.c:77: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:79: }
	ret
;src/main.c:81: void check_m_walls(unsigned char *dng, uint8_t dungeon_width, uint8_t dungeon_hieght, int8_t dirx, int8_t diry){
;	---------------------------------
; Function check_m_walls
; ---------------------------------
_check_m_walls::
	add	sp, #-7
	ldhl	sp,	#5
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
	ld	(hl), a
;src/main.c:82: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(1*dirx), player_y+(1*diry));
	ldhl	sp,	#11
	ld	b, (hl)
	ld	a, (#_player_y)
	add	a, b
	ld	e, a
	ldhl	sp,	#10
	ld	c, (hl)
	ld	hl, #_player_x
	ld	a, (hl)
	add	a, c
	push	bc
	ld	h, e
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	bc
	ld	e, a
;src/main.c:84: if( w == 0x03 && diry == -1 || w == 0x04 && dirx == 1 ||w == 0x05 && diry == 1 || w==0x06 && dirx == -1){
	ld	a, b
	inc	a
	ld	a, #0x01
	jr	Z, 00233$
	xor	a, a
00233$:
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, c
	dec	a
	ld	a, #0x01
	jr	Z, 00235$
	xor	a, a
00235$:
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, b
	dec	a
	ld	a, #0x01
	jr	Z, 00237$
	xor	a, a
00237$:
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, c
	inc	a
	ld	a, #0x01
	jr	Z, 00239$
	xor	a, a
00239$:
	ldhl	sp,	#3
	ld	(hl), a
;src/main.c:83: if( w != 0x00 && w != 0x01){
	ld	a, e
	or	a, a
	jr	Z, 00112$
	ld	a, e
	dec	a
	jr	Z, 00112$
;src/main.c:84: if( w == 0x03 && diry == -1 || w == 0x04 && dirx == 1 ||w == 0x05 && diry == 1 || w==0x06 && dirx == -1){
	ld	a, e
	sub	a, #0x03
	jr	NZ, 00106$
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	NZ, 00101$
00106$:
	ld	a, e
	sub	a, #0x04
	jr	NZ, 00108$
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	NZ, 00101$
00108$:
	ld	a, e
	sub	a, #0x05
	jr	NZ, 00110$
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00101$
00110$:
	ld	a, e
	sub	a, #0x06
	jr	NZ, 00102$
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
00101$:
;src/main.c:85: set_bkg_tiles(4,0,12,9,door1_bkg);
	ld	de, #_door1_bkg
	push	de
	ld	hl, #0x90c
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x04
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/main.c:88: return;
	jp	00140$
00102$:
;src/main.c:90: set_bkg_tiles(4,0,12,9,wall1_bkg);
	ld	de, #_wall1_bkg
	push	de
	ld	hl, #0x90c
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x04
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/main.c:93: return;
	jp	00140$
00112$:
;src/main.c:96: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(2*dirx), player_y+(2*diry));
	ld	a, b
	add	a, a
	ld	hl, #_player_y
	ld	e, (hl)
	add	a, e
	ld	e, a
	ld	a, c
	add	a, a
	ld	hl, #_player_x
	ld	d, (hl)
	add	a, d
	push	bc
	ld	h, e
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
	pop	bc
;src/main.c:97: if( w != 0x00 && w != 0x01){
	ld	e,a
	or	a,a
	jr	Z, 00125$
	dec	a
	jr	Z, 00125$
;src/main.c:98: if( w == 0x03 && diry == -1 || w == 0x04 && dirx == 1 ||w == 0x05 && diry == 1 || w==0x06 && dirx == -1){
	ld	a, e
	sub	a, #0x03
	jr	NZ, 00119$
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	NZ, 00114$
00119$:
	ld	a, e
	sub	a, #0x04
	jr	NZ, 00121$
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	NZ, 00114$
00121$:
	ld	a, e
	sub	a, #0x05
	jr	NZ, 00123$
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00114$
00123$:
	ld	a, e
	sub	a, #0x06
	jr	NZ, 00115$
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00115$
00114$:
;src/main.c:99: set_bkg_tiles(6,0,8,9,door2_bkg);
	ld	de, #_door2_bkg
	push	de
	ld	hl, #0x908
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x06
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/main.c:102: return;
	jp	00140$
00115$:
;src/main.c:104: set_bkg_tiles(6,0,8,9,wall2_bkg);
	ld	de, #_wall2_bkg
	push	de
	ld	hl, #0x908
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x06
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/main.c:107: return;
	jp	00140$
00125$:
;src/main.c:111: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(3*dirx), player_y+(3*diry));
	ld	a, b
	ld	e, a
	add	a, a
	add	a, e
	ld	hl, #_player_y
	ld	e, (hl)
	add	a, e
	ld	b, a
	ld	a, c
	add	a, a
	add	a, c
	ld	hl, #_player_x
	ld	c, (hl)
	add	a, c
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#11
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_return_value
;src/main.c:112: if( w != 0x00 && w != 0x01 ){
	ld	c,a
	or	a,a
	jr	Z, 00140$
	dec	a
	jr	Z, 00140$
;src/main.c:113: if( w == 0x03 && diry == -1 || w == 0x04 && dirx == 1 ||w == 0x05 && diry == 1 || w==0x06 && dirx == -1){
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00132$
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	NZ, 00127$
00132$:
	ld	a, c
	sub	a, #0x04
	jr	NZ, 00134$
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	NZ, 00127$
00134$:
	ld	a, c
	sub	a, #0x05
	jr	NZ, 00136$
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00127$
00136$:
	ld	a, c
	sub	a, #0x06
	jr	NZ, 00128$
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00128$
00127$:
;src/main.c:114: set_bkg_tiles(7,0,6,9,door3_bkg);
	ld	de, #_door3_bkg
	push	de
	ld	hl, #0x906
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x07
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/main.c:117: return;
	jr	00140$
00128$:
;src/main.c:119: set_bkg_tiles(7,0,6,9,wall3_bkg);
	ld	de, #_wall3_bkg
	push	de
	ld	hl, #0x906
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x07
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/main.c:122: return;
00140$:
;src/main.c:127: }
	add	sp, #7
	pop	hl
	add	sp, #3
	jp	(hl)
;src/main.c:129: void check_l_walls_n(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght){
;	---------------------------------
; Function check_l_walls_n
; ---------------------------------
_check_l_walls_n::
	ld	c, a
;src/main.c:130: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-2);
	ld	hl, #_player_y
	ld	b, (hl)
	dec	b
	dec	b
	ld	a, (#_player_x)
	dec	a
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:131: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/main.c:132: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00102$
;src/main.c:133: set_bkg_tiles(6,0,1,9,door3_l_bkg);
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
;src/main.c:135: set_bkg_tiles(6,0,1,9,wall3_l_bkg);
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
;src/main.c:138: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-3);
	ld	a, (#_player_y)
	add	a, #0xfd
	ld	hl, #_player_x
	ld	b, (hl)
	dec	b
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:139: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/main.c:140: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00105$
;src/main.c:141: set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
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
;src/main.c:143: set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
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
;src/main.c:147: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
	ld	hl, #_player_y
	ld	b, (hl)
	dec	b
	ld	a, (#_player_x)
	dec	a
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:148: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/main.c:149: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00115$
;src/main.c:150: set_bkg_tiles(4,0,2,9,door2_l_bkg);
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
;src/main.c:152: set_bkg_tiles(4,0,2,9,wall2_l_bkg);
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
;src/main.c:155: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-2);
	ld	a, (#_player_y)
	dec	a
	dec	a
	ld	hl, #_player_x
	ld	b, (hl)
	dec	b
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:156: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/main.c:157: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00118$
;src/main.c:158: set_bkg_tiles(1,0,5,9,nowall_door2_l_bkg);
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
;src/main.c:160: set_bkg_tiles(1,0,5,9,nowall2_l_bkg);
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
;src/main.c:165: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y);
	ld	a, (#_player_x)
	dec	a
	push	bc
	push	de
	ld	hl, #_player_y
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:166: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/main.c:167: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00128$
;src/main.c:168: set_bkg_tiles(1,0,3,9,door1_l_bkg);
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
;src/main.c:170: set_bkg_tiles(1,0,3,9,wall1_l_bkg);
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
;src/main.c:173: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
	ld	hl, #_player_y
	ld	b, (hl)
	dec	b
	ld	a, (#_player_x)
	dec	a
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
;src/main.c:174: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/main.c:175: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00131$
;src/main.c:176: set_bkg_tiles(1,0,3,9,nowall_door1_l_bkg);
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
;src/main.c:178: set_bkg_tiles(1,0,3,9,nowall1_l_bkg);
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
;src/main.c:182: }
	pop	hl
	inc	sp
	jp	(hl)
;src/main.c:184: void check_l_walls_e(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght){
;	---------------------------------
; Function check_l_walls_e
; ---------------------------------
_check_l_walls_e::
	ld	c, a
;src/main.c:185: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y-1);
	ld	hl, #_player_y
	ld	b, (hl)
	dec	b
	ld	a, (#_player_x)
	add	a, #0x02
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:186: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/main.c:187: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00102$
;src/main.c:188: set_bkg_tiles(6,0,1,9,door3_l_bkg);
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
;src/main.c:190: set_bkg_tiles(6,0,1,9,wall3_l_bkg);
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
;src/main.c:193: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+3, player_y-1);
	ld	hl, #_player_y
	ld	b, (hl)
	dec	b
	ld	a, (#_player_x)
	add	a, #0x03
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:194: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/main.c:195: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00105$
;src/main.c:196: set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
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
;src/main.c:198: set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
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
;src/main.c:202: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
	ld	hl, #_player_y
	ld	b, (hl)
	dec	b
	ld	a, (#_player_x)
	inc	a
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:203: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/main.c:204: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00115$
;src/main.c:205: set_bkg_tiles(4,0,2,9,door2_l_bkg);
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
;src/main.c:207: set_bkg_tiles(4,0,2,9,wall2_l_bkg);
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
;src/main.c:210: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y-1);
	ld	a, (#_player_y)
	dec	a
	ld	hl, #_player_x
	ld	b, (hl)
	inc	b
	inc	b
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:211: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/main.c:212: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00118$
;src/main.c:213: set_bkg_tiles(1,0,5,9,nowall_door2_l_bkg);
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
;src/main.c:215: set_bkg_tiles(1,0,5,9,nowall2_l_bkg);
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
;src/main.c:220: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y-1);
	ld	a, (#_player_y)
	dec	a
	push	bc
	push	de
	push	af
	inc	sp
	ld	a, (#_player_x)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:221: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/main.c:222: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00128$
;src/main.c:223: set_bkg_tiles(1,0,3,9,door1_l_bkg);
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
;src/main.c:225: set_bkg_tiles(1,0,3,9,wall1_l_bkg);
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
;src/main.c:228: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
	ld	hl, #_player_y
	ld	b, (hl)
	dec	b
	ld	a, (#_player_x)
	inc	a
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
;src/main.c:229: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/main.c:230: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00131$
;src/main.c:231: set_bkg_tiles(1,0,3,9,nowall_door1_l_bkg);
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
;src/main.c:233: set_bkg_tiles(1,0,3,9,nowall1_l_bkg);
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
;src/main.c:237: }
	pop	hl
	inc	sp
	jp	(hl)
;src/main.c:239: void check_l_walls_s(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght){
;	---------------------------------
; Function check_l_walls_s
; ---------------------------------
_check_l_walls_s::
	ld	c, a
;src/main.c:240: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+2);
	ld	hl, #_player_y
	ld	b, (hl)
	inc	b
	inc	b
	ld	a, (#_player_x)
	inc	a
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:241: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/main.c:242: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00102$
;src/main.c:243: set_bkg_tiles(6,0,1,9,door3_l_bkg);
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
;src/main.c:245: set_bkg_tiles(6,0,1,9,wall3_l_bkg);
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
;src/main.c:248: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+3);
	ld	a, (#_player_y)
	add	a, #0x03
	ld	hl, #_player_x
	ld	b, (hl)
	inc	b
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:249: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/main.c:250: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00105$
;src/main.c:251: set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
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
;src/main.c:253: set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
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
;src/main.c:257: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
	ld	hl, #_player_y
	ld	b, (hl)
	inc	b
	ld	a, (#_player_x)
	inc	a
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:258: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/main.c:259: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00115$
;src/main.c:260: set_bkg_tiles(4,0,2,9,door2_l_bkg);
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
;src/main.c:262: set_bkg_tiles(4,0,2,9,wall2_l_bkg);
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
;src/main.c:265: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+2);
	ld	a, (#_player_y)
	add	a, #0x02
	ld	hl, #_player_x
	ld	b, (hl)
	inc	b
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:266: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/main.c:267: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00118$
;src/main.c:268: set_bkg_tiles(1,0,5,9,nowall_door2_l_bkg);
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
;src/main.c:270: set_bkg_tiles(1,0,5,9,nowall2_l_bkg);
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
;src/main.c:275: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y);
	ld	a, (#_player_x)
	inc	a
	push	bc
	push	de
	ld	hl, #_player_y
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:276: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/main.c:277: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00128$
;src/main.c:278: set_bkg_tiles(1,0,3,9,door1_l_bkg);
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
;src/main.c:280: set_bkg_tiles(1,0,3,9,wall1_l_bkg);
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
;src/main.c:283: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
	ld	hl, #_player_y
	ld	b, (hl)
	inc	b
	ld	a, (#_player_x)
	inc	a
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
;src/main.c:284: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/main.c:285: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00131$
;src/main.c:286: set_bkg_tiles(1,0,3,9,nowall_door1_l_bkg);
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
;src/main.c:288: set_bkg_tiles(1,0,3,9,nowall1_l_bkg);
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
;src/main.c:292: }
	pop	hl
	inc	sp
	jp	(hl)
;src/main.c:294: void check_l_walls_w(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght){
;	---------------------------------
; Function check_l_walls_w
; ---------------------------------
_check_l_walls_w::
	ld	c, a
;src/main.c:295: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y+1);
	ld	hl, #_player_y
	ld	b, (hl)
	inc	b
	ld	a, (#_player_x)
	dec	a
	dec	a
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:296: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/main.c:297: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00102$
;src/main.c:298: set_bkg_tiles(6,0,1,9,door3_l_bkg);
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
;src/main.c:300: set_bkg_tiles(6,0,1,9,wall3_l_bkg);
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
;src/main.c:303: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-3, player_y+1);
	ld	hl, #_player_y
	ld	b, (hl)
	inc	b
	ld	a, (#_player_x)
	add	a, #0xfd
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:304: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/main.c:305: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00105$
;src/main.c:306: set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
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
;src/main.c:308: set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
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
;src/main.c:312: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
	ld	hl, #_player_y
	ld	b, (hl)
	inc	b
	ld	a, (#_player_x)
	dec	a
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:313: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/main.c:314: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00115$
;src/main.c:315: set_bkg_tiles(4,0,2,9,door2_l_bkg);
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
;src/main.c:317: set_bkg_tiles(4,0,2,9,wall2_l_bkg);
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
;src/main.c:320: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y+1);
	ld	a, (#_player_y)
	inc	a
	ld	hl, #_player_x
	ld	b, (hl)
	dec	b
	dec	b
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:321: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/main.c:322: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00118$
;src/main.c:323: set_bkg_tiles(1,0,5,9,nowall_door2_l_bkg);
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
;src/main.c:325: set_bkg_tiles(1,0,5,9,nowall2_l_bkg);
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
;src/main.c:330: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y+1);
	ld	a, (#_player_y)
	inc	a
	push	bc
	push	de
	push	af
	inc	sp
	ld	a, (#_player_x)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:331: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/main.c:332: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00128$
;src/main.c:333: set_bkg_tiles(1,0,3,9,door1_l_bkg);
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
;src/main.c:335: set_bkg_tiles(1,0,3,9,wall1_l_bkg);
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
;src/main.c:338: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
	ld	hl, #_player_y
	ld	b, (hl)
	inc	b
	ld	a, (#_player_x)
	dec	a
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
;src/main.c:339: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/main.c:340: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00131$
;src/main.c:341: set_bkg_tiles(1,0,3,9,nowall_door1_l_bkg);
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
;src/main.c:343: set_bkg_tiles(1,0,3,9,nowall1_l_bkg);
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
;src/main.c:347: }
	pop	hl
	inc	sp
	jp	(hl)
;src/main.c:349: void check_r_walls_n(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght){
;	---------------------------------
; Function check_r_walls_n
; ---------------------------------
_check_r_walls_n::
	ld	c, a
;src/main.c:350: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-2);
	ld	hl, #_player_y
	ld	b, (hl)
	dec	b
	dec	b
	ld	a, (#_player_x)
	inc	a
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:351: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/main.c:352: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00102$
;src/main.c:353: set_bkg_tiles(13,0,1,9,door3_r_bkg);
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
;src/main.c:355: set_bkg_tiles(13,0,1,9,wall3_r_bkg);
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
;src/main.c:358: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-3);
	ld	a, (#_player_y)
	add	a, #0xfd
	ld	hl, #_player_x
	ld	b, (hl)
	inc	b
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:359: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/main.c:360: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00105$
;src/main.c:361: set_bkg_tiles(13,0,6,9,nowall_door3_r_bkg);
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
;src/main.c:363: set_bkg_tiles(13,0,6,9,nowall3_r_bkg);
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
;src/main.c:367: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
	ld	hl, #_player_y
	ld	b, (hl)
	dec	b
	ld	a, (#_player_x)
	inc	a
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:368: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/main.c:369: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00115$
;src/main.c:370: set_bkg_tiles(14,0,2,9,door2_r_bkg);
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
;src/main.c:372: set_bkg_tiles(14,0,2,9,wall2_r_bkg);
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
;src/main.c:375: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-2);
	ld	a, (#_player_y)
	dec	a
	dec	a
	ld	hl, #_player_x
	ld	b, (hl)
	inc	b
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:376: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/main.c:377: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00118$
;src/main.c:378: set_bkg_tiles(14,0,5,9,nowall_door2_r_bkg);
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
;src/main.c:380: set_bkg_tiles(14,0,5,9,nowall2_r_bkg);
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
;src/main.c:385: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y);
	ld	a, (#_player_x)
	inc	a
	push	bc
	push	de
	ld	hl, #_player_y
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:386: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/main.c:387: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00128$
;src/main.c:388: set_bkg_tiles(16,0,3,9,door1_r_bkg);
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
;src/main.c:390: set_bkg_tiles(16,0,3,9,wall1_r_bkg);
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
;src/main.c:393: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
	ld	hl, #_player_y
	ld	b, (hl)
	dec	b
	ld	a, (#_player_x)
	inc	a
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
;src/main.c:394: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/main.c:395: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00131$
;src/main.c:396: set_bkg_tiles(16,0,3,9,nowall_door1_r_bkg);
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
;src/main.c:398: set_bkg_tiles(16,0,3,9,nowall1_r_bkg);
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
;src/main.c:402: }
	pop	hl
	inc	sp
	jp	(hl)
;src/main.c:404: void check_r_walls_e(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght){
;	---------------------------------
; Function check_r_walls_e
; ---------------------------------
_check_r_walls_e::
	ld	c, a
;src/main.c:405: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y+1);
	ld	hl, #_player_y
	ld	b, (hl)
	inc	b
	ld	a, (#_player_x)
	add	a, #0x02
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:406: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/main.c:407: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00102$
;src/main.c:408: set_bkg_tiles(13,0,1,9,door3_r_bkg);
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
;src/main.c:410: set_bkg_tiles(13,0,1,9,wall3_r_bkg);
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
;src/main.c:413: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+3, player_y+1);
	ld	hl, #_player_y
	ld	b, (hl)
	inc	b
	ld	a, (#_player_x)
	add	a, #0x03
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:414: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/main.c:415: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00105$
;src/main.c:416: set_bkg_tiles(13,0,6,9,nowall_door3_r_bkg);
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
;src/main.c:418: set_bkg_tiles(13,0,6,9,nowall3_r_bkg);
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
;src/main.c:422: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
	ld	hl, #_player_y
	ld	b, (hl)
	inc	b
	ld	a, (#_player_x)
	inc	a
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:423: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/main.c:424: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00115$
;src/main.c:425: set_bkg_tiles(14,0,2,9,door2_r_bkg);
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
;src/main.c:427: set_bkg_tiles(14,0,2,9,wall2_r_bkg);
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
;src/main.c:430: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y+1);
	ld	a, (#_player_y)
	inc	a
	ld	hl, #_player_x
	ld	b, (hl)
	inc	b
	inc	b
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:431: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/main.c:432: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00118$
;src/main.c:433: set_bkg_tiles(14,0,5,9,nowall_door2_r_bkg);
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
;src/main.c:435: set_bkg_tiles(14,0,5,9,nowall2_r_bkg);
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
;src/main.c:440: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y+1);
	ld	a, (#_player_y)
	inc	a
	push	bc
	push	de
	push	af
	inc	sp
	ld	a, (#_player_x)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:441: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/main.c:442: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00128$
;src/main.c:443: set_bkg_tiles(16,0,3,9,door1_r_bkg);
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
;src/main.c:445: set_bkg_tiles(16,0,3,9,wall1_r_bkg);
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
;src/main.c:448: w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
	ld	hl, #_player_y
	ld	b, (hl)
	inc	b
	ld	a, (#_player_x)
	inc	a
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
;src/main.c:449: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/main.c:450: if( w == 0x04){
	sub	a, #0x04
	jr	NZ, 00131$
;src/main.c:451: set_bkg_tiles(16,0,3,9,nowall_door1_r_bkg);
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
;src/main.c:453: set_bkg_tiles(16,0,3,9,nowall1_r_bkg);
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
;src/main.c:457: }
	pop	hl
	inc	sp
	jp	(hl)
;src/main.c:459: void check_r_walls_s(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght){
;	---------------------------------
; Function check_r_walls_s
; ---------------------------------
_check_r_walls_s::
	ld	c, a
;src/main.c:460: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+2);
	ld	hl, #_player_y
	ld	b, (hl)
	inc	b
	inc	b
	ld	a, (#_player_x)
	dec	a
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:461: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/main.c:462: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00102$
;src/main.c:463: set_bkg_tiles(13,0,1,9,door3_r_bkg);
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
;src/main.c:465: set_bkg_tiles(13,0,1,9,wall3_r_bkg);
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
;src/main.c:468: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+3);
	ld	a, (#_player_y)
	add	a, #0x03
	ld	hl, #_player_x
	ld	b, (hl)
	dec	b
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:469: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/main.c:470: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00105$
;src/main.c:471: set_bkg_tiles(13,0,6,9,nowall_door3_r_bkg);
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
;src/main.c:473: set_bkg_tiles(13,0,6,9,nowall3_r_bkg);
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
;src/main.c:477: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
	ld	hl, #_player_y
	ld	b, (hl)
	inc	b
	ld	a, (#_player_x)
	dec	a
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:478: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/main.c:479: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00115$
;src/main.c:480: set_bkg_tiles(14,0,2,9,door2_r_bkg);
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
;src/main.c:482: set_bkg_tiles(14,0,2,9,wall2_r_bkg);
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
;src/main.c:485: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+2);
	ld	a, (#_player_y)
	add	a, #0x02
	ld	hl, #_player_x
	ld	b, (hl)
	dec	b
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:486: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/main.c:487: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00118$
;src/main.c:488: set_bkg_tiles(14,0,5,9,nowall_door2_r_bkg);
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
;src/main.c:490: set_bkg_tiles(14,0,5,9,nowall2_r_bkg);
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
;src/main.c:495: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y);
	ld	a, (#_player_x)
	dec	a
	push	bc
	push	de
	ld	hl, #_player_y
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:496: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/main.c:497: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00128$
;src/main.c:498: set_bkg_tiles(16,0,3,9,door1_r_bkg);
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
;src/main.c:500: set_bkg_tiles(16,0,3,9,wall1_r_bkg);
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
;src/main.c:503: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
	ld	hl, #_player_y
	ld	b, (hl)
	inc	b
	ld	a, (#_player_x)
	dec	a
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
;src/main.c:504: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/main.c:505: if( w == 0x05){
	sub	a, #0x05
	jr	NZ, 00131$
;src/main.c:506: set_bkg_tiles(16,0,3,9,nowall_door1_r_bkg);
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
;src/main.c:508: set_bkg_tiles(16,0,3,9,nowall1_r_bkg);
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
;src/main.c:512: }
	pop	hl
	inc	sp
	jp	(hl)
;src/main.c:514: void check_r_walls_w(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght){
;	---------------------------------
; Function check_r_walls_w
; ---------------------------------
_check_r_walls_w::
	ld	c, a
;src/main.c:515: unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y-1);
	ld	hl, #_player_y
	ld	b, (hl)
	dec	b
	ld	a, (#_player_x)
	dec	a
	dec	a
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:516: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00111$
	cp	a, #0x01
	jr	Z, 00111$
;src/main.c:517: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00102$
;src/main.c:518: set_bkg_tiles(13,0,1,9,door3_r_bkg);
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
;src/main.c:520: set_bkg_tiles(13,0,1,9,wall3_r_bkg);
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
;src/main.c:523: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-3, player_y-1);
	ld	hl, #_player_y
	ld	b, (hl)
	dec	b
	ld	a, (#_player_x)
	add	a, #0xfd
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:524: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00112$
	cp	a, #0x01
	jr	Z, 00112$
;src/main.c:525: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00105$
;src/main.c:526: set_bkg_tiles(13,0,6,9,nowall_door3_r_bkg);
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
;src/main.c:528: set_bkg_tiles(13,0,6,9,nowall3_r_bkg);
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
;src/main.c:532: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
	ld	hl, #_player_y
	ld	b, (hl)
	dec	b
	ld	a, (#_player_x)
	dec	a
	push	bc
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:533: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00124$
	cp	a, #0x01
	jr	Z, 00124$
;src/main.c:534: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00115$
;src/main.c:535: set_bkg_tiles(14,0,2,9,door2_r_bkg);
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
;src/main.c:537: set_bkg_tiles(14,0,2,9,wall2_r_bkg);
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
;src/main.c:540: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y-1);
	ld	a, (#_player_y)
	dec	a
	ld	hl, #_player_x
	ld	b, (hl)
	dec	b
	dec	b
	push	bc
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:541: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00125$
	cp	a, #0x01
	jr	Z, 00125$
;src/main.c:542: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00118$
;src/main.c:543: set_bkg_tiles(14,0,5,9,nowall_door2_r_bkg);
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
;src/main.c:545: set_bkg_tiles(14,0,5,9,nowall2_r_bkg);
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
;src/main.c:550: w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y-1);
	ld	a, (#_player_y)
	dec	a
	push	bc
	push	de
	push	af
	inc	sp
	ld	a, (#_player_x)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
	pop	de
	pop	bc
;src/main.c:551: if(w!=0x00 && w != 0x01){
	or	a, a
	jr	Z, 00137$
	cp	a, #0x01
	jr	Z, 00137$
;src/main.c:552: if( w == 0x03){
	sub	a, #0x03
	jr	NZ, 00128$
;src/main.c:553: set_bkg_tiles(16,0,3,9,door1_r_bkg);
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
;src/main.c:555: set_bkg_tiles(16,0,3,9,wall1_r_bkg);
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
;src/main.c:558: w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
	ld	hl, #_player_y
	ld	b, (hl)
	dec	b
	ld	a, (#_player_x)
	dec	a
	push	bc
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_return_value
;src/main.c:559: if(w != 0x00 && w != 0x01){
	or	a, a
	jr	Z, 00140$
	cp	a, #0x01
	jr	Z, 00140$
;src/main.c:560: if( w == 0x06){
	sub	a, #0x06
	jr	NZ, 00131$
;src/main.c:561: set_bkg_tiles(16,0,3,9,nowall_door1_r_bkg);
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
;src/main.c:563: set_bkg_tiles(16,0,3,9,nowall1_r_bkg);
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
;src/main.c:567: }
	pop	hl
	inc	sp
	jp	(hl)
;src/main.c:669: void update_dng(unsigned char *dng,uint8_t dungeon_width, uint8_t dungeon_hieght){
;	---------------------------------
; Function update_dng
; ---------------------------------
_update_dng::
	ld	c, a
;src/main.c:672: set_bkg_tiles(0,0,20,16,white_screen);
	push	de
	ld	hl, #_white_screen
	push	hl
	ld	hl, #0x1014
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
;src/main.c:674: switch (player_dir){
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
	jr	Z, 00103$
	jp	00106$
;src/main.c:675: case north:
00101$:
;src/main.c:676: check_l_walls_n(dng,dungeon_width,dungeon_hieght);
	push	bc
	push	de
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_l_walls_n
	pop	de
	pop	bc
;src/main.c:677: check_r_walls_n(dng,dungeon_width,dungeon_hieght);
	push	bc
	push	de
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_r_walls_n
	pop	de
	pop	bc
;src/main.c:678: check_m_walls(dng,dungeon_width,dungeon_hieght,0,-1);
	ld	hl, #0xff00
	push	hl
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_m_walls
;src/main.c:680: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:681: break;
	jp	00106$
;src/main.c:682: case south:
00102$:
;src/main.c:683: check_l_walls_s(dng,dungeon_width,dungeon_hieght);
	push	bc
	push	de
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_l_walls_s
	pop	de
	pop	bc
;src/main.c:684: check_r_walls_s(dng,dungeon_width,dungeon_hieght);
	push	bc
	push	de
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_r_walls_s
	pop	de
	pop	bc
;src/main.c:685: check_m_walls(dng,dungeon_width,dungeon_hieght,0,+1);
	xor	a, a
	inc	a
	push	af
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_m_walls
;src/main.c:686: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:687: break;
	jr	00106$
;src/main.c:688: case west:
00103$:
;src/main.c:689: check_l_walls_w(dng,dungeon_width,dungeon_hieght);
	push	bc
	push	de
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_l_walls_w
	pop	de
	pop	bc
;src/main.c:690: check_r_walls_w(dng,dungeon_width,dungeon_hieght);
	push	bc
	push	de
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_r_walls_w
	pop	de
	pop	bc
;src/main.c:691: check_m_walls(dng,dungeon_width,dungeon_hieght,-1,0);
	ld	hl, #0xff
	push	hl
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_m_walls
;src/main.c:694: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:695: break;
	jr	00106$
;src/main.c:696: case east:
00104$:
;src/main.c:697: check_l_walls_e(dng,dungeon_width,dungeon_hieght);
	push	bc
	push	de
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_l_walls_e
	pop	de
	pop	bc
;src/main.c:698: check_r_walls_e(dng,dungeon_width,dungeon_hieght);
	push	bc
	push	de
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_r_walls_e
	pop	de
	pop	bc
;src/main.c:699: check_m_walls(dng,dungeon_width,dungeon_hieght,+1,0);
	ld	hl, #0x01
	push	hl
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_check_m_walls
;src/main.c:701: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:703: }
00106$:
;src/main.c:705: }
	pop	hl
	inc	sp
	jp	(hl)
;src/main.c:708: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:710: init_gfx();
	call	_init_gfx
;src/main.c:711: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:712: set_sprite_data(0,4,news);
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
;src/main.c:713: set_sprite_tile(0,player_dir);
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
;src/main.c:715: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:717: while(1) {
00128$:
;src/main.c:719: joypadPrevious = joypadCurrent;
	ld	a, (#_joypadCurrent)
	ld	(#_joypadPrevious),a
;src/main.c:720: joypadCurrent = joypad();
	call	_joypad
	ld	hl, #_joypadCurrent
	ld	(hl), a
;src/main.c:722: if((joypadCurrent & J_LEFT) && !(joypadPrevious & J_LEFT)){
	bit	1, (hl)
	jr	Z, 00104$
	ld	a, (#_joypadPrevious)
	bit	1, a
	jr	NZ, 00104$
;src/main.c:723: player_dir--;
	ld	hl, #_player_dir
	dec	(hl)
;src/main.c:724: if (player_dir==255){
	ld	a, (hl)
	inc	a
	jr	NZ, 00102$
;src/main.c:725: player_dir = west;
	ld	hl, #_player_dir
	ld	(hl), #0x03
00102$:
;src/main.c:727: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:728: set_sprite_tile(0,player_dir);
	ld	hl, #_player_dir
	ld	c, (hl)
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;src/main.c:728: set_sprite_tile(0,player_dir);
00104$:
;src/main.c:730: if((joypadCurrent & J_RIGHT) && !(joypadPrevious & J_RIGHT)){
	ld	a, (#_joypadCurrent)
	rrca
	jr	NC, 00109$
	ld	a, (#_joypadPrevious)
	rrca
	jr	C, 00109$
;src/main.c:731: player_dir++;
	ld	hl, #_player_dir
	inc	(hl)
;src/main.c:732: if(player_dir==4){
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00107$
;src/main.c:733: player_dir=north;
	ld	hl, #_player_dir
	ld	(hl), #0x00
00107$:
;src/main.c:735: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:736: set_sprite_tile(0,player_dir);
	ld	hl, #_player_dir
	ld	c, (hl)
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;src/main.c:736: set_sprite_tile(0,player_dir);
00109$:
;src/main.c:738: if((joypadCurrent & J_UP) && !(joypadPrevious & J_UP)){
	ld	a, (#_joypadCurrent)
	bit	2, a
	jr	Z, 00117$
	ld	a, (#_joypadPrevious)
	bit	2, a
	jr	NZ, 00117$
;src/main.c:739: switch(player_dir){
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
;src/main.c:740: case north:
00111$:
;src/main.c:741: player_y--;
	ld	hl, #_player_y
	dec	(hl)
;src/main.c:742: break;
	jr	00115$
;src/main.c:743: case east:
00112$:
;src/main.c:744: player_x++;
	ld	hl, #_player_x
	inc	(hl)
;src/main.c:745: break;
	jr	00115$
;src/main.c:746: case south:
00113$:
;src/main.c:747: player_y++;
	ld	hl, #_player_y
	inc	(hl)
;src/main.c:748: break;
	jr	00115$
;src/main.c:749: case west:
00114$:
;src/main.c:750: player_x--;
	ld	hl, #_player_x
	dec	(hl)
;src/main.c:752: }
00115$:
;src/main.c:753: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:754: set_sprite_tile(0,player_dir);
	ld	hl, #_player_dir
	ld	c, (hl)
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;src/main.c:754: set_sprite_tile(0,player_dir);
00117$:
;src/main.c:756: if((joypadCurrent & J_DOWN) && !(joypadPrevious & J_DOWN)){
	ld	a, (#_joypadCurrent)
	bit	3, a
	jr	Z, 00125$
	ld	a, (#_joypadPrevious)
	bit	3, a
	jr	NZ, 00125$
;src/main.c:757: switch(player_dir){
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
;src/main.c:758: case north:
00119$:
;src/main.c:759: player_y++;
	ld	hl, #_player_y
	inc	(hl)
;src/main.c:760: break;
	jr	00123$
;src/main.c:761: case east:
00120$:
;src/main.c:762: player_x--;
	ld	hl, #_player_x
	dec	(hl)
;src/main.c:763: break;
	jr	00123$
;src/main.c:764: case south:
00121$:
;src/main.c:765: player_y--;
	ld	hl, #_player_y
	dec	(hl)
;src/main.c:766: break;
	jr	00123$
;src/main.c:767: case west:
00122$:
;src/main.c:768: player_x++;
	ld	hl, #_player_x
	inc	(hl)
;src/main.c:770: }
00123$:
;src/main.c:771: update_dng(test_dungeon,15,15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	a, #0x0f
	ld	de, #_test_dungeon
	call	_update_dng
;src/main.c:772: set_sprite_tile(0,player_dir);
	ld	hl, #_player_dir
	ld	c, (hl)
;../gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;src/main.c:772: set_sprite_tile(0,player_dir);
00125$:
;src/main.c:784: wait_vbl_done();
	call	_wait_vbl_done
;src/main.c:786: }
	jp	00128$
	.area _CODE
	.area _INITIALIZER
__xinit__player_x:
	.db #0x00	; 0
__xinit__player_y:
	.db #0x00	; 0
__xinit__player_dir:
	.db #0x00	; 0
__xinit__dist:
	.db #0x00	; 0
__xinit__joypadCurrent:
	.db #0x00	; 0
__xinit__joypadPrevious:
	.db #0x00	; 0
	.area _CABS (ABS)
