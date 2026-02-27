package entities

import "vendor:raylib"


Ship :: struct
{
    using rect: raylib.Rectangle,
    vel_x: f32,
    color: raylib.Color,
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

ship_draw :: proc(self: ^Ship)
{
    raylib.DrawRectangle(i32(self.x), i32(self.y), i32(self.width), i32(self.height), self.color)
}

ship_update :: proc(self: ^Ship)
{
    if raylib.IsKeyDown(raylib.KeyboardKey.A)
    {
	self.x = self.x - self.vel_x * raylib.GetFrameTime()
    }
    if raylib.IsKeyDown(raylib.KeyboardKey.D)
    {
	self.x = self.x + self.vel_x * raylib.GetFrameTime()
    }
}
