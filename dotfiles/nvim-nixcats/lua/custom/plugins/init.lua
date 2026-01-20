-- 1. PLUGIN-URI INSTANT (Eager)
-- Acestea rămân aici pentru că sunt esențiale la prima secundă sau sunt foarte rapide.
require("custom.plugins.oil")
require("custom.plugins.snacks")
require("custom.plugins.transparent")

-- 2. PLUGIN-URI LAZY (LZE)
-- Am comasat totul într-un singur apel lze.load pentru eficiență.
require('lze').load({
    -- Plugin-uri cu triggere automate (Evenimente)
    { import = "custom.plugins.lsp", event = "BufReadPost" }, 
    { import = "custom.plugins.diagnostics", event = "LspAttach" }, 
    { import = "custom.plugins.blink", event = "InsertEnter" }, -- Blink e rapid, dar îl putem amâna până scrii
    { import = "custom.plugins.autopairs", event = "InsertEnter" }, 
    { import = "custom.plugins.lualine", event = "DeferredUIEnter" },

    -- Plugin-uri bazate pe comenzi sau taste (User Actions)
    { import = "custom.plugins.themery", cmd = { "Themery" } },
    { import = "custom.plugins.harpoon", keys = { "<leader>a", "<C-e>", "<C-j>", "<C-k>" } },
})
