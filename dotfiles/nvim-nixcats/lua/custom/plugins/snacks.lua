return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        enabled = true,

        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            quickfile = { enabled = true },
            input = { enabled = true },

            dashboard = { enabled = false },
            indent = { enabled = false },
            notifier = { enabled = false },
            scroll = { enabled = false },
            statuscolumn = { enabled = false },
            words = { enabled = false },

            picker = {
                enabled = true,
                sources = {
                    explorer = { replace_netrw = false },
                },
            },
        },

        keys = {
            { "<leader><leader>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
            { "<leader>g", function() Snacks.picker.grep() end, desc = "Grep (Căutare text)" },
            { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
            { "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffers" },
            { "<leader>d", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
            { "<leader>D", function() Snacks.picker.diagnostics({ scope = "workspace" }) end, desc = "Workspace Diagnostics" },

            -- Terminal toggle și funcționează și în terminal mode
            { "<leader>t", function()
                vim.keymap.set({"n","t"}, "<leader>t", function()
                    Snacks.terminal.toggle()
                end, { desc = "Toggle Terminal" })
            end, desc = "Toggle Terminal" },
        },

        init = function()
            vim.api.nvim_create_user_command("Snacks", function(opts)
                Snacks.picker(opts.args)
            end, { nargs = "?" })
        end,
    }
}
