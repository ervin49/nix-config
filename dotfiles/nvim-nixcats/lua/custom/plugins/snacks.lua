    require("snacks").setup({
        -- 1. INPUT: Asta face ca 'Rename' să apară frumos în mijloc
        input = { 
            enabled = true 
        },

        -- 2. PICKER: Asta e interfața pentru Code Actions
        picker = { 
            enabled = true,
            -- Opțional: Poți configura sursele aici, dar default e ok
        },

        -- 3. Restul modulelor pe FALSE (Minimalism total)
        bigfile = { enabled = false },
        dashboard = { enabled = false },
        explorer = { enabled = false },
        indent = { enabled = false },
        notifier = { enabled = false }, -- Dacă nu vrei notificări (noice style)
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
        styles = {},
    })

    -- 4. Keybind-uri (Foarte Important)
    -- Chiar dacă ai picker-ul activat, trebuie să mapăm tasta pentru Code Action
    -- să folosească Snacks în loc de meniul default.
    
    local map = vim.keymap.set
    
    -- Code Action
    map({ "n", "v" }, "<leader>ca", function()
        require("snacks").picker.lsp_code_actions()
    end, { desc = "Code Action (Snacks)" })

    -- Rename (folosește input-ul definit mai sus)
    map("n", "<leader>rn", function() 
        require("snacks").rename.rename_file() 
    end, { desc = "Rename File" })
