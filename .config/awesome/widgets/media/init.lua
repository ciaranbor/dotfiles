local beautiful = require("beautiful")
local wibox = require("wibox")
local spawn = require("awful.spawn")

local media = {}

local function parse_status(status)
    local status_icon = ""

    if (status:match("Playing")) then
        status_icon = "media_pause"
    elseif (status:match("Paused")) then
        status_icon = "media_play"
    end
    return status_icon 
end

local function update()
    spawn.easy_async('playerctl status', function(output)
        local status_icon = parse_status(output)
        media.image.image = media.path_to_icons .. status_icon .. ".svg"
    end)
    spawn.easy_async('playerctl metadata artist', function(metadata)
        media.text:set_markup(string.format("<span color=%q><b>%s</b></span>", beautiful.bg_normal, metadata))
    end)
end

local function exec_cmd_and_update(cmd)
    spawn.easy_async(cmd, function(output)
        update()
    end)
end

function media.toggle()
    exec_cmd_and_update('playerctl play-pause')
end

function media.stop()
    exec_cmd_and_update('playerctl stop')
end

function media.next()
    exec_cmd_and_update('playerctl next')
end

function media.previous()
    exec_cmd_and_update('playerctl previous')
end

function media.init(args)
    args = args or {}
    args.media_controller = args.media_controller or 'playerctl'
    media.path_to_icons = args.path_to_icons or beautiful.theme_path .. "/widgets/media/"

    media.text = wibox.widget.textbox()
    media.text:set_markup(string.format("<span color=%q><b>%s</b></span>", beautiful.bg_normal, ""))
    media.image = wibox.widget{
        image = media.path_to_icons .. "audio-volume-muted-symbolic.svg",
        widget = wibox.widget.imagebox,
    }

    update('playerctl status')
    media.image:connect_signal("button::press", function(_,_,_,button)
        if (button == 1)
            then media.toggle()
        end
    end)
end

return media
