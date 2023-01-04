//void check_m_wall(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, int8_t dirx, int8_t diry);
#include <gb/gb.h>
#include <stdint.h>
#include <stdbool.h>
#include "../res/walls.h"



unsigned char return_value(const unsigned char *dng, uint8_t width, uint8_t height,uint8_t x ,uint8_t y){
    if(y < height && x < width)
        return dng[ y*width + x ];
    else
        return NULL;
}

void check_m_walls(const unsigned char *dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y , uint8_t player_dir){
    uint8_t a;
    bool is_door = false;
    uint8_t dist = 0; //0 - no wall; 1 - wall1; 2 - wall2; 3 - wall3;
    bool left_is_wall = false;
    bool right_is_wall = false;
    unsigned char w=0x00;
    unsigned char l=0x00;
    unsigned char r=0x00;

    switch(player_dir){
        case 0:
            for ( a=1; a<=4; a++){
                w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y-a);
                if( w != 0x00 && w != 0x01 && dist == 0){
                    dist = a;
                    break;
                }
            }
            l = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-dist);
            r = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-dist);

        break;
        case 1:
            for ( a=1; a<=4; a++){
                w = return_value(dng,dungeon_width,dungeon_hieght,player_x+a, player_y);
                if( w != 0x00 && w != 0x01 && dist == 0){
                    dist = a;
                    break;
                }
            }
            l = return_value(dng,dungeon_width,dungeon_hieght,player_x+dist, player_y-1);
            r = return_value(dng,dungeon_width,dungeon_hieght,player_x+dist, player_y+1);
        break;
        case 2:
            for ( a=1; a<=4; a++){
                w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y+a);
                if( w != 0x00 && w != 0x01 && dist == 0){
                    dist = a;
                    break;
                }
            }
            l = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+dist);
            r = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+dist);
        break;
        case 3:
            for ( a=1; a<=4; a++){
                w = return_value(dng,dungeon_width,dungeon_hieght,player_x-a, player_y);
                if( w != 0x00 && w != 0x01 && dist == 0){
                    dist = a;
                    break;
                }
            }
            l = return_value(dng,dungeon_width,dungeon_hieght,player_x-dist, player_y+1);
            r = return_value(dng,dungeon_width,dungeon_hieght,player_x-dist, player_y-1);
        break;
    }



    if( w == 0x03 && player_dir == 0|| w == 0x04 && player_dir == 1 ||w == 0x05 && player_dir == 2 || w==0x06 && player_dir == 3){
        //set_bkg_tiles(4,0,12,9,door1_bkg);
        is_door = true;
    }else{
        //set_bkg_tiles(4,0,12,9,wall1_bkg);
        is_door = false;
    }
    if(l!=0x00 && l!=0x01){
        left_is_wall = true;
    }
    if(r!=0x00 && r!=0x01){
        right_is_wall = true;
    }

    switch (dist){
        case 1:
            if(is_door){
                if(left_is_wall){
                    set_bkg_tiles(4,3,6,9,door1_left_half_bkg);
                }else{
                    set_bkg_tiles(4,3,6,9,door1_left_half_c_bkg);
                }
                if(right_is_wall){
                    set_bkg_tiles(10,3,6,9,door1_right_half_bkg);
                }else{
                    set_bkg_tiles(10,3,6,9,door1_right_half_c_bkg);
                }
            }else{
                if(left_is_wall){
                    set_bkg_tiles(4,3,6,9,wall1_half_bkg);
                }else{
                    set_bkg_tiles(4,3,6,9,wall1_left_half_c_bkg);
                }
                if(right_is_wall){
                    set_bkg_tiles(10,3,6,9,wall1_half_bkg);
                }else{
                    set_bkg_tiles(10,3,6,9,wall1_right_half_c_bkg);
                }
            }
        break;
        case 2:
            if(is_door){
                if(left_is_wall){
                    set_bkg_tiles(6,3,4,9,door2_left_half_bkg);
                }else{
                    set_bkg_tiles(6,3,4,9,door2_left_half_c_bkg);
                }
                if(right_is_wall){
                    set_bkg_tiles(10,3,4,9,door2_right_half_bkg);
                }else{

                    set_bkg_tiles(10,3,4,9,door2_right_half_c_bkg);
                }
            }else{
                if(left_is_wall){
                    set_bkg_tiles(6,3,4,9,wall2_half_bkg);
                }else{
                    set_bkg_tiles(6,3,4,9,wall2_left_half_c_bkg);
                }
                if(right_is_wall){
                    set_bkg_tiles(10,3,4,9,wall2_half_bkg);
                }else{
                    set_bkg_tiles(10,3,4,9,wall2_right_half_c_bkg);
                }
            }
        break;
        
        case 3:
            if(is_door){
                if(left_is_wall){
                    set_bkg_tiles(7,3,3,9,door3_left_half_bkg);
                }else{
                    set_bkg_tiles(7,3,3,9,door3_left_half_c_bkg);
                }
                if(right_is_wall){
                    set_bkg_tiles(10,3,3,9,door3_right_half_bkg);
                }else{
                    set_bkg_tiles(10,3,3,9,door3_right_half_c_bkg);
                }
            }else{
                if(left_is_wall){
                    set_bkg_tiles(7,3,3,9,wall3_half_bkg);
                }else{
                    set_bkg_tiles(7,3,3,9,wall3_left_half_c_bkg);
                }
                if(right_is_wall){
                    set_bkg_tiles(10,3,3,9,wall3_half_bkg);
                }else{
                    set_bkg_tiles(10,3,3,9,wall3_right_half_c_bkg);
                }
            }
        break;
        }
    }

void check_l_walls(const unsigned char *dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y ,uint8_t player_dir){
    unsigned char w[]={0x00,0x00,0x00,0x00};
    unsigned char d=0x00;
    unsigned char nd=0x00;
    int8_t i = 0;
    switch(player_dir){
        case 0:
            for (i=0; i<4; i++){
                w[i] = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-i);    
            }
            d=0x06;
            nd=0x03;
        break;
        case 1:
            for (i=0; i<4; i++){
                w[i] = return_value(dng,dungeon_width,dungeon_hieght,player_x+i, player_y-1);
            }
            d=0x03;
            nd=0x04;
        break;
        case 2:
            for (i=0; i<4; i++){
                w[i] = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+i);
            }
            d=0x04;
            nd=0x05;
        break;
        case 3:
            for (i=0; i<4; i++){
                w[i] = return_value(dng,dungeon_width,dungeon_hieght,player_x-i, player_y+1);
            }
            d=0x05;
            nd=0x06;
        break;
    }
    for(i=3, i>=0; i--;){
        if(w[i]!=0x00 && w[i]!=0x01){
            
            if(i==2) if(w[i]==d) set_bkg_tiles(6,3,1,9,door3_l_bkg); else set_bkg_tiles(6,3,1,9,wall3_l_bkg);
            if(i==1) if(w[i]==d) set_bkg_tiles(4,3,2,9,door2_l_bkg); else set_bkg_tiles(4,3,2,9,wall2_l_bkg);
            if(i==0) if(w[i]==d) set_bkg_tiles(1,3,3,9,door1_l_bkg); else set_bkg_tiles(1,3,3,9,wall1_l_bkg);
        } else{
            if(w[i]==0x00 && w[i+1]!=0x00 && w[i+1]!=0x01){
            if(i==2) if(w[i+1]==nd) set_bkg_tiles(1,3,6,9,nowall_door3_l_bkg); else set_bkg_tiles(1,3,6,9,nowall3_l_bkg);
            if(i==1) if(w[i+1]==nd) set_bkg_tiles(1,3,5,9,nowall_door2_l_bkg); else set_bkg_tiles(1,3,5,9,nowall2_l_bkg);
            if(i==0) if(w[i+1]==nd) set_bkg_tiles(1,3,3,9,nowall_door1_l_bkg); else set_bkg_tiles(1,3,3,9,nowall1_l_bkg);
            }
        }
    }

}

void check_r_walls(const unsigned char *dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y ,uint8_t player_dir){
    unsigned char w[]={0x00,0x00,0x00,0x00};
    unsigned char d=0x00;
    unsigned char nd=0x00;
    int8_t i = 0;
    switch(player_dir){
        case 0:
            for (i=0; i<4; i++){
                w[i] = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-i);    
            }
            d=0x04;
            nd=0x03;
        break;
        case 1:
            for (i=0; i<4; i++){
                w[i] = return_value(dng,dungeon_width,dungeon_hieght,player_x+i, player_y+1);
            }
            d=0x05;
            nd=0x04;
        break;
        case 2:
            for (i=0; i<4; i++){
                w[i] = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+i);
            }
            d=0x06;
            nd=0x05;
        break;
        case 3:
            for (i=0; i<4; i++){
                w[i] = return_value(dng,dungeon_width,dungeon_hieght,player_x-i, player_y-1);
            }
            d=0x03;
            nd=0x06;
        break;
    }
    for(i=3, i>=0; i--;){
        if(w[i]!=0x00 && w[i]!=0x01){
            
            if(i==2) if(w[i]==d) set_bkg_tiles(13,3,1,9,door3_r_bkg); else set_bkg_tiles(13,3,1,9,wall3_r_bkg);
            if(i==1) if(w[i]==d) set_bkg_tiles(14,3,2,9,door2_r_bkg); else set_bkg_tiles(14,3,2,9,wall2_r_bkg);
            if(i==0) if(w[i]==d) set_bkg_tiles(16,3,3,9,door1_r_bkg); else set_bkg_tiles(16,3,3,9,wall1_r_bkg);
        } else{
            if(w[i]==0x00 && w[i+1]!=0x00 && w[i+1]!=0x01){
            if(i==2) if(w[i+1]==nd) set_bkg_tiles(13,3,6,9,nowall_door3_r_bkg); else set_bkg_tiles(13,3,6,9,nowall3_r_bkg);
            if(i==1) if(w[i+1]==nd) set_bkg_tiles(14,3,5,9,nowall_door2_r_bkg); else set_bkg_tiles(14,3,5,9,nowall2_r_bkg);
            if(i==0) if(w[i+1]==nd) set_bkg_tiles(16,3,3,9,nowall_door1_r_bkg); else set_bkg_tiles(16,3,3,9,nowall1_r_bkg);
            }
        }
    }

}

/*
void check_l_walls_n(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){

    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-2);
    if(w != 0x00 && w != 0x01){
        if( w == 0x06){
            set_bkg_tiles(6,3,1,9,door3_l_bkg);
        }else{
            set_bkg_tiles(6,3,1,9,wall3_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-3);
        if(w != 0x00 && w != 0x01){
            if( w == 0x03){
                set_bkg_tiles(1,3,6,9,nowall_door3_l_bkg);
            }else{
                set_bkg_tiles(1,3,6,9,nowall3_l_bkg);
            }
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x06){
            set_bkg_tiles(4,3,2,9,door2_l_bkg);
        }else{
            set_bkg_tiles(4,3,2,9,wall2_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-2);
        if(w != 0x00 && w != 0x01){
            if( w == 0x03){
                set_bkg_tiles(1,3,5,9,nowall_door2_l_bkg);
            }else{
                set_bkg_tiles(1,3,5,9,nowall2_l_bkg);
            }
        }
    }
    
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y);
    if(w!=0x00 && w != 0x01){
        if( w == 0x06){
            set_bkg_tiles(1,3,3,9,door1_l_bkg);
        }else{
            set_bkg_tiles(1,3,3,9,wall1_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x03){
                set_bkg_tiles(1,3,3,9,nowall_door1_l_bkg);
            }else{
                set_bkg_tiles(1,3,3,9,nowall1_l_bkg);
            }
        }
    }
}

void check_l_walls_e(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y-1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x03){
            set_bkg_tiles(6,3,1,9,door3_l_bkg);
        }else{
            set_bkg_tiles(6,3,1,9,wall3_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+3, player_y-1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x04){
                set_bkg_tiles(1,3,6,9,nowall_door3_l_bkg);
            }else{
                set_bkg_tiles(1,3,6,9,nowall3_l_bkg);
            }
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x03){
            set_bkg_tiles(4,3,2,9,door2_l_bkg);
        }else{
            set_bkg_tiles(4,3,2,9,wall2_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y-1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x04){
                set_bkg_tiles(1,3,5,9,nowall_door2_l_bkg);
            }else{
                set_bkg_tiles(1,3,5,9,nowall2_l_bkg);
            }
        }
    }
    
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y-1);
    if(w!=0x00 && w != 0x01){
        if( w == 0x03){
            set_bkg_tiles(1,3,3,9,door1_l_bkg);
        }else{
            set_bkg_tiles(1,3,3,9,wall1_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x04){
                set_bkg_tiles(1,3,3,9,nowall_door1_l_bkg);
            }else{
                set_bkg_tiles(1,3,3,9,nowall1_l_bkg);
            }
        }
    }
}

void check_l_walls_s(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+2);
    if(w != 0x00 && w != 0x01){
        if( w == 0x04){
            set_bkg_tiles(6,3,1,9,door3_l_bkg);
        }else{
            set_bkg_tiles(6,3,1,9,wall3_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+3);
        if(w != 0x00 && w != 0x01){
            if( w == 0x05){
                set_bkg_tiles(1,3,6,9,nowall_door3_l_bkg);
            }else{
                set_bkg_tiles(1,3,6,9,nowall3_l_bkg);
            }
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x04){
            set_bkg_tiles(4,3,2,9,door2_l_bkg);
        }else{
            set_bkg_tiles(4,3,2,9,wall2_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+2);
        if(w != 0x00 && w != 0x01){
            if( w == 0x05){
                set_bkg_tiles(1,3,5,9,nowall_door2_l_bkg);
            }else{
                set_bkg_tiles(1,3,5,9,nowall2_l_bkg);
            }
        }
    }
    
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y);
    if(w!=0x00 && w != 0x01){
        if( w == 0x04){
            set_bkg_tiles(1,3,3,9,door1_l_bkg);
        }else{
            set_bkg_tiles(1,3,3,9,wall1_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x05){
                set_bkg_tiles(1,3,3,9,nowall_door1_l_bkg);
            }else{
                set_bkg_tiles(1,3,3,9,nowall1_l_bkg);
            }
        }
    }
}

void check_l_walls_w(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y+1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x05){
            set_bkg_tiles(6,3,1,9,door3_l_bkg);
        }else{
            set_bkg_tiles(6,3,1,9,wall3_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-3, player_y+1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x06){
                set_bkg_tiles(1,3,6,9,nowall_door3_l_bkg);
            }else{
                set_bkg_tiles(1,3,6,9,nowall3_l_bkg);
            }
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x05){
            set_bkg_tiles(4,3,2,9,door2_l_bkg);
        }else{
            set_bkg_tiles(4,3,2,9,wall2_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y+1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x06){
                set_bkg_tiles(1,3,5,9,nowall_door2_l_bkg);
            }else{
                set_bkg_tiles(1,3,5,9,nowall2_l_bkg);
            }
        }
    }
    
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y+1);
    if(w!=0x00 && w != 0x01){
        if( w == 0x05){
            set_bkg_tiles(1,3,3,9,door1_l_bkg);
        }else{
            set_bkg_tiles(1,3,3,9,wall1_l_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x06){
                set_bkg_tiles(1,3,3,9,nowall_door1_l_bkg);
            }else{
                set_bkg_tiles(1,3,3,9,nowall1_l_bkg);
            }
        }
    }
}
*/
/*
void check_r_walls_n(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-2);
    if(w != 0x00 && w != 0x01){
        if( w == 0x04){
            set_bkg_tiles(13,3,1,9,door3_r_bkg);
        }else{
            set_bkg_tiles(13,3,1,9,wall3_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-3);
        if(w != 0x00 && w != 0x01){
            if( w == 0x03){
                set_bkg_tiles(13,3,6,9,nowall_door3_r_bkg);
            }else{
                set_bkg_tiles(13,3,6,9,nowall3_r_bkg);
            }
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x04){
            set_bkg_tiles(14,3,2,9,door2_r_bkg);
        }else{
            set_bkg_tiles(14,3,2,9,wall2_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-2);
        if(w != 0x00 && w != 0x01){
            if( w == 0x03){
                set_bkg_tiles(14,3,5,9,nowall_door2_r_bkg);
            }else{
                set_bkg_tiles(14,3,5,9,nowall2_r_bkg);
            }
        }
    }
    
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y);
    if(w!=0x00 && w != 0x01){
        if( w == 0x04){
            set_bkg_tiles(16,3,3,9,door1_r_bkg);
        }else{
            set_bkg_tiles(16,3,3,9,wall1_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y-1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x03){
                set_bkg_tiles(16,3,3,9,nowall_door1_r_bkg);
            }else{
                set_bkg_tiles(16,3,3,9,nowall1_r_bkg);
            }
        }
    }
}

void check_r_walls_e(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y+1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x05){
            set_bkg_tiles(13,3,1,9,door3_r_bkg);
        }else{
            set_bkg_tiles(13,3,1,9,wall3_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+3, player_y+1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x04){
                set_bkg_tiles(13,3,6,9,nowall_door3_r_bkg);
            }else{
                set_bkg_tiles(13,3,6,9,nowall3_r_bkg);
            }
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x05){
            set_bkg_tiles(14,3,2,9,door2_r_bkg);
        }else{
            set_bkg_tiles(14,3,2,9,wall2_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+2, player_y+1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x04){
                set_bkg_tiles(14,3,5,9,nowall_door2_r_bkg);
            }else{
                set_bkg_tiles(14,3,5,9,nowall2_r_bkg);
            }
        }
    }
    
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y+1);
    if(w!=0x00 && w != 0x01){
        if( w == 0x05){
            set_bkg_tiles(16,3,3,9,door1_r_bkg);
        }else{
            set_bkg_tiles(16,3,3,9,wall1_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x+1, player_y+1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x04){
                set_bkg_tiles(16,3,3,9,nowall_door1_r_bkg);
            }else{
                set_bkg_tiles(16,3,3,9,nowall1_r_bkg);
            }
        }
    }
}

void check_r_walls_s(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+2);
    if(w != 0x00 && w != 0x01){
        if( w == 0x06){
            set_bkg_tiles(13,3,1,9,door3_r_bkg);
        }else{
            set_bkg_tiles(13,3,1,9,wall3_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+3);
        if(w != 0x00 && w != 0x01){
            if( w == 0x05){
                set_bkg_tiles(13,3,6,9,nowall_door3_r_bkg);
            }else{
                set_bkg_tiles(13,3,6,9,nowall3_r_bkg);
            }
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x06){
            set_bkg_tiles(14,3,2,9,door2_r_bkg);
        }else{
            set_bkg_tiles(14,3,2,9,wall2_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+2);
        if(w != 0x00 && w != 0x01){
            if( w == 0x05){
                set_bkg_tiles(14,3,5,9,nowall_door2_r_bkg);
            }else{
                set_bkg_tiles(14,3,5,9,nowall2_r_bkg);
            }
        }
    }
    
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y);
    if(w!=0x00 && w != 0x01){
        if( w == 0x06){
            set_bkg_tiles(16,3,3,9,door1_r_bkg);
        }else{
            set_bkg_tiles(16,3,3,9,wall1_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y+1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x05){
                set_bkg_tiles(16,3,3,9,nowall_door1_r_bkg);
            }else{
                set_bkg_tiles(16,3,3,9,nowall1_r_bkg);
            }
        }
    }
}

void check_r_walls_w(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y){
    unsigned char w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y-1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x03){
            set_bkg_tiles(13,3,1,9,door3_r_bkg);
        }else{
            set_bkg_tiles(13,3,1,9,wall3_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-3, player_y-1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x06){
                set_bkg_tiles(13,3,6,9,nowall_door3_r_bkg);
            }else{
                set_bkg_tiles(13,3,6,9,nowall3_r_bkg);
            }
        }
    }
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
    if(w != 0x00 && w != 0x01){
        if( w == 0x03){
            set_bkg_tiles(14,3,2,9,door2_r_bkg);
        }else{
            set_bkg_tiles(14,3,2,9,wall2_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-2, player_y-1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x06){
                set_bkg_tiles(14,3,5,9,nowall_door2_r_bkg);
            }else{
                set_bkg_tiles(14,3,5,9,nowall2_r_bkg);
            }
        }
    }
    
    w = return_value(dng,dungeon_width,dungeon_hieght,player_x, player_y-1);
    if(w!=0x00 && w != 0x01){
        if( w == 0x03){
            set_bkg_tiles(16,3,3,9,door1_r_bkg);
        }else{
            set_bkg_tiles(16,3,3,9,wall1_r_bkg);
        }
    }else{
        w = return_value(dng,dungeon_width,dungeon_hieght,player_x-1, player_y-1);
        if(w != 0x00 && w != 0x01){
            if( w == 0x06){
                set_bkg_tiles(16,3,3,9,nowall_door1_r_bkg);
            }else{
                set_bkg_tiles(16,3,3,9,nowall1_r_bkg);
            }
        }
    }
}

*/