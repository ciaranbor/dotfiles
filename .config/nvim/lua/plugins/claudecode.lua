return {
    "coder/claudecode.nvim",
    keys = {
        { "<leader>a", nil, desc = "AI/Claude Code" },
        { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
        { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
        {
            "<leader>ar",
            "<cmd>ClaudeCode --resume<cr>",
            desc = "Resume Claude",
        },
        {
            "<leader>aC",
            "<cmd>ClaudeCode --continue<cr>",
            desc = "Continue Claude",
        },
        {
            "<leader>as",
            "<cmd>ClaudeCodeSend<cr>",
            mode = "v",
            desc = "Send to Claude",
        },
        {
            "<leader>as",
            "<cmd>ClaudeCodeTreeAdd<cr>",
            desc = "Add file",
            ft = { "NvimTree", "neo-tree", "oil" },
        },
        -- Diff management
        { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
        { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
    opts = {
        log_level = "debug",
        visual_demotion_delay_ms = 100, -- Slower selection demotion
        connection_wait_delay = 500, -- Longer delay for @ mention batching
        terminal = {
            split_side = "right",
            split_width_percentage = 0.4, -- Wider terminal
            provider = "snacks",
            auto_close = false, -- Keep terminal open to review output
        },
    },
}
