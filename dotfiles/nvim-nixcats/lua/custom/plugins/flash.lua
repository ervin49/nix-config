return {
    {
        "folke/flash.nvim",
        event = "VeryLazy", -- sau "VimEnter" dacă vrei să fie instant
        opts = {
            modes = {
                search = {
                    enabled = true,   -- folosește flash pentru / și ? 
                    highlight = { backdrop = false },
                },
                char = {
                    enabled = true,   -- înlocuiește f, t, s
                },
                treesitter = true,   -- highlight pentru motions cu TS
                remote = true,       -- permite jump și în alte buffers
            },
            jump = {
                autojump = true,      -- sari direct dacă e singura potrivire
            },
            highlight = {
                groups = {
                    match = "FlashMatch",
                    current = "FlashCurrent",
                    backdrop = "FlashBackdrop",
                },
            },
        },
        -- keymaps rapide
        keys = {
            -- character motions (f/t)
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
            -- tree-sitter / search motions
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter Jump" },
            -- search highlighting / smart jump
            { "r", mode = "o", function() require("flash").remote() end, desc = "Flash Remote Jump" },
        },
    }
}

