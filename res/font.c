#include "font.h"
#include <stdio.h>
#include <types.h>
//#include <string.h>
#include <stdlib.h>

//return one letter
unsigned char* return_letter(uint8_t letter){
    return font[letter-32];
}

//upload string to VRAM at 224. Only up to two lines 16 character each.
void load_string(unsigned char *str,uint8_t str_size){
    uint8_t i;
    if(str_size<33){
        for(i=0; i<str_size;i++){
            set_bkg_data(DLG_WIN_MEM_ADR+i,1,return_letter(str[i]));
        }
    }else{
        for(i=0; i<32;i++){
            set_bkg_data(DLG_WIN_MEM_ADR+i,1,return_letter(str[i]));
        }
    }
}

//upload only unique characters from string to VRAM at desired location and output tileset for inputed string
unsigned char* pull_letters(unsigned char *str,const uint8_t str_size,const uint8_t vram_adr){
    uint8_t i, j, n;
    unsigned char unique_list[96];
    unsigned char tileset[96];
    unsigned char curr;
    n = 0;
    for(i = 0; i < str_size; i++){
        curr = str[i];
        for (j = 0; j < n; j++){
            if (unique_list[j] == curr) break;
        }
        if(j == n) unique_list[n++] = curr;
    }
    for(i=0; i<n;i++){
        set_bkg_data(vram_adr+i,1,return_letter(unique_list[i]));
    }
    for(i=0;i<str_size;i++){
        for(j=0;j<n;j++){
            if(str[i]==unique_list[j]){
                tileset[i]=vram_adr+j;
            }
        }
    }
    return tileset;
}

const uint8_t font[96][16] =
    {
        // 0 - 31
        {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF},
        {0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xFF, 0xFF, 0xE7, 0xE7, 0xFF, 0xFF},
        {0x99, 0x99, 0x99, 0x99, 0xBB, 0xBB, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF},
        {0xFF, 0xFF, 0xDB, 0xDB, 0x81, 0x81, 0xDB, 0xDB, 0xDB, 0xDB, 0x81, 0x81, 0xDB, 0xDB, 0xFF, 0xFF},
        {0xEB, 0xEB, 0xC1, 0xC1, 0xAA, 0xAA, 0xC3, 0xC3, 0xE1, 0xE1, 0xAA, 0xAA, 0xC1, 0xC1, 0xEB, 0xEB},
        {0x9D, 0x9D, 0x99, 0x99, 0xF3, 0xF3, 0xE7, 0xE7, 0xCF, 0xCF, 0x99, 0x99, 0xB9, 0xB9, 0xFF, 0xFF},
        {0x87, 0x87, 0x33, 0x33, 0x9E, 0x9E, 0x31, 0x31, 0x33, 0x33, 0x33, 0x33, 0x87, 0x87, 0xFF, 0xFF},
        {0xE7, 0xE7, 0xE7, 0xE7, 0xEF, 0xEF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF},
        {0xF7, 0xF7, 0xEF, 0xEF, 0xCF, 0xCF, 0xCF, 0xCF, 0xCF, 0xCF, 0xCF, 0xCF, 0xEF, 0xEF, 0xF7, 0xF7},
        {0xDF, 0xDF, 0xEF, 0xEF, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xEF, 0xEF, 0xDF, 0xDF},
        {0xFF, 0xFF, 0xAB, 0xAB, 0xC7, 0xC7, 0x01, 0x01, 0xC7, 0xC7, 0xAB, 0xAB, 0xFF, 0xFF, 0xFF, 0xFF},
        {0xFF, 0xFF, 0xE7, 0xE7, 0xE7, 0xE7, 0x81, 0x81, 0xE7, 0xE7, 0xE7, 0xE7, 0xFF, 0xFF, 0xFF, 0xFF},
        {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xCF, 0xCF, 0xCF, 0xCF, 0xDF, 0xDF},
        {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xC3, 0xC3, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF},
        {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xE7, 0xE7, 0xE7, 0xE7, 0xFF, 0xFF},
        {0xFD, 0xFD, 0xF9, 0xF9, 0xF3, 0xF3, 0xE7, 0xE7, 0xCF, 0xCF, 0x9F, 0x9F, 0x3F, 0x3F, 0xFF, 0xFF},
        {0xC3, 0xC3, 0x99, 0x99, 0x91, 0x91, 0x89, 0x89, 0x99, 0x99, 0x99, 0x99, 0xC3, 0xC3, 0xFF, 0xFF},
        {0xE7, 0xE7, 0xC7, 0xC7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xFF, 0xFF},
        {0xC3, 0xC3, 0x99, 0x99, 0xF1, 0xF1, 0xE3, 0xE3, 0xC7, 0xC7, 0x8F, 0x8F, 0x81, 0x81, 0xFF, 0xFF},
        {0x81, 0x81, 0xF3, 0xF3, 0xE7, 0xE7, 0xC3, 0xC3, 0xF9, 0xF9, 0xB9, 0xB9, 0xC3, 0xC3, 0xFF, 0xFF},
        {0xF3, 0xF3, 0xE3, 0xE3, 0xD3, 0xD3, 0xB3, 0xB3, 0x81, 0x81, 0xF3, 0xF3, 0xF3, 0xF3, 0xFF, 0xFF},
        {0x81, 0x81, 0x9F, 0x9F, 0x83, 0x83, 0xF9, 0xF9, 0xF9, 0xF9, 0xB9, 0xB9, 0xC3, 0xC3, 0xFF, 0xFF},
        {0xE3, 0xE3, 0xDF, 0xDF, 0x9F, 0x9F, 0x83, 0x83, 0x99, 0x99, 0x99, 0x99, 0xC3, 0xC3, 0xFF, 0xFF},
        {0x81, 0x81, 0xF9, 0xF9, 0xF1, 0xF1, 0xE3, 0xE3, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xFF, 0xFF},
        {0xC3, 0xC3, 0x99, 0x99, 0x99, 0x99, 0xC3, 0xC3, 0x99, 0x99, 0x99, 0x99, 0xC3, 0xC3, 0xFF, 0xFF},
        {0xC3, 0xC3, 0x99, 0x99, 0x99, 0x99, 0xC1, 0xC1, 0xF9, 0xF9, 0xF3, 0xF3, 0xC7, 0xC7, 0xFF, 0xFF},
        {0xFF, 0xFF, 0xE7, 0xE7, 0xE7, 0xE7, 0xFF, 0xFF, 0xFF, 0xFF, 0xE7, 0xE7, 0xE7, 0xE7, 0xFF, 0xFF},
        {0xFF, 0xFF, 0xE7, 0xE7, 0xE7, 0xE7, 0xFF, 0xFF, 0xE7, 0xE7, 0xE7, 0xE7, 0xEF, 0xEF, 0xFF, 0xFF},
        {0xF9, 0xF9, 0xF3, 0xF3, 0xE7, 0xE7, 0xCF, 0xCF, 0xE7, 0xE7, 0xF3, 0xF3, 0xF9, 0xF9, 0xFF, 0xFF},
        {0xFF, 0xFF, 0xFF, 0xFF, 0xC3, 0xC3, 0xFF, 0xFF, 0xFF, 0xFF, 0xC3, 0xC3, 0xFF, 0xFF, 0xFF, 0xFF},
        {0x9F, 0x9F, 0xCF, 0xCF, 0xE7, 0xE7, 0xF3, 0xF3, 0xE7, 0xE7, 0xCF, 0xCF, 0x9F, 0x9F, 0xFF, 0xFF},
        {0xC3, 0xC3, 0xB9, 0xB9, 0xF9, 0xF9, 0xF3, 0xF3, 0xE7, 0xE7, 0xE7, 0xE7, 0xFF, 0xFF, 0xE7, 0xE7},
        // 32 - 63
        {0xC3, 0xC3, 0x99, 0x99, 0x91, 0x91, 0x95, 0x95, 0x91, 0x91, 0x9F, 0x9F, 0xC3, 0xC3, 0xFF, 0xFF},
        {0xC3, 0xC3, 0x99, 0x99, 0x99, 0x99, 0x81, 0x81, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0xFF, 0xFF},
        {0x83, 0x83, 0x99, 0x99, 0x99, 0x99, 0x83, 0x83, 0x99, 0x99, 0x99, 0x99, 0x83, 0x83, 0xFF, 0xFF},
        {0xC3, 0xC3, 0x9D, 0x9D, 0x9F, 0x9F, 0x9F, 0x9F, 0x9F, 0x9F, 0x9D, 0x9D, 0xC3, 0xC3, 0xFF, 0xFF},
        {0x83, 0x83, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x83, 0x83, 0xFF, 0xFF},
        {0x81, 0x81, 0x9F, 0x9F, 0x9F, 0x9F, 0x83, 0x83, 0x9F, 0x9F, 0x9F, 0x9F, 0x81, 0x81, 0xFF, 0xFF},
        {0x81, 0x81, 0x9F, 0x9F, 0x9F, 0x9F, 0x83, 0x83, 0x9F, 0x9F, 0x9F, 0x9F, 0x9F, 0x9F, 0xFF, 0xFF},
        {0xC3, 0xC3, 0x9D, 0x9D, 0x9F, 0x9F, 0x91, 0x91, 0x99, 0x99, 0x99, 0x99, 0xC1, 0xC1, 0xFF, 0xFF},
        {0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x81, 0x81, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0xFF, 0xFF},
        {0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xFF, 0xFF},
        {0xF9, 0xF9, 0xF9, 0xF9, 0xF9, 0xF9, 0xF9, 0xF9, 0xF9, 0xF9, 0xB9, 0xB9, 0xC3, 0xC3, 0xFF, 0xFF},
        {0x99, 0x99, 0x93, 0x93, 0x87, 0x87, 0x8F, 0x8F, 0x87, 0x87, 0x93, 0x93, 0x99, 0x99, 0xFF, 0xFF},
        {0x9F, 0x9F, 0x9F, 0x9F, 0x9F, 0x9F, 0x9F, 0x9F, 0x9F, 0x9F, 0x9F, 0x9F, 0x83, 0x83, 0xFF, 0xFF},
        {0x03, 0x03, 0x29, 0x29, 0x29, 0x29, 0x29, 0x29, 0x29, 0x29, 0x39, 0x39, 0x39, 0x39, 0xFF, 0xFF},
        {0x9D, 0x9D, 0x8D, 0x8D, 0x85, 0x85, 0xA1, 0xA1, 0xB1, 0xB1, 0xB9, 0xB9, 0xBD, 0xBD, 0xFF, 0xFF},
        {0xC3, 0xC3, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0xC3, 0xC3, 0xFF, 0xFF},
        {0x83, 0x83, 0x99, 0x99, 0x99, 0x99, 0x83, 0x83, 0x9F, 0x9F, 0x9F, 0x9F, 0x9F, 0x9F, 0xFF, 0xFF},
        {0xC3, 0xC3, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0xC3, 0xC3, 0xF9, 0xF9},
        {0x83, 0x83, 0x99, 0x99, 0x99, 0x99, 0x83, 0x83, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0xFF, 0xFF},
        {0xC3, 0xC3, 0x9D, 0x9D, 0x8F, 0x8F, 0xC3, 0xC3, 0xF1, 0xF1, 0xB9, 0xB9, 0xC3, 0xC3, 0xFF, 0xFF},
        {0x81, 0x81, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xFF, 0xFF},
        {0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0xC3, 0xC3, 0xFF, 0xFF},
        {0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x9B, 0x9B, 0x87, 0x87, 0xFF, 0xFF},
        {0x39, 0x39, 0x39, 0x39, 0x39, 0x39, 0x29, 0x29, 0x29, 0x29, 0x29, 0x29, 0x03, 0x03, 0xFF, 0xFF},
        {0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0xC3, 0xC3, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0xFF, 0xFF},
        {0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0xC3, 0xC3, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xFF, 0xFF},
        {0x81, 0x81, 0xF1, 0xF1, 0xE3, 0xE3, 0xC7, 0xC7, 0x8F, 0x8F, 0x9F, 0x9F, 0x81, 0x81, 0xFF, 0xFF},
        {0xE1, 0xE1, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE1, 0xE1, 0xFF, 0xFF},
        {0xBF, 0xBF, 0x9F, 0x9F, 0xCF, 0xCF, 0xE7, 0xE7, 0xF3, 0xF3, 0xF9, 0xF9, 0xFD, 0xFD, 0xFF, 0xFF},
        {0x87, 0x87, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0x87, 0x87, 0xFF, 0xFF},
        {0xEF, 0xEF, 0xC7, 0xC7, 0x93, 0x93, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF},
        {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x81, 0x81, 0xFF, 0xFF},
        // 64 - 95
        {0xFF, 0xFF, 0x3F, 0x3F, 0x3F, 0x3F, 0x9F, 0x9F, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF},
        {0xFF, 0xFF, 0xC3, 0xC3, 0xB9, 0xB9, 0xC1, 0xC1, 0x99, 0x99, 0x99, 0x99, 0xC1, 0xC1, 0xFF, 0xFF},
        {0x9F, 0x9F, 0x83, 0x83, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x83, 0x83, 0xFF, 0xFF},
        {0xFF, 0xFF, 0xC3, 0xC3, 0x9D, 0x9D, 0x9F, 0x9F, 0x9F, 0x9F, 0x9D, 0x9D, 0xC3, 0xC3, 0xFF, 0xFF},
        {0xF9, 0xF9, 0xC1, 0xC1, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0xC1, 0xC1, 0xFF, 0xFF},
        {0xFF, 0xFF, 0xC3, 0xC3, 0x99, 0x99, 0x81, 0x81, 0x9F, 0x9F, 0x9D, 0x9D, 0xC3, 0xC3, 0xFF, 0xFF},
        {0xE1, 0xE1, 0xCF, 0xCF, 0x83, 0x83, 0xCF, 0xCF, 0xCF, 0xCF, 0xCF, 0xCF, 0xCF, 0xCF, 0xFF, 0xFF},
        {0xFF, 0xFF, 0xC1, 0xC1, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0xC1, 0xC1, 0xB9, 0xB9, 0xC3, 0xC3},
        {0x9F, 0x9F, 0x83, 0x83, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0xFF, 0xFF},
        {0xE7, 0xE7, 0xFF, 0xFF, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xFF, 0xFF},
        {0xFF, 0xFF, 0xF7, 0xF7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xA7, 0xA7, 0xCF, 0xCF},
        {0x9F, 0x9F, 0x9B, 0x9B, 0x97, 0x97, 0x8F, 0x8F, 0x87, 0x87, 0x93, 0x93, 0x99, 0x99, 0xFF, 0xFF},
        {0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xF3, 0xF3, 0xFF, 0xFF},
        {0xFF, 0xFF, 0x03, 0x03, 0x29, 0x29, 0x29, 0x29, 0x29, 0x29, 0x29, 0x29, 0x39, 0x39, 0xFF, 0xFF},
        {0xFF, 0xFF, 0x83, 0x83, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0xFF, 0xFF},
        {0xFF, 0xFF, 0xC3, 0xC3, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0xC3, 0xC3, 0xFF, 0xFF},
        {0xFF, 0xFF, 0x83, 0x83, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x83, 0x83, 0x9F, 0x9F, 0x9F, 0x9F},
        {0xFF, 0xFF, 0xC1, 0xC1, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0xC1, 0xC1, 0xF9, 0xF9},
        {0xFF, 0xFF, 0x93, 0x93, 0x8F, 0x8F, 0x9F, 0x9F, 0x9F, 0x9F, 0x9F, 0x9F, 0x9F, 0x9F, 0xFF, 0xFF},
        {0xFF, 0xFF, 0xC3, 0xC3, 0x8D, 0x8D, 0xC7, 0xC7, 0xE3, 0xE3, 0xB1, 0xB1, 0xC3, 0xC3, 0xFF, 0xFF},
        {0xE7, 0xE7, 0xC3, 0xC3, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xF3, 0xF3, 0xFF, 0xFF},
        {0xFF, 0xFF, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0xC1, 0xC1, 0xFF, 0xFF},
        {0xFF, 0xFF, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x9B, 0x9B, 0x87, 0x87, 0xFF, 0xFF},
        {0xFF, 0xFF, 0x39, 0x39, 0x39, 0x39, 0x29, 0x29, 0x29, 0x29, 0x29, 0x29, 0x03, 0x03, 0xFF, 0xFF},
        {0xFF, 0xFF, 0x99, 0x99, 0x99, 0x99, 0xC3, 0xC3, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0xFF, 0xFF},
        {0xFF, 0xFF, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0xD9, 0xD9, 0xE1, 0xE1, 0xB9, 0xB9, 0xC3, 0xC3},
        {0xFF, 0xFF, 0x81, 0x81, 0xF1, 0xF1, 0xE3, 0xE3, 0xC7, 0xC7, 0x8F, 0x8F, 0x81, 0x81, 0xFF, 0xFF},
        {0xF1, 0xF1, 0xE7, 0xE7, 0xE7, 0xE7, 0xCF, 0xCF, 0xE7, 0xE7, 0xE7, 0xE7, 0xF1, 0xF1, 0xFF, 0xFF},
        {0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7, 0xE7},
        {0x8F, 0x8F, 0xE7, 0xE7, 0xE7, 0xE7, 0xF3, 0xF3, 0xE7, 0xE7, 0xE7, 0xE7, 0x8F, 0x8F, 0xFF, 0xFF},
        {0xFF, 0xFF, 0x9F, 0x9F, 0x0D, 0x0D, 0x61, 0x61, 0xF3, 0xF3, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF},
        {0xEF, 0xEF, 0xEF, 0xEF, 0xD7, 0xD7, 0xD7, 0xD7, 0xBB, 0xBB, 0xBB, 0xBB, 0x7D, 0x7D, 0x01, 0x01},
};