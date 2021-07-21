---------------------------
-- Default awesome theme --
---------------------------

local awful = require("awful")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local gfs = require("gears.filesystem")

local themes_path = gfs.get_themes_dir()
local theme_path = "/home/ciaran/.config/awesome/themes/gruvbox/"

local xrdb = xresources.get_current_theme()
local dpi = xresources.apply_dpi

local theme = {}

theme.wallpaper     = theme_path .. "wallpaper3.jpg"

theme.font          = "DejaVu Sans 8"
theme.icon_theme    = "Papirus-Dark"

-- Dark Gruvbox Colors
theme.lightred      = xrdb.color9 
theme.red           = xrdb.color1
theme.lightorange   = "#fe8019"
theme.orange        = "#d65d0e"
theme.lightyellow   = xrdb.color11 
theme.yellow        = xrdb.color3 
theme.lightgreen    = xrdb.color10 
theme.green         = xrdb.color2 
theme.lightaqua     = xrdb.color14 
theme.aqua          = xrdb.color6 
theme.lightblue     = xrdb.color12 
theme.blue          = xrdb.color4 
theme.lightpurple   = xrdb.color13 
theme.purple        = xrdb.color5 
theme.fg0           = "#fbf1c7"
theme.fg1           = xrdb.foreground
theme.fg2           = "#d5c4a1"
theme.fg3           = "#bdae93"
theme.fg4           = xrdb.color7 
theme.gray          = xrdb.color8 
theme.bg4           = "#7c6f64"
theme.bg3           = "#665c54"
theme.bg2           = "#504945"
theme.bg1           = "#3c3836"
theme.bg0_s         = "#32302f"
theme.bg0           = xrdb.background
theme.bg0_h         = "#1d2021"

theme.bg_normal     = theme.bg0_h
theme.bg_focus      = theme.bg1 
theme.bg_urgent     = theme.bg0_h 
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = theme.fg4
theme.fg_focus      = theme.fg1
theme.fg_urgent     = theme.lightorange

theme.useless_gap   = dpi(4)
theme.border_width  = dpi(0)
theme.border_normal = theme.bg0_h
theme.border_focus  = theme.bg4
theme.border_marked = theme.lightpurple

-- Titlebars
theme.titlebar_bg_focus  = theme.bg0_s
theme.titlebar_fg_focus  = theme.bg0_s
theme.titlebar_fg_normal = theme.bg0_s
theme.titlebar_bg_normal = theme.bg0_s

-- Taglist
theme.taglist_fg_empty    = theme.bg3
theme.taglist_fg_occupied = theme.fg4
theme.taglist_fg_focus    = theme.bg0
theme.taglist_fg_urgent   = theme.bg0
theme.taglist_fg_volatile = theme.bg0
theme.taglist_bg_focus    = theme.lightaqua
theme.taglist_bg_urgent   = theme.lightorange
theme.taglist_bg_occupied = theme.bg1
theme.taglist_bg_volatile = theme.lightpurple
theme.taglist_bg_empty    = theme.bg1
theme.taglist_bg_hover    = theme.bg2
theme.taglist_font        = "DejaVu Sans Bold 10"

-- Menu
theme.menu_height       = dpi(16)
theme.menu_width        = dpi(140)
theme.menu_border_width = dpi(10)
theme.menu_fg_normal    = theme.fg1
theme.menu_bg_focus     = theme.bg2
theme.menu_border_color = theme.bg0_h

-- Menubar
theme.menubar_border_width = theme.border_width

-- Notifications
theme.notification_opacity = 0.75

-- Calendar
theme.calendar_year_fg_color        = theme.fg1
theme.calendar_month_fg_color       = theme.fg1
theme.calendar_year_header_fg_color = theme.fg1
theme.calendar_header_fg_color      = theme.fg1
theme.calendar_weekday_fg_color     = theme.fg1
theme.calendar_weeknumber_fg_color  = theme.fg1
theme.calendar_normal_fg_color      = theme.fg1
theme.calendar_focus_fg_color       = theme.fg1

-- Custom sizes
theme.small_gap        = dpi(2)
theme.gap              = dpi(4)
theme.big_gap          = dpi(14)
theme.negative_gap     = dpi(-6)
theme.big_negative_gap = dpi(-10)
theme.wibar_height     = dpi(21)
theme.titlebar_height  = dpi(20)

-- Systray
theme.systray_icon_spacing = theme.gap

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png"

-- You can use your own layout icons like this:
theme.layout_floating  = theme_path.."layouts/floating.svg"
theme.layout_tile = theme_path.."layouts/tile.svg"
theme.layout_dwindle = theme_path.."layouts/spiral.svg"

-- Icons
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)
theme.archlinux_icon  = theme_path .. "bar/archlinux.svg"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
