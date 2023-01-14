#ifndef _COMBAT_H_
#define _COMBAT_H_
#include <stdint.h>
#include <gb/gb.h>
#include "enemies.h"
#define MAX_COMBAT_GROUP_SIZE 3
#define GROUP_COUNT 2

void init_combat(uint8_t combat_group);
void combat_view_upd();

extern const uint8_t combat_groups[][MAX_COMBAT_GROUP_SIZE];

#endif