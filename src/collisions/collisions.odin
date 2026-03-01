package collisions

import "../entities"
import "../config"


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