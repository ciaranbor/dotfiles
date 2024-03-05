local leet_arg = "leetcode.nvim"

return {
    {
        "kawre/leetcode.nvim",
        lazy = leet_arg ~= vim.fn.argv()[1],
        build = ":TSUpdate html",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- required by telescope
            "MunifTanjim/nui.nvim",

            -- optional
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            -- configuration goes here
        },
        keys = {
            { "<leader>pm", "<cmd>LcMenu<cr>", desc = "Open Leetcode menu" },
            { "<leader>pl", "<cmd>LcList<cr>", desc = "Open Leetcode problem list" },
            { "<leader>pc", "<cmd>LcConsole<cr>", desc = "Open Leetcode console" },
            { "<leader>pr", "<cmd>LcRun<cr>", desc = "Run Leetcode solution" },
            { "<leader>ps", "<cmd>LcSubmit<cr>", desc = "Submit Leetcode solution" },
        },
    },
}
