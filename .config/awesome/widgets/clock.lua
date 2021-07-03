local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

-- Create a textclock widget and attach a calendar to it
local mytextclock = wibox.widget.textclock(
string.format("<span color=%q><b>%%H:%%M</b></span>", beautiful.bg_normal), 60)
local month_calendar = awful.widget.calendar_popup.month {
        long_weekdays = true,
        margin = beautiful.gap
    }

mytextclock:connect_signal("mouse::enter", function()
    month_calendar:call_calendar(0, "tr", awful.screen.focused())
    month_calendar.visible = true
end)
mytextclock:connect_signal("mouse::leave", function()
    month_calendar.visible = false
end)
mytextclock:buttons(gears.table.join(
    awful.button({ }, 1, function() month_calendar:call_calendar(-1) end),
    awful.button({ }, 3, function() month_calendar:call_calendar( 1) end)
))

return mytextclock
