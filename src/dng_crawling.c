//void check_m_wall(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, int8_t dirx, int8_t diry);
#include <gb/gb.h>
#include <stdint.h>
#include <stdio.h>
#include "../res/walls.h"



unsigned char return_value(const unsigned char *dng, uint8_t width, uint8_t height,uint8_t x ,uint8_t y){
    if(y*width + x < height*width)
        return dng[ y*width + x ];
    else
        return NULL;
}

void check_m_walls(const unsigned char *dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y ,int8_t dirx, int8_t diry){
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

void check_l_walls_n(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
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

void check_l_walls_e(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
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

void check_l_walls_s(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
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

void check_l_walls_w(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
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

void check_r_walls_n(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
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

void check_r_walls_e(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
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

void check_r_walls_s(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
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

void check_r_walls_w(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
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

