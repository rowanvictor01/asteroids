package config

import "vendor:raylib"


PLAYER_WIDTH: f32 : 54
PLAYER_HEIGHT: f32 : 28
PLAYER_CENTER_X: f32 : PLAYER_WIDTH / 2
PLAYER_CENTER_Y: f32 : PLAYER_HEIGHT / 2

PLAYER_BORDER_OFFSET :: 12
PLAYER_X: f32 : WINDOW_CENTER_X - PLAYER_CENTER_X
PLAYER_Y: f32 : WINDOW_HEIGHT - PLAYER_HEIGHT - PLAYER_BORDER_OFFSET

PLAYER_COLOR :: raylib.WHITE

PLAYER_VX: f32: 550


player_rect: raylib.Rectangle =
{
    x = PLAYER_X,
    y = PLAYER_Y,
    width = PLAYER_WIDTH,
    height = PLAYER_HEIGHT,
}


get_rect_center_x :: proc(rect: raylib.Rectangle) -> f32
{
    return rect.x + (rect.width / 2)
}
