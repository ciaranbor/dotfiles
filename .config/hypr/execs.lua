-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--

local home = os.getenv("HOME")
local wallpaper_path = home .. "/Pictures/wallpapers/gruvbox"

-- Pick a random wallpaper (the Lua equivalent of
-- `$wallpaper = $(find $wallpaper_path -type f | shuf -n 1)`)
local function random_wallpaper()
  local pipe = io.popen("find '" .. wallpaper_path .. "' -type f | shuf -n 1")
  if not pipe then return nil end
  local path = pipe:read("*l")
  pipe:close()
  return path
end

hl.on("hyprland.start", function()
  local wallpaper = random_wallpaper()
  if wallpaper then
    hl.exec_cmd("swaybg -i '" .. wallpaper .. "' -m fill")
  end

  hl.exec_cmd("waybar")

  hl.exec_cmd("nm-applet --indicator")
  hl.exec_cmd("blueman-applet")

  hl.exec_cmd("/usr/lib/pam_kwallet_init")
  hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")

  hl.exec_cmd("protonvpn-app")

  hl.exec_cmd("dunst")

  hl.exec_cmd("hypridle")
  hl.exec_cmd("hyprsunset")

  hl.exec_cmd("systemctl --user start wluma")
end)
