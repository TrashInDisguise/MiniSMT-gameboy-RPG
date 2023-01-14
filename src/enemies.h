#ifndef _ENEMIES_H_
#define _ENEMIES_H_
#include <stdint.h>
#include <gb/gb.h>

extern const uint8_t enemies[][9];
extern const unsigned char enemies_names[][16];
void load_enemy(uint8_t enemy_id, uint8_t enemy_slot);
void unload_enemy(uint8_t enemy_slot);


#endif