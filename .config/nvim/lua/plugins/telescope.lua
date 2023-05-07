return {
    {
        "telescope.nvim",
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = function(...)
                            return require("telescope.actions").cycle_history_next(...)
                        end,
                        ["<C-k>"] = function(...)
                            return require("telescope.actions").cycle_history_prev(...)
                        end,
                    },
                },
            },
        },
    },
}
