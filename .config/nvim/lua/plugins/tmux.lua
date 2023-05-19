return {
    {
        "aserowy/tmux.nvim",
        config = function()
            return require("tmux").setup()
        end,
    },

    {
        "edkolev/tmuxline.vim",
        config = function()
            return require("tmux").setup()
        end,
    },
}
