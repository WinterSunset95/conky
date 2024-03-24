local function print_text(cr, font, font_size, red, green, blue, xpos, ypos, text)
	cairo_select_font_face(cr, font, font_slant, font_weight)
	cairo_set_font_size(cr, font_size)
	cairo_set_source_rgb(cr, red, green, blue)
	cairo_move_to(cr, xpos, ypos)
	cairo_show_text(cr, text)
	cairo_stroke(cr)
end

local function draw_rect(cr, xpos, ypos, width, height, line_width, red, green, blue)
	corner_radius = 10
	cairo_new_sub_path(cr)
	cairo_arc(cr, xpos + width - corner_radius, ypos + corner_radius, corner_radius, -math.pi / 2, 0)
	cairo_arc(cr, xpos + width - corner_radius, ypos + height - corner_radius, corner_radius, 0, math.pi / 2)
	cairo_arc(cr, xpos + corner_radius, ypos + height - corner_radius, corner_radius, math.pi / 2, math.pi)
	cairo_arc(cr, xpos + corner_radius, ypos + corner_radius, corner_radius, math.pi, -math.pi / 2)
	cairo_close_path(cr)
	cairo_set_source_rgb(cr, red, green, blue)
	cairo_set_line_width(cr, line_width)
	cairo_stroke(cr)
end

local function draw_hr(cr, xpos, ypos, length)
	cairo_move_to(cr, xpos, ypos)
	cairo_line_to(cr, xpos + length, ypos)
	cairo_stroke(cr)
end

function conky_print_info()
	if conky_window == nil then return end
	local cairo = require('cairo')
	if cairo == nil then return end

    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    cr = cairo_create(cs)

	-- Global text settings
	font = "ComicShannsMono Nerd Font"
	red, green, blue = 110, 110, 110
	font_slant = CAIRO_FONT_SLANT_NORMAL
	font_weight = CAIRO_FONT_WEIGHT_NORMAL
	xpos = 520
	ypos = 110

	---- Let's draw a rectangle for the header
	--draw_rect(cr, 500, 50, 500, 100, 2, 110, 110, 110)
	---- Rectangle for the battery info
	--draw_rect(cr, 500, 175, 235, 100, 2, 110, 110, 110)
	---- Rectangle for the CPU info
	--draw_rect(cr, 765, 175, 235, 100, 2, 110, 110, 110)
	---- Rectangle for the Brightness info
	--draw_rect(cr, 500, 300, 235, 100, 2, 110, 110, 110)
	---- Rectangle for the Volume info
	--draw_rect(cr, 765, 300, 235, 100, 2, 110, 110, 110)

	---- Header
	--font_size = 40
	--text = "Blackarch: Autumn"
	--print_text(cr, font, font_size, red, green, blue, xpos, ypos, text)

	-- Battery info
	font_size = 20
	xpos = 520
	ypos = 250
	text = "Battery: 100%"

	cairo_surface_destroy(cs)
	cairo_destroy(cr)
end
