package entities

import "vendor:raylib"

import "../config"


Ship :: struct
{
    using rect: raylib.Rectangle,
    vel_x: f32,
    color: raylib.Color,
    bullets: [dynamic]^Bullet
}


ship_create :: proc(rect: raylib.Rectangle, vx: f32, color: raylib.Color) -> Ship
{
    s: Ship =
    {
	rect = rect,
	vel_x = vx,
	color = color,
    }
    return s
}

ship_draw :: proc(ship: ^Ship)
{
    raylib.DrawRectangle(i32(ship.x), i32(ship.y), i32(ship.width), i32(ship.height), ship.color)
}

ship_update :: proc(ship: ^Ship)
{
    if raylib.IsKeyDown(raylib.KeyboardKey.A)
    {
	ship.x = ship.x - ship.vel_x * raylib.GetFrameTime()
    }
    if raylib.IsKeyDown(raylib.KeyboardKey.D)
    {
	ship.x = ship.x + ship.vel_x * raylib.GetFrameTime()
    }
    if raylib.IsKeyDown(raylib.KeyboardKey.SPACE)
    {
	// TODO: Limit rate of fire
	ship_attack(ship)
    }
}

ship_attack :: proc(ship: ^Ship)
{
    bullet := bullet_create(config.get_rect_center_x(ship.rect), ship.y, config.BULLET_SPEED, config.BULLET_RADIUS, config.BULLET_COLOR)
    append(&ship.bullets, bullet)
}
