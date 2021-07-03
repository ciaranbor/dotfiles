local awful = require("awful")
local menubar = require("menubar")

local myawesomemenu = {
   { "Restart", awesome.restart },
   { "Quit", function() awesome.quit() end },
}

local mymainmenu = awful.menu({ items = { { "Awesome", myawesomemenu },
                                    { "Open terminal", terminal },
                                    { "Lock", function() awesome.spawn("physlock -s") end },
                                    { "Reboot", function() awesome.spawn("systemctl reboot") end },
                                    { "Shutdown", function() awesome.spawn("systemctl poweroff") end }
                                  } })

function mymainmenu.init(args)
    args = args or {}

    menubar.utils.terminal = terminal
end

return mymainmenu
