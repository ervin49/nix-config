return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2", -- important (Harpoon v2)
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      -- Add file
      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end, { desc = "Add file to Harpoon" })

      -- Toggle quick menu
      vim.keymap.set("n", "<C-f>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Toggle Harpoon Menu" })

      -- Jump to files
      vim.keymap.set("n", "<C-j>", function()
        harpoon:list():select(1)
      end, { desc = "Harpoon File 1" })

      vim.keymap.set("n", "<C-k>", function()
        harpoon:list():select(2)
      end, { desc = "Harpoon File 2" })

      vim.keymap.set("n", "<C-l>", function()
        harpoon:list():select(3)
      end, { desc = "Harpoon File 3" })

      vim.keymap.set("n", "<C-;>", function()
        harpoon:list():select(4)
      end, { desc = "Harpoon File 4" })
    end,
  },
}

