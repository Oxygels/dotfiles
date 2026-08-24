return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            pyrefly = {
                -- Silence the notification when pyrefly exits
                on_exit = function() end,
            },
            ruff = {
                mason = false,
                enabled = false,
            },
        },
    },
}
