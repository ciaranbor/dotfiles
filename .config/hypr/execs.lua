-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--

hl.on("hyprland.start", function()
  hl.exec_cmd("hyprpaper")

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
