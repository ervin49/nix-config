return {
    {
        "folke/snacks.nvim",
        priority = 1000, -- Se încarcă primul pentru că gestionează UI-ul și Dashboard-ul
        lazy = false,    -- Nu vrem lazy loading la dashboard

        -- 1. Verificare NixCats
        enabled = true,

        ---@type snacks.Config
        opts = {
            -- === Module Activate ===
            bigfile = { enabled = true },      -- Optimizează deschiderea fișierelor mari
            dashboard = { enabled = false },    -- Ecran de pornire frumos
            indent = { enabled = true },       -- Linii de indentare (înlocuiește indent-blankline)
            input = { enabled = true },        -- UI mai bun pentru input/rename
            notifier = { enabled = false },     -- Notificări (înlocuiește nvim-notify)
            quickfile = { enabled = true },    -- Încarcă rapid fișierele
            scroll = { enabled = true },       -- Scroll fin (smooth scrolling)
            statuscolumn = { enabled = true }, -- Coloana din stânga (git signs, line numbers)
            words = { enabled = true },        -- Highlight la cuvinte similare sub cursor

            -- === PICKER (Înlocuitorul Telescope) ===
            picker = {
                enabled = true,
                sources = {
                    explorer = {
                        -- Configurare pentru file explorer-ul intern (dacă vrei să înlocuiești Oil pe viitor)
                        replace_netrw = false, -- Îl lăsăm pe Oil să fie șef momentan
                    }
                }
            },
        },

        -- === Scurtături (Keymaps) ===
        keys = {
            -- :: Căutare Fișiere (Picker)
            { "<leader><leader>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
            { "<leader>g", function() Snacks.picker.grep() end, desc = "Grep (Căutare text)" },
            { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },

            -- :: Buffere
            { "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffers" },


            -- :: Terminal
            { "<leader>t",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
            init = function()
                vim.api.nvim_create_user_command("Snacks", function(opts)
                    Snacks.picker(opts.args)
                end, { nargs = "?" })
            end,
        }
    }
}
