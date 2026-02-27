package entities

import "vendor:raylib"


Bullet :: struct
{
    x: f32,
    y: f32,
    radius: f32,
    color: raylib.Color,
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

bullet_draw :: proc(self: ^Bullet)
{
    raylib.DrawCircle(i32(self.x), i32(self.y), self.radius, self.color)
}
