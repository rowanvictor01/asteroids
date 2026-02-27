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
    defer entities.bullets_destroy(&ship.bullets)
    defer delete(ship.bullets)

    // Game Loop
    for !raylib.WindowShouldClose()
    {
	// Update
	entities.ship_update(&ship)
	entities.bullets_update(&ship.bullets)

	// Render
	raylib.BeginDrawing()
	raylib.ClearBackground(config.WINDOW_BG_COLOR)
	
	entities.ship_draw(&ship)
	entities.bullets_draw(&ship.bullets)

	raylib.EndDrawing()
    }
    
    raylib.CloseWindow()
}
