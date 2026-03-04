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
    ship := entities.ship_create(config.player_rect, config.PLAYER_VX, config.PLAYER_VY, config.PLAYER_COLOR)
    
    // Create Asteroids Horde
    horde := entities.horde_create()

    // Game Loop
    for !raylib.WindowShouldClose()
    {
	    // Update
	    entities.ship_update(&ship)
	    entities.bullets_update(ship.bullets[:])
        entities.asteroids_update(horde[:])
        
        // Collision Detection
        collisions.collision_bullets_borders(ship.bullets[:])
        collisions.collision_ship_borders(&ship)
        collisions.collision_asteroids_borders(horde[:])

	    // Render
	    raylib.BeginDrawing()
	    raylib.ClearBackground(config.WINDOW_BG_COLOR)
	
	    entities.ship_draw(&ship)
	    entities.bullets_draw(ship.bullets[:])
        entities.asteroids_draw(horde[:])

	    raylib.EndDrawing()
    }
    
    raylib.CloseWindow()
}
