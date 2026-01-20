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

    -- 1. NAVIGARE RAPIDĂ (Tastele cele mai folosite)
    
    -- <leader> + SPATIU: Find Files (Smart)
    -- E cea mai ergonomică tastă. Înlocuiește Telescope Find Files.
    map("n", "<leader><space>", function() picker.files() end, { desc = "Find Files" })

    -- <leader> + g: Grep (Căutare text)
    -- Înlocuiește Telescope Live Grep.
    map("n", "<leader>g", function() picker.grep() end, { desc = "Grep Text" })

    -- <leader> + b: Buffers
    -- Switch rapid între fișiere deschise.
    map("n", "<leader>b", function() picker.buffers() end, { desc = "Switch Buffer" })


    -- 2. GRUPUL "SEARCH" (Tot ce ține de căutări secundare)
    
    -- <leader>sr: Recent Files
    -- Util când redeschizi proiectul.
    map("n", "<leader>sr", function() picker.recent() end, { desc = "Recent Files" })

    -- <leader>sd: Diagnostics (Înlocuitor Trouble)
    -- Arată toate erorile din proiect într-o listă.
    map("n", "<leader>sd", function() picker.diagnostics() end, { desc = "Diagnostics" })

    -- <leader>ss: Symbols
    -- Arată funcțiile/clasele din fișierul curent (Outline).
    map("n", "<leader>ss", function() picker.lsp_symbols() end, { desc = "LSP Symbols" })


    -- 3. LSP & CODING (Interacțiune cu codul)
    
    -- <leader>ca: Code Actions
    -- Meniul pentru fix-uri rapide (importuri, refactor).
    map({ "n", "v" }, "<leader>ca", function() picker.lsp_code_actions() end, { desc = "Code Action" })

    -- <leader>rn: Rename
    -- Folosește fereastra 'input' activată mai sus.
    map("n", "<leader>rn", function() snacks.rename.rename_file() end, { desc = "Rename File" })

    -- gd: Go to Definition
    -- Deschide definiția într-un picker (ca să nu pierzi locul unde erai).
    map("n", "gd", function() picker.lsp_definitions() end, { desc = "Goto Definition" })

    -- gr: Go to References
    -- Arată toate locurile unde e folosită funcția.
    map("n", "gr", function() picker.lsp_references() end, { desc = "References" })
    
    
    map("n", "<leader>gg", function() snacks.lazygit() end, { desc = "Lazygit" })
    
    map("n", "<C-/>", function() snacks.terminal() end, { desc = "Toggle Terminal" })
