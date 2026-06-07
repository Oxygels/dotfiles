-- When chromium unsets full screen, it sends two events:
-- [2026-06-02 20:16:26] Fullscreen event for window 0x55876008bb90 current fullscreen state: 0 previous fullscreen state: 2
-- [2026-06-02 20:16:26] Fullscreen event for window 0x55876008bb90 current
--
-- ref https://github.com/hyprwm/Hyprland/discussions/13322

local fs_prev = nil

hl.on("window.fullscreen", function(w)
    local cur = w.fullscreen
    local prev = fs_prev
    fs_prev = cur

    if prev == 2 and cur == 0 then
        -- left real fullscreen; the bogus maximize lands within a ms.
        hl.timer(function()
            fs_prev = nil
        end, { timeout = 1, type = "oneshot" })
    elseif cur == 1 and fs_prev then
        -- Bogus maximize; unset fullscreen
        fs_prev = nil
        hl.dispatch(hl.dsp.window.fullscreen_state({
            internal = 0,
            client = 0,
            action = "set",
            window = w,
        }))
    end
end)
