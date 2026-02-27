package entities

import "vendor:raylib"

import "core:fmt"


Bullet :: struct
{
    x: f32,
    y: f32,
    radius: f32,
    color: raylib.Color,
    vel_y: f32,
}


bullet_create :: proc(x: f32, y: f32, vy: f32, radius: f32, color: raylib.Color) -> ^Bullet
{
    b := new(Bullet)

    b.x = x
    b.y = y
    b.vel_y = vy
    b.radius = radius
    b.color = color

    return b
}

bullets_update :: proc(bullets: ^[dynamic]^Bullet)
{
    for i in 0 ..< len(bullets)
    {
	bullets[i].y = bullets[i].y - bullets[i].vel_y * raylib.GetFrameTime()
    }
}

bullets_draw :: proc(bullets: ^[dynamic]^Bullet)
{
    for i in 0 ..< len(bullets)
    {
	raylib.DrawCircle(i32(bullets[i].x), i32(bullets[i].y), bullets[i].radius, bullets[i].color)
    }
}

bullets_destroy :: proc(bullets: ^[dynamic]^Bullet)
{
    for i in 0 ..< len(bullets)
    {
	free(bullets[i])
    }
}
