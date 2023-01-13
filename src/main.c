#include <gb/gb.h>
#include <rand.h>
#include <stdint.h>
#include <stdio.h>
#include "dng_crawling.h"
#include "../res/dng_wip.h"
#include "../res/walls.h"
#include "../res/UI_sprites.h"
#include "../res/dragon_tileset.h"
#include "../res/font.h"
#include "enemies.h"



static uint8_t global_state = 1;// 0 - owerworld // 1 - 3d dungeon exploration // 2 - turn based combat // 3 - inventory // 4 - dialog// 5 - interactive scene  
static uint8_t encounter_counter = 0;
static uint8_t encounter_timer = 0;
//player variables
static enum direction{north,east,south,west};
static uint8_t player_x=0;
static uint8_t player_y=0;
//player stats
static uint8_t p_str=0;
static uint8_t p_int=0;
static uint8_t p_agi=0;
static uint8_t p_con=0;
static uint8_t p_luk=0;

static uint8_t inventory[100] = {NULL};//every entry contains id of an item

static enum direction player_dir = north;
//system
static uint8_t joypad_current=0,joypad_previous=0;

const unsigned char white_screen[] = {
    0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,
    0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,
    0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,0x4a,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,

};
//0x02 - wall, 0x03 - south door, 0x04 - west door, 0x05 - north door, 0x6 - east door, 0x01 - start
const unsigned char test_dungeon[] =
{
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x06,0x00,0x06,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x05,0x00,0x05,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x04,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x00,0x03,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x02,0x00,0x02,0x03,0x04,0x05,0x06,0x00,0x00,
  0x00,0x00,0x00,0x00,0x02,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x02,0x00,0x02,0x03,0x04,0x05,0x06,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
};

void init_dungeon(const unsigned char *dng,uint8_t dng_width, uint8_t dng_height) {
    //init variables for combat
    initrand(sys_time);
    encounter_counter = rand() % 15 + 5;
    encounter_timer = 0;// increments with every move throught the dungeon. Then it equales to encounteer_counter battle starts

	// Load walls' and UI's tiles
    set_bkg_data(0,75,dng_tileset);
    set_sprite_data(0,25,UI_tiles);
    
    //locating player start position
    for(uint8_t i = 0; i < dng_width; i++){
        for(uint8_t j = 0; j < dng_height; j++){
            if(dng[i*dng_width+j]==0x01){
                player_x = j;
                player_y = i;
            }
        }
    }
    SHOW_BKG;

}

void update_dng(unsigned char *dng,uint8_t dungeon_width, uint8_t dungeon_hieght){
    uint8_t py = 0;
    uint8_t px = 0;
    set_bkg_tiles(0,0,20,13,white_screen);

    check_l_walls(dng,dungeon_width,dungeon_hieght,player_x, player_y, player_dir);
    check_r_walls(dng,dungeon_width,dungeon_hieght,player_x, player_y, player_dir);
    check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y,player_dir);

}

void collision_check(const unsigned char *dng, uint8_t dng_width, uint8_t dng_height){
    //TODO check collision refactoring + interactivetis
}

void init_dng_UI(){
    //big letters
    move_sprite(0,80,20);
    move_sprite(1,80,28);
    move_sprite(2,88,28);
    move_sprite(3,88,20);
    //small letters
    move_sprite(4,64,20);
    move_sprite(5,104,20);
    //moon
    move_sprite(6,144,20);
    move_sprite(7,144,28);
    move_sprite(8,152,20);
    move_sprite(9,152,28);


}

void update_dng_UI (){
    set_sprite_prop(0, 0x00);
    set_sprite_prop(1, 0x00);
    set_sprite_prop(2, 0x00);
    set_sprite_prop(3, 0x00);
    //BIG letter
    switch(player_dir){
        case 0:            
            set_sprite_tile(0,1);
            set_sprite_tile(1,2);
            set_sprite_tile(2,1);
            set_sprite_tile(3,2);
            set_sprite_prop(2, S_FLIPX | S_FLIPY);
            set_sprite_prop(3, S_FLIPX | S_FLIPY);
        break;

        case 1:            
            set_sprite_tile(0,3);
            set_sprite_tile(1,3);
            set_sprite_tile(2,4);
            set_sprite_tile(3,4);
            set_sprite_prop(2,  S_FLIPY);
            set_sprite_prop(1,  S_FLIPY);
        break;

        case 2:
            set_sprite_tile(0,6);
            set_sprite_tile(1,5);
            set_sprite_tile(2,6);
            set_sprite_tile(3,5);
            set_sprite_prop(1,  S_FLIPY | S_FLIPX);
            set_sprite_prop(2,  S_FLIPY | S_FLIPX);


        break;

        case 3:
            set_sprite_tile(0,7);
            set_sprite_tile(1,8);
            set_sprite_tile(2,8);
            set_sprite_tile(3,7);
            set_sprite_prop(2,  S_FLIPX);
            set_sprite_prop(3,  S_FLIPX);
        break;
    }

    //left small letter
    switch(player_dir){
        case 0:            
            set_sprite_tile(4,12);
            set_sprite_tile(5,10);
        break;

        case 1:            
            set_sprite_tile(4,9);
            set_sprite_tile(5,11);
        break;

        case 2:

            set_sprite_tile(4,10);
            set_sprite_tile(5,12);

        break;

        case 3:
            set_sprite_tile(4,11);
            set_sprite_tile(5,9);
        break;
    }
    
    //moon
    set_sprite_tile(6, 14);
    set_sprite_tile(7, 14);
    set_sprite_prop(7,S_FLIPY);
    set_sprite_tile(8, 13);
    set_sprite_prop(8,S_FLIPX);
    set_sprite_tile(9, 13);
    set_sprite_prop(9,S_FLIPX | S_FLIPY);


}

void dungeon_logic_upd(){
    joypad_previous = joypad_current;
    joypad_current = joypad();
    //turning left
    if((joypad_current & J_LEFT) && !(joypad_previous & J_LEFT)){
        player_dir--;
        if (player_dir==255){
            player_dir = west;
        }
        update_dng(test_dungeon,15,15);
        //set_sprite_tile(0,player_dir);
    }
    //turning right
    if((joypad_current & J_RIGHT) && !(joypad_previous & J_RIGHT)){
        player_dir++;
        if(player_dir==4){
            player_dir=north;
        }
        update_dng(test_dungeon,15,15);
        //set_sprite_tile(0,player_dir);
    }
    if((joypad_current & J_UP) && !(joypad_previous & J_UP)){
        switch(player_dir){
            case north:
                if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
                    player_y--;
                    update_dng(test_dungeon,15,15);
                }
            break;
            case east:
                if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
                    player_x++;
                    update_dng(test_dungeon,15,15);
                }
            break;
            case south:
                if(return_value(test_dungeon,15,15,player_x,player_y+1)==0x00||return_value(test_dungeon,15,15,player_x,player_y+1)==0x01){
                    player_y++;
                    update_dng(test_dungeon,15,15);
                }
            break;
            case west:
                if(return_value(test_dungeon,15,15,player_x-1,player_y)==0x00||return_value(test_dungeon,15,15,player_x-1,player_y)==0x01){
                    player_x--;
                    update_dng(test_dungeon,15,15);
                }
            break;
        }
        encounter_timer++;
    }
    if((joypad_current & J_DOWN) && !(joypad_previous & J_DOWN)){
        switch(player_dir){
            case north:
                if(return_value(test_dungeon,15,15,player_x,player_y+1)==0x00||return_value(test_dungeon,15,15,player_x,player_y+1)==0x01){
                    player_y++;
                    update_dng(test_dungeon,15,15);
                }
            break;
            case east:
                if(return_value(test_dungeon,15,15,player_x-1,player_y)==0x00||return_value(test_dungeon,15,15,player_x-1,player_y)==0x01){
                    player_x--;
                    update_dng(test_dungeon,15,15);
                }
            break;
            case south:
                if(return_value(test_dungeon,15,15,player_x,player_y-1)==0x00||return_value(test_dungeon,15,15,player_x,player_y-1)==0x01){
                    player_y--;
                    update_dng(test_dungeon,15,15);
                }
            break;
            case west:
                if(return_value(test_dungeon,15,15,player_x+1,player_y)==0x00||return_value(test_dungeon,15,15,player_x+1,player_y)==0x01){
                    player_x++;
                    update_dng(test_dungeon,15,15);
                }
            break;
        }
        encounter_timer++;
    }
    if(encounter_counter==encounter_timer){
        global_state = 2;
    }
}

void state_switcher(uint8_t t){
    switch(t){
        case 0://overworld//big change
        break;

        case 1://3d dungeon exploration//big change
        break;

        case 2://turn-based combat
            //test data--------------------------


            
            //-----------------------------------




        break;

        case 3://inventory
        break;

        case 4://dialog
        break;

        case 5://interactive scene
        break;


    }
}

void main(void)
{   
    init_dungeon(test_dungeon, 15, 15);
    //init_dng_UI();
    update_dng(test_dungeon,15,15);
    //set_sprite_data(0,26,UI_tiles);
    load_enemy(0,0);
    load_enemy(1,1);
    load_enemy(0,2);
    
    //set_sprite_tile(0,player_dir);

    //charset test------------------
    //set_win_data(224,32,font['!'-32]);
    //set_bkg_tiles(0,0,16,3,pull_letters("It's dangerous to go alone take this",37,224));    
    //------------------------------
    //state test--------------------
    //state_switcher(2);
    //------------------------------
    
    SHOW_SPRITES;
    // Loop forever
    while(1) {
        //controller handler
        
        dungeon_logic_upd();
        //update_dng_UI();
        
            

        
        
    
		// Game main loop processing goes here


		// Done processing, yield CPU and wait for start of next frame
       
        wait_vbl_done();
    }
}
