package entities

import "vendor:raylib"


Bullet :: struct
{
    x: f32,
    y: f32,
    radius: f32,
    color: raylib.Color,
    vel_y: f32,
    is_active: bool,
}


bullet_create :: proc(x: f32, y: f32, vy: f32, radius: f32, color: raylib.Color) -> Bullet
{
    b: Bullet =

    {
        x = x,
        y = y,
        vel_y = vy,
        radius = radius,
        color = color,
        is_active = false,
    }

    return b
}

bullets_update :: proc(bullets: []Bullet)
{
    for i in 0 ..< len(bullets)
    {
        if !bullets[i].is_active {continue}
        bullets[i].y = bullets[i].y - bullets[i].vel_y * raylib.GetFrameTime()
    }
}

bullets_draw :: proc(bullets: []Bullet)
{
    for i in 0 ..< len(bullets)
    {
        if !bullets[i].is_active {continue}
        raylib.DrawCircle(i32(bullets[i].x), i32(bullets[i].y), bullets[i].radius, bullets[i].color)
    }
}





/*
   HELPER PROCEDURES
*/

get_bullet_bounds_left :: proc(bullet: Bullet) -> f32
{
    return bullet.x - bullet.radius
}

// Helper Proc
get_bullet_bounds_right :: proc(bullet: Bullet) -> f32
{
    return bullet.x + bullet.radius
}

// Helper Proc
get_bullet_bounds_top :: proc(bullet: Bullet) -> f32
{
    return bullet.y - bullet.radius
}

// Helper Proc
get_bullet_bounds_bottom :: proc(bullet: Bullet) -> f32
{
    return bullet.y + bullet.radius
}