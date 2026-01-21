return {
    -- 1. Transparent.nvim
    {
        "xiyaowong/transparent.nvim",
        enabled = true,
        lazy = false, 
        priority = 1000,
        config = function()
            require("transparent").setup({
                extra_groups = {
                    "NormalFloat", -- ferestre plutitoare
                    "NvimTreeNormal", -- file explorer
                },
            })
            require('transparent').clear_prefix('BufferLine')
        end
    },

    -- 2. Which-Key
    {
        "folke/which-key.nvim",
        enabled = true,
        event = "VeryLazy", 
        config = true,      
    },

    -- 3. Highlighted Yank
    {
        "machakann/vim-highlightedyank",
        enabled = true,
        -- Notă: Asigură-te că ai 'pkgs.vimPlugins.vim-highlightedyank' în flake.nix!
    },

    -- 4. Plenary (Librărie)
    {
        "nvim-lua/plenary.nvim",
        enabled = true,
        lazy = true, 
    },

    -- 5. Tmux Navigator (Configurat super bine pentru lazy loading)
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
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },

    -- 6. Comment.nvim (Înlocuitorul modern pentru vim-commentary)
    {
        "numToStr/Comment.nvim",
        enabled = true,
        -- Îl încărcăm imediat sau pe event-ul "VeryLazy" ca să meargă tastele
        event = "VeryLazy", 
        -- Această linie face automat require("Comment").setup({})
        opts = {}, 
    },
}
