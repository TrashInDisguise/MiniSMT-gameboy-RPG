//void check_m_wall(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, int8_t dirx, int8_t diry);
#include <gb/gb.h>
#include <stdint.h>
#include <stdbool.h>
#include "../res/walls.h"



unsigned char return_value(const unsigned char *dng, uint8_t width, uint8_t height,uint8_t x ,uint8_t y){
    if(y*width + x < height*width)
        return dng[ y*width + x ];
    else
        return NULL;
}

void check_m_walls(const unsigned char *dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y ,int8_t dirx, int8_t diry){
    uint8_t a;
    bool is_door = false;
    uint8_t dist = 0; //0 - no wall; 1 - wall1; 2 - wall2; 3 - wall3;
    bool left_is_wall = false;
    bool right_is_wall = false;

    for ( a=1; a<=4; a++){
        unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(a*dirx), player_y+(a*diry));
        if( w != 0x00 && w != 0x01 && dist == 0){
            dist = a;
            if( w == 0x03 && diry == -1 || w == 0x04 && dirx == 1 ||w == 0x05 && diry == 1 || w==0x06 && dirx == -1){
                //set_bkg_tiles(4,0,12,9,door1_bkg);
                is_door = true;
            }else{
                //set_bkg_tiles(4,0,12,9,wall1_bkg);
                is_door = false;
            }
            w = return_value(dng,dungeon_width,dungeon_hieght,(player_x+(a*dirx))-diry, (player_y+(a*diry))-dirx);
            if(w!=0x00 && w!=0x01){
                left_is_wall = true;
            }
            w = return_value(dng,dungeon_width,dungeon_hieght,(player_x+(a*dirx))+diry, (player_y+(a*diry))+dirx);
            if(w!=0x00 && w!=0x01){
                right_is_wall = true;
            }
            break;
        }
    }
    switch (dist){
        case 1:
            if(is_door){
                if(left_is_wall){
                    set_bkg_tiles(4,0,6,9,door1_left_half_bkg);
                }else{
                    set_bkg_tiles(4,0,6,9,door1_left_half_c_bkg);
                }
                if(right_is_wall){
                    set_bkg_tiles(10,0,6,9,door1_right_half_bkg);
                }else{
                    set_bkg_tiles(10,0,6,9,door1_right_half_c_bkg);
                }
            }else{
                if(left_is_wall){
                    set_bkg_tiles(4,0,6,9,wall1_half_bkg);
                }else{
                    set_bkg_tiles(4,0,6,9,wall1_left_half_c_bkg);
                }
                if(right_is_wall){
                    set_bkg_tiles(10,0,6,9,wall1_half_bkg);
                }else{
                    set_bkg_tiles(10,0,6,9,wall1_right_half_c_bkg);
                }
            }
        break;
        case 2:
            if(is_door){
                if(left_is_wall){
                    set_bkg_tiles(6,0,4,9,door2_left_half_bkg);
                }else{
                    set_bkg_tiles(6,0,4,9,door2_left_half_c_bkg);
                }
                if(right_is_wall){
                    set_bkg_tiles(10,0,4,9,door2_right_half_bkg);
                }else{

                    set_bkg_tiles(10,0,4,9,door2_right_half_c_bkg);
                }
            }else{
                if(left_is_wall){
                    set_bkg_tiles(6,0,4,9,wall2_half_bkg);
                }else{
                    set_bkg_tiles(6,0,4,9,wall2_left_half_c_bkg);
                }
                if(right_is_wall){
                    set_bkg_tiles(10,0,4,9,wall2_half_bkg);
                }else{
                    set_bkg_tiles(10,0,4,9,wall2_right_half_c_bkg);
                }
            }
        break;
        
        case 3:
            if(is_door){
                if(left_is_wall){
                    set_bkg_tiles(7,0,3,9,door3_left_half_bkg);
                }else{
                    set_bkg_tiles(7,0,3,9,door3_left_half_c_bkg);
                }
                if(right_is_wall){
                    set_bkg_tiles(10,0,3,9,door3_right_half_bkg);
                }else{
                    set_bkg_tiles(10,0,3,9,door3_right_half_c_bkg);
                }
            }else{
                if(left_is_wall){
                    set_bkg_tiles(7,0,3,9,wall3_half_bkg);
                }else{
                    set_bkg_tiles(7,0,3,9,wall3_left_half_c_bkg);
                }
                if(right_is_wall){
                    set_bkg_tiles(10,0,3,9,wall3_half_bkg);
                }else{
                    set_bkg_tiles(10,0,3,9,wall3_right_half_c_bkg);
                }
            }
        break;
        }
    }
/*
void check_l_walls(const unsigned char *dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y ,uint8_t player_dir){
    int8_t dirx = 0;
    int8_t diry = 0;
    int8_t i;
    unsigned char w;
    unsigned char walls[]={0,0,0};
    switch (player_dir){
        case 0://north
            dirx = 0;
            diry =-1;
        break;
        case 1://east
            dirx = 1;
            diry = 0;
        break;
        case 2://south
            dirx = 0;
            diry = 1;
        break;
        case 3://west
            dirx =-1;
            diry = 0;
        break;
    }

    for(i = 2; i>=0; i--){
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+(i*dirx)+diry, player_y+(i*diry)+dirx);
        if(w != 0x00 && w != 0x01){
            if((w == 0x06 && player_dir == 0)||(w == 0x03 && player_dir == 1)||(w == 0x04 && player_dir == 2)||(w == 0x05 && player_dir == 3)){
                //set_bkg_tiles(6,0,1,9,door3_l_bkg);
                walls[i] = 0x02;//door
            }else{
                walls[i] = 0x01;//wall
                //set_bkg_tiles(6,0,1,9,wall3_l_bkg);
            }
        }else{
            w = return_value(dng,dungeon_width,dungeon_hieght,player_x+((i+1)*dirx)+diry, player_y+((i+1)*diry)+dirx);
            if(w != 0x00 && w != 0x01){
                if( (w == 0x03 && player_dir == 0)|| (w == 0x04 && player_dir == 1)||(w == 0x05 && player_dir == 2)||(w == 0x06 && player_dir == 3)){
                    walls[i]=0x04;//no wall with door
                    //set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
                }else{
                    walls[i]=0x03;//no wall
                    //set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
                }
            }
        }
    }
    for(i = 2; i>=0; i--){
        switch(walls[i]){
            case 0x01:
                if(i == 0)set_bkg_tiles(1,0,3,9,wall1_l_bkg);
                if(i == 1)set_bkg_tiles(4,0,2,9,wall2_l_bkg);
                if(i == 2)set_bkg_tiles(6,0,1,9,wall3_l_bkg);
            break;

            case 0x02:
                if(i == 0)set_bkg_tiles(1,0,3,9,door1_l_bkg);
                if(i == 1)set_bkg_tiles(4,0,2,9,door2_l_bkg);
                if(i == 2)set_bkg_tiles(6,0,1,9,door3_l_bkg);
            break;

            case 0x03:
                if(i == 0) set_bkg_tiles(1,0,3,9,nowall1_l_bkg);
                if(i == 1) set_bkg_tiles(1,0,5,9,nowall2_l_bkg);
                if(i == 2) set_bkg_tiles(1,0,6,9,nowall3_l_bkg);
                break;

            case 0x04:
                if(i == 0) set_bkg_tiles(1,0,3,9,nowall_door1_l_bkg);
                if(i == 1) set_bkg_tiles(1,0,5,9,nowall_door2_l_bkg);
                if(i == 2) set_bkg_tiles(1,0,6,9,nowall_door3_l_bkg);
            break;

        }
    }

}
*/

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

