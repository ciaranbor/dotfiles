return {
    {
        "folke/snacks.nvim",
        keys = {
            {
                "<leader>gr",
                function()
                    Snacks.terminal({ "lazygit", "--git-dir=" .. os.getenv("HOME") .. "/.dotfiles", "--work-tree=" .. os.getenv("HOME") }, { cwd = os.getenv("HOME"), esc_esc = false, ctrl_hjkl = false })
                end,
                desc = "Lazygit (dotfiles)",
            },
        },
        opts = {
            image = { enabled = true },
        },
    },
}
