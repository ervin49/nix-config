require("snacks").setup({
    -- 1. INPUT: Activăm pentru rename frumos
    input = { enabled = true },

    -- 2. PICKER: Activăm pentru căutări și meniuri
    picker = { enabled = true },

    -- 3. Dezactivăm tot restul (Minimalist)
    bigfile = { enabled = false },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = false },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    styles = {},
})

-- 4. Keybind-uri Noi (Fără <leader>f)
local map = vim.keymap.set
local picker = require("snacks").picker

-- === ACȚIUNI RAPIDE (Taste "Prime") ===

-- <leader> + SPATIU: Găsește fișiere (cel mai rapid mod, ca Ctrl+P in VSCode)
map("n", "<leader><space>", function() picker.files() end, { desc = "Find Files (Smart)" })

-- <leader> + /: Caută text în tot proiectul (Live Grep)
map("n", "<leader>/", function() picker.grep() end, { desc = "Grep Text" })

-- <leader> + ,: Listă Buffere deschise (pentru switch rapid)
map("n", "<leader>,", function() picker.buffers() end, { desc = "Switch Buffer" })


-- === GRUPUL "SEARCH" (<leader>s...) ===

-- <leader>sr -> Search Recent (Fișiere recente)
map("n", "<leader>sr", function() picker.recent() end, { desc = "Recent Files" })

-- <leader>sd -> Search Diagnostics (Erori în proiect)
map("n", "<leader>sd", function() picker.diagnostics() end, { desc = "Diagnostics" })

-- <leader>ss -> Search Symbols (Funcții/Clase în fișierul curent)
map("n", "<leader>ss", function() picker.lsp_symbols() end, { desc = "LSP Symbols" })


-- === CODING (LSP) ===

-- <leader>ca -> Code Action (Meniul frumos)
map({ "n", "v" }, "<leader>ca", function() picker.lsp_code_actions() end, { desc = "Code Action" })

-- <leader>rn -> Rename (Input frumos)
map("n", "<leader>rn", function() require("snacks").rename.rename_file() end, { desc = "Rename File" })

-- <leader>gd -> Go to Definition (în fereastră picker, ca să nu pierzi contextul)
map("n", "gd", function() picker.lsp_definitions() end, { desc = "Goto Definition" })

-- <leader>gr -> Go to References (unde e folosita funcția)
map("n", "gr", function() picker.lsp_references() end, { desc = "References" })
