#ifndef _INV_H_
#define _INV_H_
#include <stdint.h>
#define item_table_size 10
//item_type
#define unknown_t 0x00
#define weapon_t 0x01
#define helmet_t 0x02
#define vest_t 0x03
#define consumable_t 0x04
#define key_t 0x05
#define key_item_t 0x06
#define spell_t 0x07

    extern const unsigned char name[][16];
    extern const unsigned char type[];
    extern const unsigned char effect[];
    extern const int8_t STR[];
    extern const int8_t INT[];
    extern const int8_t AGI[];
    extern const int8_t CON[];
    extern const int8_t LUK[];



   // enum item_type{unknown, weapon, helmet, consumable, vest, key, key_item, spell};
    enum item_effect{unknown, permament, instant, item_bind, buff};
//TODO automate creation of item table
#endif