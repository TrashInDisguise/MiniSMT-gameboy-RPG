/**
 * 8x8 monochrome bitmap fonts for rendering
 * Author: Daniel Hepper <daniel@hepper.net>
 *
 * License: Public Domain
 *
 * Based on:
 * // Summary: font8x8.h
 * // 8x8 monochrome bitmap fonts for rendering
 * //
 * // Author:
 * //     Marcel Sondaar
 * //     International Business Machines (public domain VGA fonts)
 * //
 * // License:
 * //     Public Domain
 *
 * Fetched from: http://dimensionalrift.homelinux.net/combuster/mos3/?p=viewsource&file=/modules/gfx/font8_8.asm
 **/

// Constant: font8x8_basic
// Contains an 8x8 font map for unicode points U+0000 - U+007F (basic latin)
#ifndef __FONT_H__
#define __FONT_H__
#include <stdint.h>
#include <gb/gb.h>
#define DLG_WIN_MEM_ADR 224
extern const unsigned char font[96][16];
unsigned char* return_letter(uint8_t letter);

void load_string(unsigned char *str,const uint8_t str_size);
void pull_letters(unsigned char *str,const uint8_t str_size, const uint8_t vram_adr);


#endif
