package src

import "vendor:raylib"

import "config"


main :: proc()
{
    // Create Window
    raylib.InitWindow(config.WINDOW_WIDTH, config.WINDOW_HEIGHT, config.WINDOW_TITLE)

    // Game Loop
    for !raylib.WindowShouldClose()
    {
	raylib.BeginDrawing()
	raylib.ClearBackground(config.WINDOW_BG_COLOR)
	raylib.EndDrawing()
    }
    
    raylib.CloseWindow()
}
