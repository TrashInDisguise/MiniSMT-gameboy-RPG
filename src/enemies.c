#include "enemies.h"
#define ENEMIES_MEMORY_BASE_ADDRESS 101
#define SLOTS_Y 80
#define SLOT0_X 40
#define SLOT1_X 76
#define SLOT2_X 112




//enemy sprites 3x3 tiles

const uint8_t enemies[][9]={
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c},
    {0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15},
};

const unsigned char enemies_names[][16]={
    "Unknown\0",
    "Test 1\0",
    "Test 2\0",
};

const uint8_t e_str[]={
    0,
    10,
    4
};
const uint8_t e_int[]={
    0,
    4,
    10
};
const uint8_t e_agi[]={
    0,
    7,
    10

};
const uint8_t e_con[]={
    0,
    6,
    3
};

const unsigned char enemies_tileset[]={//test data
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//0
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,//1
    0x00,0xFF,0x00,0xFF,0x00,0xFF,0x00,0xFF,0x00,0xFF,0x00,0xFF,0x00,0xFF,0x00,0xFF,//2
    0xFF,0x00,0xFF,0x00,0xFF,0x00,0xFF,0x00,0xFF,0x00,0xFF,0x00,0xFF,0x00,0xFF,0x00,//3
    0xC0,0xC0,0xC0,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//4
    0x18,0x18,0x18,0x18,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//5
    0x03,0x03,0x03,0x03,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//6
    0x00,0x00,0x00,0x00,0x00,0x00,0xC0,0xC0,0xC0,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,//7
    0x00,0x00,0x00,0x00,0x00,0x00,0x18,0x18,0x18,0x18,0x00,0x00,0x00,0x00,0x00,0x00,//8
    0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x03,0x03,0x03,0x00,0x00,0x00,0x00,0x00,0x00,//9
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xC0,0xC0,0xC0,0xC0,//10
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x18,0x18,0x18,0x18,//11
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x03,0x03,0x03,//12
    0x00,0xC0,0x00,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//13
    0x00,0x18,0x00,0x18,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//14
    0x00,0x03,0x00,0x03,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//15
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xC0,0x00,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,//16
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x18,0x00,0x18,0x00,0x00,0x00,0x00,0x00,0x00,//17
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x00,0x03,0x00,0x00,0x00,0x00,0x00,0x00,//18
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xC0,0x00,0xC0,//19
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x18,0x00,0x18,//20
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x00,0x03 //21
};
//loads tiles to vram, sets up sprites, places sprites on screen // enemy_slot=0 || 1 || 2
void load_enemy(uint8_t enemy_id, uint8_t enemy_slot){
    uint8_t i,j;
    uint8_t x = 0;
    switch(enemy_slot){
        case 0:
            x = SLOT0_X;
        break;
        case 1:
            x = SLOT1_X;
        break;
        case 2:
            x = SLOT2_X;
        break;
        default:
            enemy_slot = 0;
        break;
    };
    for (i=0;i<9;i++){
        set_sprite_data(ENEMIES_MEMORY_BASE_ADDRESS+(enemy_slot*9)+i,1,enemies_tileset+(enemies[enemy_id][i]*16));
    }
    for (i=0;i<3;i++){
        j=i+enemy_slot*9;
        set_sprite_tile(j,ENEMIES_MEMORY_BASE_ADDRESS+j);
        move_sprite(j,x+i*8,SLOTS_Y);
    }
    for (i=0;i<3;i++){
        j=i+enemy_slot*9;
        set_sprite_tile(j+3,ENEMIES_MEMORY_BASE_ADDRESS+j+3);
        move_sprite(j+3,x+i*8,SLOTS_Y+8);
        
    }
    for (i=0;i<3;i++){
        j=i+enemy_slot*9;
        set_sprite_tile(j+6,ENEMIES_MEMORY_BASE_ADDRESS+j+6);
        move_sprite(j+6,x+i*8,SLOTS_Y+16);
    }
}
void unload_enemy(uint8_t enemy_slot){
    uint8_t i,j;
    for (i=0;i<9;i++){
        j=i+enemy_slot*9;
        set_sprite_data(ENEMIES_MEMORY_BASE_ADDRESS+j,1,enemies_tileset);
        set_sprite_tile(j,ENEMIES_MEMORY_BASE_ADDRESS+j);
        move_sprite(j,0,0);
    }
}
