return {
    {
        "esensar/nvim-dev-container",
        lazy = true,
        dependencies = "nvim-treesitter/nvim-treesitter",
        keys = {
            {
                "<leader>ccs",
                "<cmd>DevcontainerStart<cr>",
                desc = "Start dev container",
            },
            {
                "<leader>cca",
                "<cmd>DevcontainerAttach<cr>",
                desc = "Attach dev container",
            },
            {
                "<leader>ccr",
                "<cmd>DevcontainerExec<cr>",
                desc = "Execute in dev container",
            },
            {
                "<leader>ccc",
                "<cmd>DevcontainerStop<cr>",
                desc = "Stop dev container",
            },
            {
                "<leader>ccp",
                "<cmd>DevcontainerStopAll<cr>",
                desc = "Stop all dev containers",
            },
            {
                "<leader>ccl",
                "<cmd>DevcontainerLog<cr>",
                desc = "Dev container logs",
            },
            {
                "<leader>cce",
                "<cmd>DevcontainerEditNearestConfig<cr>",
                desc = "Edit dev container config",
            },
        },
        config = function()
            require("devcontainer").setup({
                autocommands = {
                    init = false,
                    clean = true,
                    update = true,
                },
                attach_mounts = {
                    always = true,
                    neovim_config = {
                        -- enables mounting local config to /root/.config/nvim in container
                        enabled = true,
                        -- makes mount readonly in container
                        options = { "readonly" },
                    },
                    neovim_data = {
                        -- enables mounting local data to /root/.local/share/nvim in container
                        enabled = true,
                        -- no options by default
                        options = {},
                    },
                    -- Only useful if using neovim 0.8.0+
                    neovim_state = {
                        -- enables mounting local state to /root/.local/state/nvim in container
                        enabled = true,
                        -- no options by default
                        options = {},
                    },
                },
                always_mount = {
                    "type=bind,source=/home/ciaran/.zshrc,target=/root/.zshrc",
                    "type=bind,source=/home/ciaran/.oh-my-zsh,target=/root/.oh-my-zsh",
                    "type=bind,source=/home/ciaran/.tmux.conf,target=/root/.tmux.conf",
                    "type=bind,source=/home/ciaran/.tmux,target=/root/.tmux",
                    "type=bind,source=/home/ciaran/.p10k.zsh,target=/root/.p10k.zsh",
                    "type=bind,source=/home/ciaran/scripts,target=/root/scripts",
                },
            })
        end,
    },
}
