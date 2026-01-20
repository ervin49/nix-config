return {
    "harpoon2", -- Numele plugin-ului din flake.nix (probabil harpoon2 sau harpoon)
    -- Plugin-ul se încarcă DOAR când apeși una dintre aceste taste
    load = function()
        local harpoon = require("harpoon")
        
        harpoon:setup()

        -- Keybinds clasice
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon Add" })

        -- Meniul nativ Harpoon
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Menu" })

        -- Navigare rapida
        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<C-;>", function() harpoon:list():select(4) end)
    end,
}
