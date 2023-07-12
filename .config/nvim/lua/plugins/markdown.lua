return {
    -- add gruvbox
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        lazy = true,
        keys = {
            { "<leader>cp", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview" },
        },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
}
