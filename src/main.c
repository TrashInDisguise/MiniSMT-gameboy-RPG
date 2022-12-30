#include <gb/gb.h>
#include <stdint.h>
#include <stdio.h>
#include "../res/dng_crawling.h"
#include "../res/dng_wip.h"
#include "../res/walls.h"
#include "../res/nesw.h"


static uint8_t player_x=0;
static uint8_t player_y=0;
static uint8_t global_state = 1;// 0 - owerworld // 1 - 3d dungeon exploration // 3 - turn based combat // 4 - inventory // 5 - dialog  
static enum direction{north,east,south,west};
static enum wall_type{none,wall,door};
static enum direction player_dir = north;
static uint8_t dist=0;
static uint8_t joypadCurrent=0,joypadPrevious=0;

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

unsigned char return_value(const unsigned char *dng, uint8_t width, uint8_t height,uint8_t x ,uint8_t y){
    if(y*width + x < height*width)
        return dng[ y*width + x ];
    else
        return NULL;
}

void init_gfx() {

	// Load player sprite
    set_bkg_data(0,74,dng_tileset);
    //locating player start position
    for(uint8_t i = 0; i < 15; i++){
        for(uint8_t j = 0; j < 15; j++){
            if(test_dungeon[i*15+j]==0x01){
                player_x = j;
                player_y = i;
            }
        }
    }
    SHOW_BKG;

}

void check_m_walls(unsigned char *dng, uint8_t dungeon_width, uint8_t dungeon_hieght, int8_t dirx, int8_t diry){
    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(1*dirx), player_y+(1*diry));
    if( w != 0x00 && w != 0x01){
        if( w == 0x03 && diry == -1 || w == 0x04 && dirx == 1 ||w == 0x05 && diry == 1 || w==0x06 && dirx == -1){
            set_bkg_tiles(4,0,12,9,door1_bkg);
            //dist = 1;
            //SHOW_BKG;
            return;
        }else{
            set_bkg_tiles(4,0,12,9,wall1_bkg);
            //dist = 1;
            //SHOW_BKG;
            return;
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(2*dirx), player_y+(2*diry));
    if( w != 0x00 && w != 0x01){
        if( w == 0x03 && diry == -1 || w == 0x04 && dirx == 1 ||w == 0x05 && diry == 1 || w==0x06 && dirx == -1){
            set_bkg_tiles(6,0,8,9,door2_bkg);
            //dist = 2;
            //SHOW_BKG;
            return;
        }else{
            set_bkg_tiles(6,0,8,9,wall2_bkg);
            //dist = 2;
            //SHOW_BKG;
            return;
        }

    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(3*dirx), player_y+(3*diry));
    if( w != 0x00 && w != 0x01 ){
        if( w == 0x03 && diry == -1 || w == 0x04 && dirx == 1 ||w == 0x05 && diry == 1 || w==0x06 && dirx == -1){
            set_bkg_tiles(7,0,6,9,door3_bkg);
            //dist = 3;
            //SHOW_BKG;
            return;
        }else{
            set_bkg_tiles(7,0,6,9,wall3_bkg);
            //dist = 3;
            //SHOW_BKG;
            return;
        }

    }

}

void check_l_walls_n(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght){
    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-2);
    if(w != 0x00 && w != 0x01){
        if( w == 0x06){
            set_bkg_tiles(6,0,1,9,door3_l_bkg);
        }else{
            set_bkg_tiles(6,0,1,9,wall3_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-3);
        if(w != 0x00 && w != 0x01){
            if( w == 0x03){
                set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
            }else{
                set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
            }
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x06){
            set_bkg_tiles(4,0,2,9,door2_l_bkg);
        }else{
            set_bkg_tiles(4,0,2,9,wall2_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-2);
        if(w != 0x00 && w != 0x01){
            if( w == 0x03){
                set_bkg_tiles(1,0,5,9,nowall_door2_l_bkg);
            }else{
                set_bkg_tiles(1,0,5,9,nowall2_l_bkg);
            }
        }
    }
    
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y);
    if(w!=0x00 && w != 0x01){
        if( w == 0x06){
            set_bkg_tiles(1,0,3,9,door1_l_bkg);
        }else{
            set_bkg_tiles(1,0,3,9,wall1_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x03){
                set_bkg_tiles(1,0,3,9,nowall_door1_l_bkg);
            }else{
                set_bkg_tiles(1,0,3,9,nowall1_l_bkg);
            }
        }
    }
}

void check_l_walls_e(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght){
    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y-1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x03){
            set_bkg_tiles(6,0,1,9,door3_l_bkg);
        }else{
            set_bkg_tiles(6,0,1,9,wall3_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+3, player_y-1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x04){
                set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
            }else{
                set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
            }
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x03){
            set_bkg_tiles(4,0,2,9,door2_l_bkg);
        }else{
            set_bkg_tiles(4,0,2,9,wall2_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y-1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x04){
                set_bkg_tiles(1,0,5,9,nowall_door2_l_bkg);
            }else{
                set_bkg_tiles(1,0,5,9,nowall2_l_bkg);
            }
        }
    }
    
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y-1);
    if(w!=0x00 && w != 0x01){
        if( w == 0x03){
            set_bkg_tiles(1,0,3,9,door1_l_bkg);
        }else{
            set_bkg_tiles(1,0,3,9,wall1_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x04){
                set_bkg_tiles(1,0,3,9,nowall_door1_l_bkg);
            }else{
                set_bkg_tiles(1,0,3,9,nowall1_l_bkg);
            }
        }
    }
}

void check_l_walls_s(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght){
    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+2);
    if(w != 0x00 && w != 0x01){
        if( w == 0x04){
            set_bkg_tiles(6,0,1,9,door3_l_bkg);
        }else{
            set_bkg_tiles(6,0,1,9,wall3_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+3);
        if(w != 0x00 && w != 0x01){
            if( w == 0x05){
                set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
            }else{
                set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
            }
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x04){
            set_bkg_tiles(4,0,2,9,door2_l_bkg);
        }else{
            set_bkg_tiles(4,0,2,9,wall2_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+2);
        if(w != 0x00 && w != 0x01){
            if( w == 0x05){
                set_bkg_tiles(1,0,5,9,nowall_door2_l_bkg);
            }else{
                set_bkg_tiles(1,0,5,9,nowall2_l_bkg);
            }
        }
    }
    
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y);
    if(w!=0x00 && w != 0x01){
        if( w == 0x04){
            set_bkg_tiles(1,0,3,9,door1_l_bkg);
        }else{
            set_bkg_tiles(1,0,3,9,wall1_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x05){
                set_bkg_tiles(1,0,3,9,nowall_door1_l_bkg);
            }else{
                set_bkg_tiles(1,0,3,9,nowall1_l_bkg);
            }
        }
    }
}

void check_l_walls_w(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght){
    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y+1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x05){
            set_bkg_tiles(6,0,1,9,door3_l_bkg);
        }else{
            set_bkg_tiles(6,0,1,9,wall3_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-3, player_y+1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x06){
                set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
            }else{
                set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
            }
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x05){
            set_bkg_tiles(4,0,2,9,door2_l_bkg);
        }else{
            set_bkg_tiles(4,0,2,9,wall2_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y+1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x06){
                set_bkg_tiles(1,0,5,9,nowall_door2_l_bkg);
            }else{
                set_bkg_tiles(1,0,5,9,nowall2_l_bkg);
            }
        }
    }
    
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y+1);
    if(w!=0x00 && w != 0x01){
        if( w == 0x05){
            set_bkg_tiles(1,0,3,9,door1_l_bkg);
        }else{
            set_bkg_tiles(1,0,3,9,wall1_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x06){
                set_bkg_tiles(1,0,3,9,nowall_door1_l_bkg);
            }else{
                set_bkg_tiles(1,0,3,9,nowall1_l_bkg);
            }
        }
    }
}

void check_r_walls_n(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght){
    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-2);
    if(w != 0x00 && w != 0x01){
        if( w == 0x04){
            set_bkg_tiles(13,0,1,9,door3_r_bkg);
        }else{
            set_bkg_tiles(13,0,1,9,wall3_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-3);
        if(w != 0x00 && w != 0x01){
            if( w == 0x03){
                set_bkg_tiles(13,0,6,9,nowall_door3_r_bkg);
            }else{
                set_bkg_tiles(13,0,6,9,nowall3_r_bkg);
            }
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x04){
            set_bkg_tiles(14,0,2,9,door2_r_bkg);
        }else{
            set_bkg_tiles(14,0,2,9,wall2_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-2);
        if(w != 0x00 && w != 0x01){
            if( w == 0x03){
                set_bkg_tiles(14,0,5,9,nowall_door2_r_bkg);
            }else{
                set_bkg_tiles(14,0,5,9,nowall2_r_bkg);
            }
        }
    }
    
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y);
    if(w!=0x00 && w != 0x01){
        if( w == 0x04){
            set_bkg_tiles(16,0,3,9,door1_r_bkg);
        }else{
            set_bkg_tiles(16,0,3,9,wall1_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x03){
                set_bkg_tiles(16,0,3,9,nowall_door1_r_bkg);
            }else{
                set_bkg_tiles(16,0,3,9,nowall1_r_bkg);
            }
        }
    }
}

void check_r_walls_e(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght){
    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y+1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x05){
            set_bkg_tiles(13,0,1,9,door3_r_bkg);
        }else{
            set_bkg_tiles(13,0,1,9,wall3_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+3, player_y+1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x04){
                set_bkg_tiles(13,0,6,9,nowall_door3_r_bkg);
            }else{
                set_bkg_tiles(13,0,6,9,nowall3_r_bkg);
            }
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x05){
            set_bkg_tiles(14,0,2,9,door2_r_bkg);
        }else{
            set_bkg_tiles(14,0,2,9,wall2_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y+1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x04){
                set_bkg_tiles(14,0,5,9,nowall_door2_r_bkg);
            }else{
                set_bkg_tiles(14,0,5,9,nowall2_r_bkg);
            }
        }
    }
    
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y+1);
    if(w!=0x00 && w != 0x01){
        if( w == 0x05){
            set_bkg_tiles(16,0,3,9,door1_r_bkg);
        }else{
            set_bkg_tiles(16,0,3,9,wall1_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x04){
                set_bkg_tiles(16,0,3,9,nowall_door1_r_bkg);
            }else{
                set_bkg_tiles(16,0,3,9,nowall1_r_bkg);
            }
        }
    }
}

void check_r_walls_s(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght){
    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+2);
    if(w != 0x00 && w != 0x01){
        if( w == 0x06){
            set_bkg_tiles(13,0,1,9,door3_r_bkg);
        }else{
            set_bkg_tiles(13,0,1,9,wall3_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+3);
        if(w != 0x00 && w != 0x01){
            if( w == 0x05){
                set_bkg_tiles(13,0,6,9,nowall_door3_r_bkg);
            }else{
                set_bkg_tiles(13,0,6,9,nowall3_r_bkg);
            }
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x06){
            set_bkg_tiles(14,0,2,9,door2_r_bkg);
        }else{
            set_bkg_tiles(14,0,2,9,wall2_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+2);
        if(w != 0x00 && w != 0x01){
            if( w == 0x05){
                set_bkg_tiles(14,0,5,9,nowall_door2_r_bkg);
            }else{
                set_bkg_tiles(14,0,5,9,nowall2_r_bkg);
            }
        }
    }
    
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y);
    if(w!=0x00 && w != 0x01){
        if( w == 0x06){
            set_bkg_tiles(16,0,3,9,door1_r_bkg);
        }else{
            set_bkg_tiles(16,0,3,9,wall1_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x05){
                set_bkg_tiles(16,0,3,9,nowall_door1_r_bkg);
            }else{
                set_bkg_tiles(16,0,3,9,nowall1_r_bkg);
            }
        }
    }
}

void check_r_walls_w(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght){
    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y-1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x03){
            set_bkg_tiles(13,0,1,9,door3_r_bkg);
        }else{
            set_bkg_tiles(13,0,1,9,wall3_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-3, player_y-1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x06){
                set_bkg_tiles(13,0,6,9,nowall_door3_r_bkg);
            }else{
                set_bkg_tiles(13,0,6,9,nowall3_r_bkg);
            }
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x03){
            set_bkg_tiles(14,0,2,9,door2_r_bkg);
        }else{
            set_bkg_tiles(14,0,2,9,wall2_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y-1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x06){
                set_bkg_tiles(14,0,5,9,nowall_door2_r_bkg);
            }else{
                set_bkg_tiles(14,0,5,9,nowall2_r_bkg);
            }
        }
    }
    
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y-1);
    if(w!=0x00 && w != 0x01){
        if( w == 0x03){
            set_bkg_tiles(16,0,3,9,door1_r_bkg);
        }else{
            set_bkg_tiles(16,0,3,9,wall1_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x06){
                set_bkg_tiles(16,0,3,9,nowall_door1_r_bkg);
            }else{
                set_bkg_tiles(16,0,3,9,nowall1_r_bkg);
            }
        }
    }
}

/*
void check_l_walls(unsigned char *dng, uint8_t dungeon_width, uint8_t dungeon_hieght, int8_t dirx, int8_t diry){
    
    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(2*dirx)+diry, player_y+(2*diry)+dirx);
    if(w != 0x00 && w != 0x01){
        if( w == 0x06 && diry == -1 || w == 0x03 && dirx ==1 ||w == 0x04 && diry == 1 || w==0x05 && dirx == -1){
            set_bkg_tiles(6,0,1,9,door3_l_bkg);
        }else{
            set_bkg_tiles(6,0,1,9,wall3_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(3*dirx)+diry, player_y+(3*diry)+dirx);
        if(w != 0x00 && w != 0x01){
            if( w == 0x03 && diry == -1 || w == 0x04 && dirx == 1 ||w == 0x05 && diry == 1 || w==0x06 && dirx == -1){
                set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
            }else{
                set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
            }
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(1*dirx)+diry, player_y+(1*diry)+dirx);
    if(w != 0x00 && w != 0x01){
        if( w == 0x06 && diry == -1 || w == 0x03 && dirx == -1 ||w == 0x04 && diry == 1 || w==0x05 && dirx == 1){
            set_bkg_tiles(4,0,2,9,door2_l_bkg);
        }else{
            set_bkg_tiles(4,0,2,9,wall2_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(2*dirx)+diry, player_y+(2*diry)+dirx);
        if(w != 0x00 && w != 0x01){
            set_bkg_tiles(1,0,5,9,nowall2_l_bkg);
        }
    }
    
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x+diry, player_y+dirx);
    if(w!=0x00 && w != 0x01){
        if( w == 0x06 && diry == -1 || w == 0x03 && dirx == -1 ||w == 0x04 && diry == 1 || w==0x05 && dirx == 1){
            set_bkg_tiles(1,0,3,9,door1_l_bkg);
        }else{
            set_bkg_tiles(1,0,3,9,wall1_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(1*dirx)+diry, player_y+(1*diry)+dirx);
        if(w!=0x00 && w != 0x01 ){
            set_bkg_tiles(1,0,3,9,nowall1_l_bkg);
        }
    }

}

void check_r_walls(unsigned char *dng, uint8_t dungeon_width, uint8_t dungeon_hieght, int8_t dirx, int8_t diry){
    
    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(2*dirx)-diry, player_y+(2*diry)-dirx);
    if(w!=0x00 && w != 0x01){
        if( w == 0x06 && diry == 1 || w == 0x03 && dirx == -1 ||w == 0x04 && diry == -1 || w==0x05 && dirx == 1){
            set_bkg_tiles(13,0,1,9,door3_r_bkg);
        }else{
            set_bkg_tiles(13,0,1,9,wall3_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(3*dirx)-diry, player_y+(3*diry)-dirx);
        if(w!=0x00 && w != 0x01){
            if( w == 0x03 && diry == -1 || w == 0x04 && dirx == 1 ||w == 0x05 && diry == 1 || w==0x06 && dirx == -1){
                set_bkg_tiles(13,0,6,9,nowall_door3_r_bkg);
            }else{
                set_bkg_tiles(13,0,6,9,nowall3_r_bkg);
            }
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(1*dirx)-diry, player_y+(1*diry)-dirx);
    if(w!=0x00 && w != 0x01){
        if( w == 0x06 && diry == 1 || w == 0x03 && dirx == -1 ||w == 0x04 && diry == -1 || w==0x05 && dirx == 1){
            set_bkg_tiles(14,0,2,9,door2_r_bkg);
        }else{
            set_bkg_tiles(14,0,2,9,wall2_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(2*dirx)-diry, player_y+(2*diry)-dirx);
        if(w!=0x00 && w != 0x01){
            set_bkg_tiles(14,0,5,9,nowall2_r_bkg);
        }
    }

    w = return_value(dng,dungeon_width,dungeon_hieght,player_x-diry, player_y-dirx);
    if(w!=0x00 && w != 0x01){
        if( w == 0x06 && diry == 1 || w == 0x03 && dirx == -1 ||w == 0x04 && diry == -1 || w==0x05 && dirx == 1){
            set_bkg_tiles(16,0,3,9,door1_r_bkg);
        }else{
            set_bkg_tiles(16,0,3,9,wall1_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(1*dirx)-diry, player_y+(1*diry)-dirx);
        if(w!=0x00 && w != 0x01){

            set_bkg_tiles(16,0,3,9,nowall1_r_bkg);

        }
    }

}
*/

void update_dng(unsigned char *dng,uint8_t dungeon_width, uint8_t dungeon_hieght){
    uint8_t py = 0;
    uint8_t px = 0;
    set_bkg_tiles(0,0,20,16,white_screen);
    //unsigned char w;
    switch (player_dir){
        case north:
            check_l_walls_n(dng,dungeon_width,dungeon_hieght);
            check_r_walls_n(dng,dungeon_width,dungeon_hieght);
            check_m_walls(dng,dungeon_width,dungeon_hieght,0,-1);
            
            SHOW_BKG;
        break;
        case south:
            check_l_walls_s(dng,dungeon_width,dungeon_hieght);
            check_r_walls_s(dng,dungeon_width,dungeon_hieght);
            check_m_walls(dng,dungeon_width,dungeon_hieght,0,+1);
            SHOW_BKG;
        break;
        case west:
            check_l_walls_w(dng,dungeon_width,dungeon_hieght);
            check_r_walls_w(dng,dungeon_width,dungeon_hieght);
            check_m_walls(dng,dungeon_width,dungeon_hieght,-1,0);

            
            SHOW_BKG;
        break;
        case east:
            check_l_walls_e(dng,dungeon_width,dungeon_hieght);
            check_r_walls_e(dng,dungeon_width,dungeon_hieght);
            check_m_walls(dng,dungeon_width,dungeon_hieght,+1,0);
            
            SHOW_BKG;
        break;
    }

}


void main(void)
{
    init_gfx();
    update_dng(test_dungeon,15,15);
    set_sprite_data(0,4,news);
    set_sprite_tile(0,player_dir);
    move_sprite(0,10,16);
    SHOW_SPRITES;
    // Loop forever
    while(1) {
        //controller handler
        joypadPrevious = joypadCurrent;
        joypadCurrent = joypad();

        if((joypadCurrent & J_LEFT) && !(joypadPrevious & J_LEFT)){
            player_dir--;
            if (player_dir==255){
                player_dir = west;
            }
            update_dng(test_dungeon,15,15);
            set_sprite_tile(0,player_dir);
        }
        if((joypadCurrent & J_RIGHT) && !(joypadPrevious & J_RIGHT)){
            player_dir++;
            if(player_dir==4){
                player_dir=north;
            }
            update_dng(test_dungeon,15,15);
            set_sprite_tile(0,player_dir);
        }
        if((joypadCurrent & J_UP) && !(joypadPrevious & J_UP)){
            switch(player_dir){
                case north:
                    player_y--;
                break;
                case east:
                    player_x++;
                break;
                case south:
                    player_y++;
                break;
                case west:
                    player_x--;
                break;
            }
            update_dng(test_dungeon,15,15);
            set_sprite_tile(0,player_dir);
        }
        if((joypadCurrent & J_DOWN) && !(joypadPrevious & J_DOWN)){
            switch(player_dir){
                case north:
                    player_y++;
                break;
                case east:
                    player_x--;
                break;
                case south:
                    player_y--;
                break;
                case west:
                    player_x++;
                break;
            }
            update_dng(test_dungeon,15,15);
            set_sprite_tile(0,player_dir);
        }
      
        //player_draw(&pl);
        
        
    
		// Game main loop processing goes here


		// Done processing, yield CPU and wait for start of next frame
       
        wait_vbl_done();
    }
}
