;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (Linux)
;--------------------------------------------------------
	.module font
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _font
	.globl _set_bkg_data
	.globl _return_letter
	.globl _load_string
	.globl _pull_letters
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
	G$return_letter$0$0	= .
	.globl	G$return_letter$0$0
	C$font.c$8$0_0$126	= .
	.globl	C$font.c$8$0_0$126
;res/font.c:8: unsigned char* return_letter(uint8_t letter){
;	---------------------------------
; Function return_letter
; ---------------------------------
_return_letter::
	ld	e, a
	C$font.c$9$1_0$126	= .
	.globl	C$font.c$9$1_0$126
;res/font.c:9: return font[letter-32];
	ld	bc, #_font+0
	ld	d, #0x00
	ld	a, e
	add	a, #0xe0
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	adc	a, #0xff
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	C$font.c$10$1_0$126	= .
	.globl	C$font.c$10$1_0$126
;res/font.c:10: }
	C$font.c$10$1_0$126	= .
	.globl	C$font.c$10$1_0$126
	XG$return_letter$0$0	= .
	.globl	XG$return_letter$0$0
	ret
	G$load_string$0$0	= .
	.globl	G$load_string$0$0
	C$font.c$13$1_0$128	= .
	.globl	C$font.c$13$1_0$128
;res/font.c:13: void load_string(unsigned char *str,uint8_t str_size){
;	---------------------------------
; Function load_string
; ---------------------------------
_load_string::
	C$font.c$15$1_0$128	= .
	.globl	C$font.c$15$1_0$128
;res/font.c:15: if(str_size<33){
	ld	c, a
	sub	a, #0x21
	jr	NC, 00116$
	C$font.c$16$1_0$128	= .
	.globl	C$font.c$16$1_0$128
;res/font.c:16: for(i=0; i<str_size;i++){
	ld	b, #0x00
00107$:
	ld	a, b
	sub	a, c
	ret	NC
	C$font.c$17$4_0$131	= .
	.globl	C$font.c$17$4_0$131
;res/font.c:17: set_bkg_data(DLG_WIN_MEM_ADR+i,1,return_letter(str[i]));
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_return_letter
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	pop	de
	pop	bc
	ld	a, b
	add	a, #0xe0
	push	de
	push	hl
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
	pop	de
	C$font.c$16$3_0$130	= .
	.globl	C$font.c$16$3_0$130
;res/font.c:16: for(i=0; i<str_size;i++){
	inc	b
	jr	00107$
	C$font.c$20$1_0$128	= .
	.globl	C$font.c$20$1_0$128
;res/font.c:20: for(i=0; i<32;i++){
00116$:
	ld	c, #0x00
00109$:
	C$font.c$21$4_0$134	= .
	.globl	C$font.c$21$4_0$134
;res/font.c:21: set_bkg_data(DLG_WIN_MEM_ADR+i,1,return_letter(str[i]));
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	b, (hl)
	push	bc
	push	de
	ld	a, b
	call	_return_letter
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	pop	de
	pop	bc
	ld	a, c
	add	a, #0xe0
	push	de
	push	hl
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
	pop	de
	C$font.c$20$3_0$133	= .
	.globl	C$font.c$20$3_0$133
;res/font.c:20: for(i=0; i<32;i++){
	inc	c
	ld	a, c
	sub	a, #0x20
	jr	C, 00109$
	C$font.c$24$1_0$128	= .
	.globl	C$font.c$24$1_0$128
;res/font.c:24: }
	C$font.c$24$1_0$128	= .
	.globl	C$font.c$24$1_0$128
	XG$load_string$0$0	= .
	.globl	XG$load_string$0$0
	ret
	G$pull_letters$0$0	= .
	.globl	G$pull_letters$0$0
	C$font.c$27$1_0$136	= .
	.globl	C$font.c$27$1_0$136
;res/font.c:27: unsigned char* pull_letters(unsigned char *str,const uint8_t str_size,const uint8_t vram_adr){
;	---------------------------------
; Function pull_letters
; ---------------------------------
_pull_letters::
	add	sp, #-128
	add	sp, #-73
	ld	hl, #196
	add	hl, sp
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
	ld	(hl), a
	C$font.c$33$5_0$140	= .
	.globl	C$font.c$33$5_0$140
;res/font.c:33: for(i = 0; i < str_size; i++){
	ld	hl, #198
	add	hl, sp
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
00116$:
	ld	hl, #199
	add	hl, sp
	ld	a, (hl)
	ld	hl, #195
	add	hl, sp
	sub	a, (hl)
	jr	NC, 00145$
	C$font.c$34$3_0$138	= .
	.globl	C$font.c$34$3_0$138
;res/font.c:34: curr = str[i];
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	hl, #192
	add	hl, sp
	ld	(hl), a
	C$font.c$35$1_0$136	= .
	.globl	C$font.c$35$1_0$136
;res/font.c:35: for (j = 0; j < n; j++){
	ld	hl, #200
	add	hl, sp
	ld	(hl), #0x00
00113$:
	ld	hl, #200
	add	hl, sp
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	jr	NC, 00103$
	C$font.c$36$5_0$140	= .
	.globl	C$font.c$36$5_0$140
;res/font.c:36: if (unique_list[j] == curr) break;
	push	hl
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ld	hl, #200
	add	hl, sp
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ld	hl, #195
	add	hl, sp
	ld	(hl), a
	pop	hl
	ld	a, h
	ld	hl, #194
	add	hl, sp
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	a, (hl)
	sub	a, b
	jr	Z, 00103$
	C$font.c$35$4_0$139	= .
	.globl	C$font.c$35$4_0$139
;res/font.c:35: for (j = 0; j < n; j++){
	ld	hl, #200
	add	hl, sp
	inc	(hl)
	jr	00113$
00103$:
	C$font.c$38$3_0$138	= .
	.globl	C$font.c$38$3_0$138
;res/font.c:38: if(j == n) unique_list[n++] = curr;
	ld	hl, #200
	add	hl, sp
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	jr	NZ, 00117$
	ld	hl, #198
	add	hl, sp
	ld	e, (hl)
	inc	(hl)
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #192
	add	hl, sp
	ld	a, (hl)
	ld	(bc), a
00117$:
	C$font.c$33$2_0$137	= .
	.globl	C$font.c$33$2_0$137
;res/font.c:33: for(i = 0; i < str_size; i++){
	ld	hl, #199
	add	hl, sp
	inc	(hl)
	jp	00116$
00145$:
	ld	hl, #198
	add	hl, sp
	ld	c, (hl)
	C$font.c$40$3_0$142	= .
	.globl	C$font.c$40$3_0$142
;res/font.c:40: for(i=0; i<n;i++){
	ld	b, #0x00
00119$:
	ld	a, b
	sub	a, c
	jr	NC, 00107$
	C$font.c$41$3_0$142	= .
	.globl	C$font.c$41$3_0$142
;res/font.c:41: set_bkg_data(vram_adr+i,1,return_letter(unique_list[i]));
	ld	e, b
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	e, (hl)
	push	bc
	ld	a, e
	call	_return_letter
	ld	e, c
	ld	d, b
	pop	bc
	ld	hl, #203
	add	hl, sp
	ld	a, (hl)
	add	a, b
	push	de
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
	C$font.c$40$2_0$141	= .
	.globl	C$font.c$40$2_0$141
;res/font.c:40: for(i=0; i<n;i++){
	inc	b
	jr	00119$
00107$:
	C$font.c$43$6_0$147	= .
	.globl	C$font.c$43$6_0$147
;res/font.c:43: for(i=0;i<str_size;i++){
	ld	hl, #200
	add	hl, sp
	ld	(hl), #0x00
00125$:
	ld	hl, #200
	add	hl, sp
	ld	a, (hl)
	ld	hl, #195
	add	hl, sp
	sub	a, (hl)
	jr	NC, 00111$
	C$font.c$44$5_0$146	= .
	.globl	C$font.c$44$5_0$146
;res/font.c:44: for(j=0;j<n;j++){
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #200
	add	hl, sp
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ld	hl, #195
	add	hl, sp
	ld	(hl), a
	pop	hl
	ld	a, h
	ld	hl, #194
	add	hl, sp
	ld	(hl), a
	ld	b, #0x00
00122$:
	ld	a, b
	sub	a, c
	jr	NC, 00126$
	C$font.c$45$5_0$146	= .
	.globl	C$font.c$45$5_0$146
;res/font.c:45: if(str[i]==unique_list[j]){
	ld	hl,#0xc1
	add	hl,sp
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #199
	add	hl, sp
	ld	(hl), a
	ld	e, b
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	e, (hl)
	ld	hl, #199
	add	hl, sp
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00123$
	C$font.c$46$6_0$147	= .
	.globl	C$font.c$46$6_0$147
;res/font.c:46: tileset[i]=vram_adr+j;
	push	hl
	ld	hl, #98
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ld	hl, #200
	add	hl, sp
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #203
	add	hl, sp
	ld	a, (hl)
	add	a, b
	ld	(de), a
00123$:
	C$font.c$44$4_0$145	= .
	.globl	C$font.c$44$4_0$145
;res/font.c:44: for(j=0;j<n;j++){
	inc	b
	jr	00122$
00126$:
	C$font.c$43$2_0$143	= .
	.globl	C$font.c$43$2_0$143
;res/font.c:43: for(i=0;i<str_size;i++){
	ld	hl, #200
	add	hl, sp
	inc	(hl)
	jr	00125$
00111$:
	C$font.c$50$1_0$136	= .
	.globl	C$font.c$50$1_0$136
;res/font.c:50: return tileset;
	ld	hl, #96
	add	hl, sp
	ld	c, l
	ld	b, h
	C$font.c$51$1_0$136	= .
	.globl	C$font.c$51$1_0$136
;res/font.c:51: }
	add	sp, #127
	add	sp, #74
	pop	hl
	inc	sp
	jp	(hl)
	.area _CODE
G$font$0_0$0 == .
_font:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdb	; 219
	.db #0xdb	; 219
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xdb	; 219
	.db #0xdb	; 219
	.db #0xdb	; 219
	.db #0xdb	; 219
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xdb	; 219
	.db #0xdb	; 219
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xeb	; 235
	.db #0xeb	; 235
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xeb	; 235
	.db #0xeb	; 235
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xb9	; 185
	.db #0xb9	; 185
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x9e	; 158
	.db #0x9e	; 158
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xab	; 171
	.db #0xab	; 171
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xab	; 171
	.db #0xab	; 171
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xb9	; 185
	.db #0xb9	; 185
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xd3	; 211
	.db #0xd3	; 211
	.db #0xb3	; 179
	.db #0xb3	; 179
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xb9	; 185
	.db #0xb9	; 185
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xb9	; 185
	.db #0xb9	; 185
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xb9	; 185
	.db #0xb9	; 185
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x8d	; 141
	.db #0x8d	; 141
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xb1	; 177
	.db #0xb1	; 177
	.db #0xb9	; 185
	.db #0xb9	; 185
	.db #0xbd	; 189
	.db #0xbd	; 189
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xb9	; 185
	.db #0xb9	; 185
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x9b	; 155
	.db #0x9b	; 155
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xb9	; 185
	.db #0xb9	; 185
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9d	; 157
	.db #0x9d	; 157
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xb9	; 185
	.db #0xb9	; 185
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xa7	; 167
	.db #0xa7	; 167
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9b	; 155
	.db #0x9b	; 155
	.db #0x97	; 151
	.db #0x97	; 151
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x8d	; 141
	.db #0x8d	; 141
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xb1	; 177
	.db #0xb1	; 177
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x9b	; 155
	.db #0x9b	; 155
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xd9	; 217
	.db #0xd9	; 217
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xb9	; 185
	.db #0xb9	; 185
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x61	; 97	'a'
	.db #0x61	; 97	'a'
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xef	; 239
	.db #0xd7	; 215
	.db #0xd7	; 215
	.db #0xd7	; 215
	.db #0xd7	; 215
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0x7d	; 125
	.db #0x7d	; 125
	.db #0x01	; 1
	.db #0x01	; 1
	.area _INITIALIZER
	.area _CABS (ABS)
