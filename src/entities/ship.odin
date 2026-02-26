package entities

import "vendor:raylib"


Ship :: struct
{
    using rect: raylib.Rectangle,
    color: raylib.Color,
}


ship_create :: proc(rect: raylib.Rectangle, color: raylib.Color) -> Ship
{
    s: Ship =
    {
	rect = rect,
	color = color,
    }
    return s
}

ship_draw :: proc(self: ^Ship)
{
    raylib.DrawRectangle(i32(self.x), i32(self.y), i32(self.width), i32(self.height), self.color)
}
