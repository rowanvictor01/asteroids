package src

import "vendor:raylib"

import "config"


main :: proc()
{
    raylib.InitWindow(config.WINDOW_WIDTH, config.WINDOW_HEIGHT, config.WINDOW_TITLE)

    for !raylib.WindowShouldClose()
    {
	raylib.BeginDrawing()
	raylib.ClearBackground(config.WINDOW_BG_COLOR)
	raylib.EndDrawing()
    }
    
    raylib.CloseWindow()
}
