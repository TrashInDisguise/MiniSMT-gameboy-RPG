#include <gb/gb.h>
#include <stdint.h>
#include <stdio.h>
#include "dng_crawling.h"
#include "../res/dng_wip.h"
#include "../res/walls.h"
#include "../res/nesw.h"


static uint8_t player_x=0;
static uint8_t player_y=0;
static uint8_t global_state = 1;// 0 - owerworld // 1 - 3d dungeon exploration // 3 - turn based combat // 4 - inventory // 5 - dialog// 6 - interactive scene  
static enum direction{north,east,south,west};
//static enum wall_type{none,wall,door};
static enum direction player_dir = north;
//static uint8_t dist=0;
static uint8_t joypad_current=0,joypad_previous=0;

//0x02 - wall, 0x03 - south door, 0x04 - west door, 0x05 - north door, 0x6 - east door, 0x01 - start
const unsigned char white_screen[] = {
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
/*
unsigned char return_value(const unsigned char *dng, uint8_t width, uint8_t height,uint8_t x ,uint8_t y){
    if(y*width + x < height*width)
        return dng[ y*width + x ];
    else
        return NULL;
}
*/

void init_dungeon(const unsigned char *dng,uint8_t dng_width, uint8_t dng_height) {

	// Load player sprite
    set_bkg_data(0,74,dng_tileset);
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
    set_bkg_tiles(0,0,20,10,white_screen);
    //unsigned char w;
    switch (player_dir){
        case north:
            check_l_walls_n(dng,dungeon_width,dungeon_hieght,player_x,player_y);
            //check_l_walls(dng,dungeon_width,dungeon_hieght,player_x, player_y, player_dir);
            check_r_walls_n(dng,dungeon_width,dungeon_hieght,player_x,player_y);
            check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y, 0, -1);
            
            SHOW_BKG;
        break;
        case south:
            check_l_walls_s(dng,dungeon_width,dungeon_hieght,player_x,player_y);
            //check_l_walls(dng,dungeon_width,dungeon_hieght,player_x, player_y, player_dir);
            check_r_walls_s(dng,dungeon_width,dungeon_hieght,player_x,player_y);
            check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y,0,+1);
            SHOW_BKG;
        break;
        case west:
            check_l_walls_w(dng,dungeon_width,dungeon_hieght,player_x,player_y);
            //check_l_walls(dng,dungeon_width,dungeon_hieght,player_x, player_y, player_dir);
            check_r_walls_w(dng,dungeon_width,dungeon_hieght,player_x,player_y);
            check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y,-1,0);
            
            SHOW_BKG;
        break;
        case east:
            //check_l_walls(dng,dungeon_width,dungeon_hieght,player_x, player_y, player_dir);
            check_l_walls_e(dng,dungeon_width,dungeon_hieght,player_x,player_y);
            check_r_walls_e(dng,dungeon_width,dungeon_hieght,player_x,player_y);
            check_m_walls(dng,dungeon_width,dungeon_hieght, player_x, player_y,+1,0);
            
            SHOW_BKG;
        break;
    }

}

void collision_check(const unsigned char *dng, uint8_t dng_width, uint8_t dng_height){
    //TODO check collision refactoring + interactivetis
}

void dungeon_logic_upd(){
    joypad_previous = joypad_current;
    joypad_current = joypad();

    if((joypad_current & J_LEFT) && !(joypad_previous & J_LEFT)){
        player_dir--;
        if (player_dir==255){
            player_dir = west;
        }
        update_dng(test_dungeon,15,15);
        set_sprite_tile(0,player_dir);
    }
    if((joypad_current & J_RIGHT) && !(joypad_previous & J_RIGHT)){
        player_dir++;
        if(player_dir==4){
            player_dir=north;
        }
        update_dng(test_dungeon,15,15);
        set_sprite_tile(0,player_dir);
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
    }
}

void main(void)
{
    
    init_dungeon(test_dungeon, 15, 15);
    update_dng(test_dungeon,15,15);
    set_sprite_data(0,4,news);
    set_sprite_tile(0,player_dir);
    move_sprite(0,10,16);
    SHOW_SPRITES;
    // Loop forever
    while(1) {
        //controller handler
        dungeon_logic_upd();
      
        //player_draw(&pl);
        
        
    
		// Game main loop processing goes here


		// Done processing, yield CPU and wait for start of next frame
       
        wait_vbl_done();
    }
}
