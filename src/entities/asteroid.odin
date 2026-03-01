package entities

import "vendor:raylib"


Asteroid :: struct
{
    x: f32,
    y: f32,
    radius: f32,
    color: raylib.Color,
    vel_y: f32,
    is_destroyed: bool,
}


asteroid_create :: proc(x: f32, y: f32, radius: f32, color: raylib.Color, vy: f32) -> Asteroid
{
    a: Asteroid =
    {
        x = x,
        y = y,
        radius = radius,
        color = color,
        vel_y = vy,
        is_destroyed = false,
    }
    return a
}

asteroid_draw :: proc(asteroid: ^Asteroid)
{
    if asteroid.is_destroyed {return}
    raylib.DrawCircle(i32(asteroid.x), i32(asteroid.y), asteroid.radius, asteroid.color)
}

asteroid_update :: proc(asteroid: ^Asteroid)
{
    if asteroid.is_destroyed {return}
    
    asteroid.y = asteroid.y + asteroid.vel_y * raylib.GetFrameTime()
}