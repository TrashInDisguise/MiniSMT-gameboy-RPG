#include "items.h"

const unsigned char name[][16]={
    {"Stick\0"},
    {"Sword\0"},
    {"Helm\0"},
    {"HlthPotion\0"},
    {"Key\0"},
    {"Staff\0"},
    {"Sphere\0"},
    {"COMP\0"},
    {"MapProg\0"},
    {"\0"},
};

const unsigned char type[]={
    weapon_t,
    weapon_t,
    helmet_t,
    consumable_t,
    key_t,
    weapon_t,
    key_item_t,
    key_item_t,
    spell_t,
    unknown_t,
};
const unsigned char effect[]={
    item_bind,
    item_bind,
    item_bind,
    instant,
    unknown,
    item_bind,
    unknown,
    unknown,
    buff,
    unknown,
};
const int8_t STR[]={
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
};
const int8_t INTL[]={
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
};
const int8_t AGI []={
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
};
const int8_t CON []={
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
};
const int8_t LUK []={
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
};