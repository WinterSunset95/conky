function conky_draw_clock()
    if conky_window == nil then return end
	local cairo = require('cairo')
	if cairo == nil then return end

    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    cr = cairo_create(cs)

	-- First draw the circle
	local centerX, centerY = 250, 250;
	local radius = 200;
	local startAngle = 0;
	local endAngle = 2 * math.pi;

	cairo_arc(cr, centerX, centerY, radius, startAngle, endAngle)
	cairo_set_source_rgb(cr, 110, 110, 110)
	cairo_set_line_width(cr, 5)

	cairo_stroke(cr)
	-- End
	
	-- Draw the clock hands
	local hour = os.date("%I")
	local minute = os.date("%M")
	local second = os.date("%S")
	-- Hour hand
	local hourAngle = (hour * 30) + (minute * 0.5)
	cairo_save(cr)
	cairo_translate(cr, centerX, centerY)
	cairo_rotate(cr, math.rad(hourAngle))
	cairo_move_to(cr, 0, 0)
	cairo_line_to(cr, 0, -100)
	cairo_set_line_width(cr, 5)
	cairo_stroke(cr)
	cairo_restore(cr)
	-- Minute hand
	local minuteAngle = (minute * 6) + (second * 0.1)
	cairo_save(cr)
	cairo_translate(cr, centerX, centerY)
	cairo_rotate(cr, math.rad(minuteAngle))
	cairo_move_to(cr, 0, 0)
	cairo_line_to(cr, 0, -150)
	cairo_set_line_width(cr, 3)
	cairo_stroke(cr)
	cairo_restore(cr)
	-- Second hand
	local secondAngle = second * 6
	cairo_save(cr)
	cairo_translate(cr, centerX, centerY)
	cairo_rotate(cr, math.rad(secondAngle))
	cairo_move_to(cr, 0, 0)
	cairo_line_to(cr, 0, -150)
	cairo_set_line_width(cr, 1)
	cairo_stroke(cr)
	cairo_restore(cr)
	-- End

	cairo_surface_destroy(cs)
	cairo_destroy(cr)
end
