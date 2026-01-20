return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    
    -- Verificăm cu NixCats
    enabled = require('nixCatsUtils').lazyAdd(true, false),

    -- Dependențe: Harpoon are nevoie doar de plenary
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")

        -- Setup obligatoriu
        harpoon:setup()

        -- === Mapări (fără Telescope) ===
        
        -- Adaugă fișierul curent în listă
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: Add file" })
        
        -- Deschide meniul rapid (interfața nativă Harpoon)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Toggle UI" })

        -- Navigare rapidă (fișierele 1-4)
        vim.keymap.set("n", "<M-j>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<M-k>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<M-l>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<M-;>", function() harpoon:list():select(4) end)
    end
  }
}
