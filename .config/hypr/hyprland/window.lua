hl.window_rule({
    name = "rhytia",
    match = { class = "Rhytia" },
    content = "game",

    no_blur = true,
    no_anim = true,
    no_dim = true,
    opaque = true,
    immediate = true,
})

hl.window_rule({
    name = "steam",
    match = { class = "steam" },
    content = "game",

    workspace = "4",

    no_blur = true,
    no_anim = true,
    no_dim = true,
    opaque = true,
    immediate = true,
})

hl.window_rule({
    name = "steam-games",
    match = { initial_class = "steam_app_.*" },

    content = "game",
    workspace = "1",

    no_blur = true,
    no_anim = true,
    no_dim = true,
    opaque = true,
    immediate = true,
})

hl.window_rule({
    name = "osu",
    match = { class = "osu!" },
    content = "game",
    workspace = "1",

    no_blur = true,
    no_anim = true,
    no_dim = true,
    opaque = true,
    immediate = true,
})

hl.window_rule({
    name = "discord",
    match = { class = "discord" },
    workspace = "2",
})
