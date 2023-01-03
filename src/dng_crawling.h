#ifndef _DNG_CRAWLING_H_
#define _DNG_CRAWLING_H_


//void func(uint8_t t);
unsigned char return_value(const unsigned char *dng, uint8_t width, uint8_t height,uint8_t x ,uint8_t y);
void check_m_walls(const unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y , int8_t dirx, int8_t diry);

void check_l_walls(const unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y , uint8_t player_dir);

void check_l_walls_n(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y);
void check_l_walls_s(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y);
void check_l_walls_w(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y);
void check_l_walls_e(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y);
void check_r_walls_n(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y);
void check_r_walls_s(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y);
void check_r_walls_w(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y);
void check_r_walls_e(unsigned char* dng, uint8_t dungeon_width, uint8_t dungeon_hieght, uint8_t player_x, uint8_t player_y);

#endif
