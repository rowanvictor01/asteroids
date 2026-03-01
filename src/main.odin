package src

import "vendor:raylib"

import "config"
import "entities"
import "collisions"


main :: proc()
{
    // Create Window
    raylib.InitWindow(config.WINDOW_WIDTH, config.WINDOW_HEIGHT, config.WINDOW_TITLE)
    raylib.SetTargetFPS(60)
    
    // Create Player's Ship
    ship := entities.ship_create(config.player_rect, config.PLAYER_VX, config.PLAYER_COLOR)
    
    // Create Asteroid
    asteroid := entities.asteroid_create(config.ASTEROID_X, config.ASTEROID_Y, config.ASTEROID_RADIUS, config.ASTEROID_COLOR, config.ASTEROID_SPEED)

    // Game Loop
    for !raylib.WindowShouldClose()
    {
	    // Update
	    entities.ship_update(&ship)
	    entities.bullets_update(ship.bullets[:])
        entities.asteroid_update(&asteroid)
        
        // Collision Detection
        collisions.collision_bullets_borders(ship.bullets[:])
        collisions.collision_ship_borders(&ship)
        collisions.collision_asteroid_borders(&asteroid)

	    // Render
	    raylib.BeginDrawing()
	    raylib.ClearBackground(config.WINDOW_BG_COLOR)
	
	    entities.ship_draw(&ship)
	    entities.bullets_draw(ship.bullets[:])
        entities.asteroid_draw(&asteroid)

	    raylib.EndDrawing()
    }
    
    raylib.CloseWindow()
}
