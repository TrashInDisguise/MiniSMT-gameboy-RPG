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
	C$font.c$7$0_0$119	= .
	.globl	C$font.c$7$0_0$119
;res/font.c:7: unsigned char* return_letter(uint8_t letter){
;	---------------------------------
; Function return_letter
; ---------------------------------
_return_letter::
	ld	e, a
	C$font.c$8$1_0$119	= .
	.globl	C$font.c$8$1_0$119
;res/font.c:8: return font[letter-32];
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
	C$font.c$9$1_0$119	= .
	.globl	C$font.c$9$1_0$119
;res/font.c:9: }
	C$font.c$9$1_0$119	= .
	.globl	C$font.c$9$1_0$119
	XG$return_letter$0$0	= .
	.globl	XG$return_letter$0$0
	ret
	G$load_string$0$0	= .
	.globl	G$load_string$0$0
	C$font.c$12$1_0$121	= .
	.globl	C$font.c$12$1_0$121
;res/font.c:12: void load_string(unsigned char *str,uint8_t str_size){
;	---------------------------------
; Function load_string
; ---------------------------------
_load_string::
	C$font.c$14$1_0$121	= .
	.globl	C$font.c$14$1_0$121
;res/font.c:14: if(str_size<33){
	ld	c, a
	sub	a, #0x21
	jr	NC, 00116$
	C$font.c$15$1_0$121	= .
	.globl	C$font.c$15$1_0$121
;res/font.c:15: for(i=0; i<str_size;i++){
	ld	b, #0x00
00107$:
	ld	a, b
	sub	a, c
	ret	NC
	C$font.c$16$4_0$124	= .
	.globl	C$font.c$16$4_0$124
;res/font.c:16: set_bkg_data(DLG_WIN_MEM_ADR+i,1,return_letter(str[i]));
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
	C$font.c$15$3_0$123	= .
	.globl	C$font.c$15$3_0$123
;res/font.c:15: for(i=0; i<str_size;i++){
	inc	b
	jr	00107$
	C$font.c$19$1_0$121	= .
	.globl	C$font.c$19$1_0$121
;res/font.c:19: for(i=0; i<32;i++){
00116$:
	ld	c, #0x00
00109$:
	C$font.c$20$4_0$127	= .
	.globl	C$font.c$20$4_0$127
;res/font.c:20: set_bkg_data(DLG_WIN_MEM_ADR+i,1,return_letter(str[i]));
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
	C$font.c$19$3_0$126	= .
	.globl	C$font.c$19$3_0$126
;res/font.c:19: for(i=0; i<32;i++){
	inc	c
	ld	a, c
	sub	a, #0x20
	jr	C, 00109$
	C$font.c$23$1_0$121	= .
	.globl	C$font.c$23$1_0$121
;res/font.c:23: }
	C$font.c$23$1_0$121	= .
	.globl	C$font.c$23$1_0$121
	XG$load_string$0$0	= .
	.globl	XG$load_string$0$0
	ret
	G$pull_letters$0$0	= .
	.globl	G$pull_letters$0$0
	C$font.c$26$1_0$129	= .
	.globl	C$font.c$26$1_0$129
;res/font.c:26: void pull_letters(unsigned char *str,const uint8_t str_size,const uint8_t vram_adr){
;	---------------------------------
; Function pull_letters
; ---------------------------------
_pull_letters::
	add	sp, #-128
	add	sp, #-10
	ld	hl, #133
	add	hl, sp
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
	ld	(hl), a
	C$font.c$29$2_0$129	= .
	.globl	C$font.c$29$2_0$129
;res/font.c:29: uint8_t temp=0;
	ld	hl, #135
	add	hl, sp
	C$font.c$31$1_0$129	= .
	.globl	C$font.c$31$1_0$129
;res/font.c:31: ustr[0] = str[0];
	xor	a, a
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl), a
	C$font.c$33$2_0$129	= .
	.globl	C$font.c$33$2_0$129
;res/font.c:33: for(i=1;i<str_size;i++){
	ld	hl, #136
	add	hl, sp
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x01
00111$:
	ld	hl, #137
	add	hl, sp
	ld	a, (hl)
	ld	hl, #132
	add	hl, sp
	sub	a, (hl)
	jp	NC, 00126$
	C$font.c$34$2_0$129	= .
	.globl	C$font.c$34$2_0$129
;res/font.c:34: for(j=0;j<=new_size;j++){
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #137
	add	hl, sp
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ld	hl, #130
	add	hl, sp
	ld	(hl), a
	pop	hl
	ld	a, h
	ld	hl, #129
	add	hl, sp
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	ld	c, #0x00
00108$:
	C$font.c$35$5_0$133	= .
	.globl	C$font.c$35$5_0$133
;res/font.c:35: if(str[i]==ustr[j]) {temp++; break;}
	ld	hl,#0x82
	add	hl,sp
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ld	e, c
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	e, (hl)
	ld	a, b
	sub	a, e
	jr	NZ, 00109$
	ld	hl, #135
	add	hl, sp
	inc	(hl)
	jr	00103$
00109$:
	C$font.c$34$4_0$132	= .
	.globl	C$font.c$34$4_0$132
;res/font.c:34: for(j=0;j<=new_size;j++){
	inc	c
	ld	hl, #136
	add	hl, sp
	ld	a, (hl)
	sub	a, c
	jr	NC, 00108$
00103$:
	C$font.c$37$3_0$131	= .
	.globl	C$font.c$37$3_0$131
;res/font.c:37: if(temp==0){
	ld	hl, #135
	add	hl, sp
	ld	a, (hl)
	or	a, a
	jr	NZ, 00105$
	C$font.c$38$4_0$135	= .
	.globl	C$font.c$38$4_0$135
;res/font.c:38: new_size++;
	inc	hl
	inc	(hl)
	C$font.c$39$4_0$135	= .
	.globl	C$font.c$39$4_0$135
;res/font.c:39: ustr[new_size]=str[i];
	push	hl
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ld	hl, #136
	add	hl, sp
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ld	hl, #132
	add	hl, sp
	ld	(hl), a
	pop	hl
	ld	a, h
	ld	hl, #131
	add	hl, sp
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00105$:
	C$font.c$41$3_0$131	= .
	.globl	C$font.c$41$3_0$131
;res/font.c:41: temp=0;
	ld	hl, #135
	add	hl, sp
	C$font.c$33$2_0$130	= .
	.globl	C$font.c$33$2_0$130
;res/font.c:33: for(i=1;i<str_size;i++){
	xor	a, a
	ld	(hl+), a
	inc	hl
	inc	(hl)
	jp	00111$
00126$:
	ld	hl, #136
	add	hl, sp
	ld	c, (hl)
	C$font.c$43$1_0$129	= .
	.globl	C$font.c$43$1_0$129
;res/font.c:43: set_bkg_data(vram_adr,1,return_letter(ustr[0]));
	ldhl	sp,	#0
	ld	b, (hl)
	push	bc
	ld	a, b
	call	_return_letter
	ld	e, c
	ld	d, b
	pop	bc
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #143
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
	C$font.c$44$2_0$129	= .
	.globl	C$font.c$44$2_0$129
;res/font.c:44: for(i=2; i<new_size;i++){
	ld	b, #0x02
00114$:
	ld	a, b
	sub	a, c
	jr	NC, 00116$
	C$font.c$45$3_0$137	= .
	.globl	C$font.c$45$3_0$137
;res/font.c:45: set_bkg_data(vram_adr+i-1,1,return_letter(ustr[i]));
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
	ld	hl, #140
	add	hl, sp
	ld	a, (hl)
	add	a, b
	dec	a
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
	C$font.c$44$2_0$136	= .
	.globl	C$font.c$44$2_0$136
;res/font.c:44: for(i=2; i<new_size;i++){
	inc	b
	jr	00114$
00116$:
	C$font.c$48$2_0$129	= .
	.globl	C$font.c$48$2_0$129
;res/font.c:48: }
	add	sp, #127
	add	sp, #11
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
