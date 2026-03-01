package collisions

import "../entities"
import "../config"


collision_bullets_borders :: proc(bullets: []entities.Bullet)
{
    for i in 0 ..< len(bullets)
    {
        if entities.get_bullet_bound_bottom(bullets[i]) <= config.BORDER_TOP {bullets[i].is_active = false}
    }
}