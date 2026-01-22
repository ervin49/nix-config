return {
    {
        "ThePrimeagen/harpoon",
        lazy = false,
        config = function()
            local harpoon = require("harpoon")

            -- REQUIRED
            harpoon:setup()
            -- REQUIRED

            local ui = require("harpoon.ui")
            local mark = require("harpoon.mark")

            -- :: Adaugă fișier în Harpoon
            vim.keymap.set("n", "<leader>a", function() mark:add_file() end, { desc = "Add file to Harpoon" })

            -- :: Deschide meniul rapid Harpoon
            vim.keymap.set("n", "<C-e>", function() ui:toggle_quick_menu() end, { desc = "Toggle Harpoon Menu" })

            -- :: Salt direct la fișierele Harpoon
            vim.keymap.set("n", "<C-j>", function() ui:nav_file(1) end, { desc = "Harpoon File 1" })
            vim.keymap.set("n", "<C-k>", function() ui:nav_file(2) end, { desc = "Harpoon File 2" })
            vim.keymap.set("n", "<C-l>", function() ui:nav_file(3) end, { desc = "Harpoon File 3" })
            vim.keymap.set("n", "<C-;>", function() ui:nav_file(4) end, { desc = "Harpoon File 4" })
        end,
    }
}
