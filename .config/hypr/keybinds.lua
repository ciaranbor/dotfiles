---------------------
---- KEYBINDINGS ----
---------------------

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

local mainMod = "ALT" -- Sets "ALT" key as main modifier
local altMod = "SUPER" -- Sets "Windows" key as alt modifier

-- Programs

local terminal = "ghostty"
local fileManager = "dolphin"
local browser = "firefox"
local privateBrowser = "firefox --privateWindow"
local menu = "wofi --show drun"

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(privateBrowser))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("vlc"))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("freetube"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("stremio"))
hl.bind(mainMod .. " + s", hl.dsp.exec_cmd("signal-desktop"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("jitsi-meet-desktop"))


hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle"}))

-- hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + Space", hl.dsp.window.float({ action = "toggle" }))
-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with mainMod + vim keys
hl.bind(mainMod .. " + h",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j",  hl.dsp.focus({ direction = "down" }))

-- Swap windows
hl.bind(mainMod .. " + SHIFT + h",  hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + k",    hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + j",  hl.dsp.window.swap({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Move focussed workspace to output
hl.bind(mainMod .. " + CONTROL + h", hl.dsp.workspace.move({ monitor = "left" }))
hl.bind(mainMod .. " + CONTROL + h", hl.dsp.focus({ monitor = "left" }))
hl.bind(mainMod .. " + CONTROL + l", hl.dsp.workspace.move({ monitor = "right" }))
hl.bind(mainMod .. " + CONTROL + l", hl.dsp.focus({ monitor = "right" }))

-- special workspace (scratchpad)
hl.bind(mainMod .. " + Tab",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + Minus", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

local volumeNotification = "~/.config/dunst/notify audio"
local brightnessNotification = "~/.config/dunst/notify brightness"
local brightnessUp = "~/./config/brightness up"
local brightnessDown = "~/./config/brightness down"

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(volumeNotification), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(volumeNotification), { locked = true, repeating = true })
hl.bind("CONTROL + XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"), { locked = true, repeating = true })
hl.bind("CONTROL + XF86AudioRaiseVolume", hl.dsp.exec_cmd(volumeNotification), { locked = true, repeating = true })
hl.bind("CONTROL + XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),      { locked = true, repeating = true })
hl.bind("CONTROL + XF86AudioLowerVolume", hl.dsp.exec_cmd(volumeNotification), { locked = true, repeating = true })

-- For small keyboard without volume keys
hl.bind(mainMod .. " + Up", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind(mainMod .. " + Up", hl.dsp.exec_cmd(volumeNotification), { locked = true, repeating = true })
hl.bind(mainMod .. " + Down", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind(mainMod .. " + Down", hl.dsp.exec_cmd(volumeNotification), { locked = true, repeating = true })
hl.bind(mainMod .. " + CONTROL + Up", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"), { locked = true, repeating = true })
hl.bind(mainMod .. " + CONTROL + Up", hl.dsp.exec_cmd(volumeNotification), { locked = true, repeating = true })
hl.bind(mainMod .. " + CONTROL + Down", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),      { locked = true, repeating = true })
hl.bind(mainMod .. " + CONTROL + Down", hl.dsp.exec_cmd(volumeNotification), { locked = true, repeating = true })

hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(volumeNotification),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })


hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd(brightnessUp),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd(brightnessNotification),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd(brightnessDown),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd(brightnessNotification),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Capture --
-- Screenshot the focused monitor
hl.bind("Print", function()
  local mon = hl.get_active_monitor()
  if mon then
    hl.dispatch(hl.dsp.exec_cmd("grim -o '" .. mon.name .. "'"))
  end
end, { locked = true })

-- Screenshot a selected region
hl.bind("CONTROL + Print", hl.dsp.exec_cmd([[grim -g "$(slurp)"]]), { locked = true })

-- Record the focused monitor
hl.bind(altMod .. " + SUPER + Print", function()
  local mon = hl.get_active_monitor()
  if mon then
    hl.dispatch(hl.dsp.exec_cmd(
      [[cd ~/Videos && wf-recorder -a -o ']] .. mon.name ..
      [[' -f recording_$(date +"%Y-%m-%d_%H:%M:%S").mp4]]))
  end
end)

-- Record a selected region
hl.bind(altMod .. " + SUPER + CONTROL + Print", hl.dsp.exec_cmd(
  [[cd ~/Videos && wf-recorder -a -g "$(slurp)" -f recording_$(date +"%Y-%m-%d_%H:%M:%S").mp4]]))

-- hl.bind(altMod .. " + SUPER + CONTROL + s", hl.dsp.exec_cmd("wf-recorder --muxer=v4l2 --codec=rawvideo --file=/dev/video0 -x yuv420p"))

hl.bind(altMod .. " + SUPER + SHIFT + BackSpace", hl.dsp.exec_cmd("killall -s SIGINT wf-recorder"))
