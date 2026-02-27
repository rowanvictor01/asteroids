package entities

import "vendor:raylib"


Bullet :: struct
{
    x: f32,
    y: f32,
    radius: f32,
    color: raylib.Color,
    vel_y: f32,
}


bullet_create :: proc(x: f32, y: f32, radius: f32, color: raylib.Color) -> Bullet
{
    b: Bullet =
    {
	x = x,
	y = y,
	radius = radius,
	color = color,
    }
    return b
}

bullet_update :: proc(self: ^Bullet)
{
    self.y = self.y - self.vel_y * raylib.GetFrameTime()
}

bullet_draw :: proc(self: ^Bullet)
{
    raylib.DrawCircle(i32(self.x), i32(self.y), self.radius, self.color)
}
