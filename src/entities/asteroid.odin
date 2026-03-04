package entities

import "vendor:raylib"
import "core:math/rand"

import "../config"


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

horde_create :: proc() -> [config.HORDE_SIZE]Asteroid
{
    horde: [config.HORDE_SIZE]Asteroid

    for i in 0 ..< config.HORDE_SIZE
    {
        horde[i] = asteroid_create(generate_rand_x(), generate_rand_y(), config.ASTEROID_RADIUS, config.ASTEROID_COLOR, config.ASTEROID_SPEED)
    }
    
    return horde
}

asteroids_draw :: proc(horde: []Asteroid)
{
    for &asteroid in horde
    {
        if asteroid.is_destroyed {continue}
        raylib.DrawCircle(i32(asteroid.x), i32(asteroid.y), asteroid.radius, asteroid.color)
    }
}

asteroids_update :: proc(horde: []Asteroid)
{
    for &asteroid in horde
    {
        if asteroid.is_destroyed {continue}
        asteroid.y = asteroid.y + asteroid.vel_y * raylib.GetFrameTime()
    }
}


/*
   HELPER PROCEDURES
*/

get_asteroid_bounds_top :: proc(asteroid: ^Asteroid) -> f32
{
    return asteroid.y - asteroid.radius
}

get_asteroid_bounds_bottom :: proc(asteroid: ^Asteroid) -> f32
{
    return asteroid.y + asteroid.radius
}

generate_rand_x :: proc() -> f32
{
    return rand.float32_range(config.ASTEROID_X, config.BORDER_RIGHT - config.ASTEROID_RADIUS)
}

generate_rand_y :: proc() -> f32
{
    return rand.float32_range(config.HORDE_VERTICAL_LEN, config.ASTEROID_Y)
}