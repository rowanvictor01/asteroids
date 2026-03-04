package entities

import "vendor:raylib"

import "../config"


Ship :: struct
{
    using rect: raylib.Rectangle,
    vel_x: f32,
    vel_y: f32,
    angle: f32,
    color: raylib.Color,
    bullets: [config.BULLETS_AMOUNT]Bullet
}


// Private Procedures
@(private="file")
load_bullets :: proc(ship: ^Ship) -> [config.BULLETS_AMOUNT]Bullet
{
    bullets: [config.BULLETS_AMOUNT]Bullet

    for i in 0 ..< len(bullets)
    {
        b := bullet_create(get_ship_center_x(ship.rect), get_ship_front(ship.rect, config.BULLET_RADIUS), config.BULLET_SPEED, config.BULLET_RADIUS, config.BULLET_COLOR)
        bullets[i] = b
    }
    
    return bullets
}

@(private="file")
shoot_bullet :: proc(ship: ^Ship)
{
    if !config.are_bullets_loaded
    {
        ship.bullets = load_bullets(ship)
        config.are_bullets_loaded = true
    }
    
    // Limits attack fire rate
    if config.player_attack_time_accumulator < config.PLAYER_ATTACK_RATE {return}

    for i in 0 ..< len(ship.bullets)
    {
        if !ship.bullets[i].is_active
        {
            ship.bullets[i].is_active = true
            ship.bullets[i].x = get_ship_center_x(ship.rect)
            ship.bullets[i].y = get_ship_front(ship.rect, ship.bullets[i].radius)
            config.player_attack_time_accumulator = 0
            return
        }
    }
}


ship_create :: proc(rect: raylib.Rectangle, vx: f32, vy: f32, color: raylib.Color) -> Ship
{
    s: Ship =
    {
	    rect = rect,
	    vel_x = vx,
        vel_y = vy,
        angle = 0,
	    color = color,
    }
    return s
}

ship_draw :: proc(ship: ^Ship)
{
    origin: [2]f32 = {config.PLAYER_CENTER_X, config.PLAYER_CENTER_Y}
    raylib.DrawRectanglePro(ship.rect, origin, ship.angle, ship.color)
}

ship_update :: proc(ship: ^Ship)
{
    config.player_attack_time_accumulator += raylib.GetFrameTime()

    if raylib.IsKeyDown(raylib.KeyboardKey.A)
    {
        ship.angle -= config.ROTATION_SPEED * raylib.GetFrameTime()
    }
    if raylib.IsKeyDown(raylib.KeyboardKey.D)
    {
        ship.angle += config.ROTATION_SPEED * raylib.GetFrameTime()
    }
    if raylib.IsKeyDown(raylib.KeyboardKey.W)
    {
    }
    if raylib.IsKeyDown(raylib.KeyboardKey.SPACE)
    {
        shoot_bullet(ship)
    }
}


/*
   HELPER PROCEDURES
*/

get_ship_center_x :: proc(rect: raylib.Rectangle) -> f32
{
    return rect.x + (rect.width / 2)
}

// Get ship's tip to fire bullets
get_ship_front :: proc(rect: raylib.Rectangle, r: f32) -> f32
{
    return rect.y - r
}

// Get ship's left bounds/side
get_ship_bounds_left :: proc(ship: ^Ship) -> f32
{
    return ship.x
}

// Get ship's right bounds/side
get_ship_bounds_right :: proc(ship: ^Ship) -> f32
{
    return ship.x + ship.width
}