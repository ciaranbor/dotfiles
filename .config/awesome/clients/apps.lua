local awful = require("awful")

local tags = awful.screen.focused().tags

apps = {}

apps.browser = function ()
    awful.spawn(browser)
end

apps.browser2 = function ()
    awful.spawn(browser2)
end

apps.steam = function ()
    awful.spawn("steam", { tag = tags[3] })
end

apps.social = function ()
    awful.spawn("signal-desktop", { tag = tags[5] })
    awful.spawn("element-desktop", { tag = tags[5] })
end

apps.local_video= function ()
    awful.spawn("vlc", { tag = tags[4] })
end

apps.online_video= function ()
    awful.spawn("freetube", { tag = tags[4] })
end

return apps
