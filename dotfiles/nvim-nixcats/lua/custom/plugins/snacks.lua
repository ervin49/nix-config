    local snacks = require("snacks")

    snacks.setup({
        -- === UI ESSENTIALS (Înlocuitor Noice) ===
        input = { enabled = true },    -- Înlocuiește fereastra de Rename din Noice
        notifier = { enabled = true }, -- Înlocuiește notificările din Noice (dacă pui false, apar jos ca text simplu)
        
        -- === SEARCH ENGINE (Înlocuitor Telescope / Trouble) ===
        picker = { enabled = true },

        -- === PERFORMANCE (Invizibile, dar critice) ===
        bigfile = { enabled = true },   -- Previne blocarea la fișiere mari (LSP off automat)
        quickfile = { enabled = true }, -- Îmbunătățește viteza de start la deschiderea unui fișier

        -- === MINIMALISM (Restul dezactivate) ===
        dashboard = { enabled = false },
        explorer = { enabled = false }, -- Folosești Oil sau altceva
        indent = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
        styles = {},
    })

    -- === KEYBINDS ===
    local map = vim.keymap.set
    local picker = snacks.picker

    map("n", "<leader><leader>", function() picker.files() end, { desc = "Find Files" })
    map("n", "<leader>g", function() picker.grep() end, { desc = "Grep Text" })
    map("n", "<leader>b", function() picker.buffers() end, { desc = "Switch Buffer" })
    map("n", "<leader>sr", function() picker.recent() end, { desc = "Recent Files" })

    -- <leader>sd: Diagnostics (Înlocuitor Trouble)
    -- Arată toate erorile din proiect într-o listă.
    map("n", "<leader>d", function() picker.diagnostics() end, { desc = "Diagnostics" })
    map({ "n", "v" }, "<leader>ca", function() picker.lsp_code_actions() end, { desc = "Code Action" })
    map("n", "<leader>rn", function() snacks.rename.rename_file() end, { desc = "Rename File" })
    map("n", "gd", function() picker.lsp_definitions() end, { desc = "Goto Definition" })
    map("n", "gr", function() picker.lsp_references() end, { desc = "References" })
    
    map("n", "<C-/>", function() snacks.terminal() end, { desc = "Toggle Terminal" })
