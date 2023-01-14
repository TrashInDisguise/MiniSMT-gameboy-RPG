#ifndef _COMBAT_H_
#define _COMBAT_H_
#include <stdint.h>
#include <gb/gb.h>
#include "enemies.h"
#define MAX_COMBAT_GROUP_SIZE 3
#define GROUP_COUNT 2

struct slot{
    uint8_t id;
    unsigned char name[16];
    uint8_t max_hp;
    uint8_t hp;
    uint8_t max_mp;
    uint8_t mp;
    uint8_t e_str;
    uint8_t e_agi;
    uint8_t e_int;
};

void init_combat(uint8_t combat_group,struct slot sl1,struct slot sl2,struct slot sl3);
void combat_view_upd( uint8_t joypad_current,uint8_t joypad_previous);

extern const uint8_t combat_groups[][MAX_COMBAT_GROUP_SIZE];



#endif