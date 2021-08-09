-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local awful = require("awful")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init("~/.config/awesome/themes/gruvbox/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "kitty -1"
browser = "qutebrowser" or "firefox"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

-- }}}

-- {{{ Features

-- Widgets
local volume     = require("widgets.volume")
local media     = require("widgets.media")
local net_widget = require("widgets.net")
local mymainmenu = require("widgets.menu")

volume.init()
media.init()
net_widget.init()
mymainmenu.init()

-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fall back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

local desktop = require("desktop")
desktop.init()

local tags = { "Master", "Browse", "Gaming", "Media", "Social", "Work", 7, 8, 9 }
local mywibar = require("mywibar")
mywibar.init(tags)

local clients = require("clients")
clients.init()

awful.spawn.with_shell("~/.config/awesome/autorun.sh")
