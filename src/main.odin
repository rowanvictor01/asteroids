package src

import "vendor:raylib"

import "config"
import "entities"


main :: proc()
{
    // Create Window
    raylib.InitWindow(config.WINDOW_WIDTH, config.WINDOW_HEIGHT, config.WINDOW_TITLE)
    
    // Create Player's Ship
    ship := entities.ship_create(config.player_rect, config.PLAYER_VX, config.PLAYER_COLOR)

    // Game Loop
    for !raylib.WindowShouldClose()
    {
	entities.ship_update(&ship)

	raylib.BeginDrawing()
	raylib.ClearBackground(config.WINDOW_BG_COLOR)
	
	entities.ship_draw(&ship)

	raylib.EndDrawing()
    }
    
    raylib.CloseWindow()
}
