#include "combat.h"

void init_combat(uint8_t combat_group,struct slot sl1,struct slot sl2,struct slot sl3){
    uint8_t i;
    for(i=0;i<MAX_COMBAT_GROUP_SIZE;i++){
        //load enemy sprites
        if(combat_groups[combat_group][i]!=0){
            load_enemy(combat_groups[combat_group][i],i);
            switch(i){
                case 0:
                    sl1.id = combat_groups[combat_group][i];
                    sl1.max_hp = e_con[sl1.id]/4*10;
                    sl1.hp = sl1.max_hp;
                    sl1.max_mp = e_int[sl1.id]/5*10;
                    sl1.mp = sl1.max_mp;
                    sl1.e_str = e_str[sl1.id];
                    sl1.e_agi = e_agi[sl1.id];
                    sl1.e_int = e_int[sl1.id];
                    break;

                case 1:
                    sl2.id = combat_groups[combat_group][i];
                    sl2.max_hp = e_con[sl2.id]/4*10;
                    sl2.hp = sl2.max_hp;
                    sl2.max_mp = e_int[sl2.id]/5*10;
                    sl2.mp = sl2.max_mp;
                    sl2.e_str = e_str[sl2.id];
                    sl2.e_agi = e_agi[sl2.id];
                    sl2.e_int = e_int[sl2.id];
                    break;

                case 2:
                    sl3.id = combat_groups[combat_group][i];
                    sl3.max_hp = e_con[sl3.id]/4*10;
                    sl3.hp = sl3.max_hp;
                    sl3.max_mp = e_int[sl3.id]/5*10;
                    sl3.mp = sl3.max_mp;
                    sl3.e_str = e_str[sl3.id];
                    sl3.e_agi = e_agi[sl3.id];
                    sl3.e_int = e_int[sl3.id];
                    break;

            }
        }
    }
}
void combat_view_upd(uint8_t joypad_current, uint8_t joypad_previous ){

}
//0 - no enemy in a slot
const uint8_t combat_groups[][MAX_COMBAT_GROUP_SIZE] ={
    {1,0,2},//test group 1
    {2,0,2},//test group 2
};

