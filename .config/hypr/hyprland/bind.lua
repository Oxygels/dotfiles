local program = require("hyprland.program")

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local uwsm_prefix = "uwsm app -- "

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

-- If not using uwsm (not recommended)
-- hl.bind(
--     mainMod .. " + M",
--     hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
-- )

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(uwsm_prefix .. "hyprshutdown"))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(uwsm_prefix .. program.terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(uwsm_prefix .. program.file))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(uwsm_prefix .. program.menu))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.window.close())
hl.bind(mainMod .. " + K", hl.dsp.window.kill())

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(uwsm_prefix .. "hyprlock"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(uwsm_prefix .. "pavucontrol"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(uwsm_prefix .. "blueman-manager"))

hl.bind("ALT" .. " + twosuperior", hl.dsp.exec_cmd(".local/bin/switch_keyboard_xwayland"))
hl.bind(
    mainMod .. " + V",
    hl.dsp.exec_cmd(
        "cliphist list | wofi --dmenu --pre-display-cmd"
            .. "echo '%s' | cut -f 2 | cut -c -45"
            .. "| cliphist decode | wl-copy"
    )
)

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
hl.bind(mainMod .. " + ampersand", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + eacute", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + quotedbl", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + apostrophe", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + parenleft", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + minus", hl.dsp.focus({ workspace = 6 }))

hl.bind("Print", hl.dsp.exec_cmd("hyprshot -d --freeze --clipboard-only -m region"))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + SHIFT + " .. "ampersand", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + " .. "eacute", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + " .. "quotedbl", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + " .. "apostrophe", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + " .. "parenleft", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + " .. "minus", hl.dsp.window.move({ workspace = 6 }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
