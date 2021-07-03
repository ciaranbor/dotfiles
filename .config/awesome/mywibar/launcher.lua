local awful = require("awful")
local wibox =  require("wibox")
local beautiful =  require("beautiful")
local utils = require("utils")
local mymainmenu = require("widgets.menu")

local mylauncher = wibox.widget(utils.widget.compose{{
  {
    awful.widget.launcher {
      image = beautiful.archlinux_icon,
      menu  = { toggle = function()
          mymainmenu:toggle {
            coords = {
              x = beautiful.gap,
              y = beautiful.wibar_height + beautiful.gap
            }
          }
        end
      }
    },
    status_box,
    spacing = beautiful.gap,
    layout  = wibox.layout.fixed.horizontal,
  },
  shape = utils.shape.rightangled.left,
  color = beautiful.lightaqua,
  margin = beautiful.small_gap
}})

return mylauncher
