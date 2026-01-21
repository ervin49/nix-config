return {
    -- Transparent background
    {
        "xiyaowong/transparent.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("transparent").setup({
                extra_groups = {
                    "NormalFloat",
                    "NvimTreeNormal",
                },
            })
            require("transparent").clear_prefix("BufferLine")
        end,
    },

    -- Which-Key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = true,
    },

    -- Highlight yank
    {
        "machakann/vim-highlightedyank",
        event = "VeryLazy",
    },

    -- Plenary (dependency)
    { "nvim-lua/plenary.nvim" },

    -- Tmux navigator
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<C-h>", "<cmd>TmuxNavigateLeft<cr>" },
            { "<C-j>", "<cmd>TmuxNavigateDown<cr>" },
            { "<C-k>", "<cmd>TmuxNavigateUp<cr>" },
            { "<C-l>", "<cmd>TmuxNavigateRight<cr>" },
            { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
        },
    },

    -- Comment.nvim
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- Disable search highlight after move
    {
        "romainl/vim-cool",
        event = "VeryLazy",
    },
}
