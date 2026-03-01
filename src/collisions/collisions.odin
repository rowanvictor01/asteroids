package collisions

import "../entities"
import "../config"


// BORDERS
collision_bullets_borders :: proc(bullets: []entities.Bullet)
{
    for i in 0 ..< len(bullets)
    {
        if entities.get_bullet_bounds_bottom(bullets[i]) <= config.BORDER_TOP {bullets[i].is_active = false}
    }
}

collision_ship_borders :: proc(ship: ^entities.Ship)
{
    if entities.get_ship_bounds_left(ship) <= config.BORDER_LEFT
    {
        ship.x = config.BORDER_LEFT
    }
    if entities.get_ship_bounds_right(ship) >= config.BORDER_RIGHT
    {
        ship.x = config.BORDER_RIGHT - ship.width
    }
}

collision_asteroid_borders :: proc(asteroid: ^entities.Asteroid)
{
    if entities.get_asteroid_bounds_top(asteroid) >= config.BORDER_BOTTOM
    {
        asteroid.x = entities.generate_rand_x()
        asteroid.y = config.ASTEROID_Y
    }
}