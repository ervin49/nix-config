return {
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        columns = { "icon" },
        view_options = { show_hidden = true },
        skip_confirm_for_simple_edits = true,
      })

      -- Dacă Neovim a fost lansat cu un director (ex: nvim .), deschide Oil automat
      if vim.fn.isdirectory(vim.fn.expand("%:p")) == 1 then
        vim.cmd.Oil()
      end
    end
  }
}

