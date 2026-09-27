--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({match = {class = "steam"}, workspace = "3 silent"})
hl.window_rule({match = {class = "steam_app"}, workspace = "3 silent"})
hl.window_rule({match = {class = "gamescope"}, workspace = "3 silent"})

hl.window_rule({match = {class = "FreeTube"}, workspace = "4 silent"})
hl.window_rule({match = {class = "vlc"}, workspace = "4 silent"})

hl.window_rule({match = {class = "Signal"}, workspace = "5 silent"})
hl.window_rule({match = {class = "Element"}, workspace = "5 silent"})
hl.window_rule({match = {class = "Jitsi Meet"}, workspace = "5 silent"})

hl.window_rule({match = {class = "proton.vpn.app.gtk"}, workspace = "special:scratchpad silent"})

hl.window_rule({match = {class = "com.stremio.stremio"}, idle_inhibit = "fullscreen"})
hl.window_rule({match = {class = "vlc"}, idle_inhibit = "fullscreen"})
