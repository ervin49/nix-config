return {
  {
    "stevearc/oil.nvim",
    
    -- 1. Verificare NixCats
    enabled = true,

    -- 2. Dependențe (pentru iconițe)
    dependencies = { "nvim-tree/nvim-web-devicons" },

    -- 3. Configurare
    config = function()
        require("oil").setup({
            default_file_explorer = true, -- Înlocuiește netrw
            columns = {
                "icon",
                -- "permissions",
                -- "size",
                -- "mtime",
            },
            view_options = {
                show_hidden = true, 
            },
            skip_confirm_for_simple_edits = true,
        })

        -- Opțional: Mapare pentru a deschide Oil (de obicei tasta '-')
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
  }
}
