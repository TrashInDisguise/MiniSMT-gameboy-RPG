;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (Linux)
;--------------------------------------------------------
	.module dng_wip
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _dng_tileset
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
	.area _CODE
_dng_tileset:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x03	; 3
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xb0	; 176
	.db #0xb0	; 176
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0x0c	; 12
	.db #0xcc	; 204
	.db #0x03	; 3
	.db #0xc3	; 195
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x30	; 48	'0'
	.db #0x33	; 51	'3'
	.db #0xc0	; 192
	.db #0xc3	; 195
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0x31	; 49	'1'
	.db #0xb1	; 177
	.db #0x11	; 17
	.db #0x91	; 145
	.db #0x11	; 17
	.db #0x91	; 145
	.db #0x11	; 17
	.db #0x91	; 145
	.db #0x11	; 17
	.db #0x91	; 145
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x8c	; 140
	.db #0x8d	; 141
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0xd0	; 208
	.db #0xd0	; 208
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x11	; 17
	.db #0x91	; 145
	.db #0x11	; 17
	.db #0x91	; 145
	.db #0x11	; 17
	.db #0x91	; 145
	.db #0x11	; 17
	.db #0x91	; 145
	.db #0x11	; 17
	.db #0x91	; 145
	.db #0x11	; 17
	.db #0x91	; 145
	.db #0x11	; 17
	.db #0x91	; 145
	.db #0x11	; 17
	.db #0x91	; 145
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x11	; 17
	.db #0x91	; 145
	.db #0x11	; 17
	.db #0x91	; 145
	.db #0x11	; 17
	.db #0x91	; 145
	.db #0x11	; 17
	.db #0x91	; 145
	.db #0x13	; 19
	.db #0x93	; 147
	.db #0x1c	; 28
	.db #0x9c	; 156
	.db #0x30	; 48	'0'
	.db #0xb0	; 176
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0xc8	; 200
	.db #0xc9	; 201
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0xd0	; 208
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xb0	; 176
	.db #0xb0	; 176
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x03	; 3
	.db #0xc3	; 195
	.db #0x0c	; 12
	.db #0xcc	; 204
	.db #0x30	; 48	'0'
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc3	; 195
	.db #0x30	; 48	'0'
	.db #0x33	; 51	'3'
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x25	; 37
	.db #0x3d	; 61
	.db #0x25	; 37
	.db #0x3d	; 61
	.db #0x25	; 37
	.db #0x3d	; 61
	.db #0x25	; 37
	.db #0x3d	; 61
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0xa4	; 164
	.db #0xbc	; 188
	.db #0xa4	; 164
	.db #0xbc	; 188
	.db #0xa4	; 164
	.db #0xbc	; 188
	.db #0xa4	; 164
	.db #0xbc	; 188
	.db #0x25	; 37
	.db #0x3d	; 61
	.db #0x25	; 37
	.db #0x3d	; 61
	.db #0x25	; 37
	.db #0x3d	; 61
	.db #0x25	; 37
	.db #0x3d	; 61
	.db #0x25	; 37
	.db #0x3d	; 61
	.db #0x25	; 37
	.db #0x3d	; 61
	.db #0x25	; 37
	.db #0x3d	; 61
	.db #0x25	; 37
	.db #0x3d	; 61
	.db #0xa4	; 164
	.db #0xbc	; 188
	.db #0xa4	; 164
	.db #0xbc	; 188
	.db #0xa4	; 164
	.db #0xbc	; 188
	.db #0xa4	; 164
	.db #0xbc	; 188
	.db #0xa4	; 164
	.db #0xbc	; 188
	.db #0xa4	; 164
	.db #0xbc	; 188
	.db #0xa4	; 164
	.db #0xbc	; 188
	.db #0xa4	; 164
	.db #0xbc	; 188
	.db #0x27	; 39
	.db #0x3f	; 63
	.db #0x2c	; 44
	.db #0x3c	; 60
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe4	; 228
	.db #0xfc	; 252
	.db #0x34	; 52	'4'
	.db #0x3c	; 60
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x88	; 136
	.db #0x08	; 8
	.db #0x88	; 136
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
	.area _INITIALIZER
	.area _CABS (ABS)
