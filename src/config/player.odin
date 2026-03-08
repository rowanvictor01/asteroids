package config

import "vendor:raylib"


PLAYER_WIDTH: f32 : 50
PLAYER_HEIGHT: f32 : 28
PLAYER_CENTER_X: f32 : PLAYER_WIDTH / 2
PLAYER_CENTER_Y: f32 : PLAYER_HEIGHT / 2

PLAYER_BORDER_OFFSET :: 12

// Initial Player Coordinates
PLAYER_X: f32 : WINDOW_CENTER_X - PLAYER_CENTER_X
PLAYER_Y: f32 : WINDOW_CENTER_Y - PLAYER_CENTER_Y

PLAYER_COLOR :: raylib.WHITE

PLAYER_VX: f32: 550
PLAYER_VY: f32: 550

ROTATION_SPEED: f32 : 120

PLAYER_ATTACK_RATE: f32 : 0.37
player_attack_time_accumulator: f32 = 0.37


player_rect: raylib.Rectangle =
{
    x = PLAYER_X,
    y = PLAYER_Y,
    width = PLAYER_WIDTH,
    height = PLAYER_HEIGHT,
}