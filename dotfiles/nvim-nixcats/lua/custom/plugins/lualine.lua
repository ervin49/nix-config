return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      require("lualine").setup({
        options = { component_separators = "", section_separators = "" },
        sections = { lualine_a = {"mode"}, lualine_b = {"branch"}, lualine_c = {"filename"},
                     lualine_x = {"filetype"}, lualine_y = {"progress"}, lualine_z = {"location"} },
      })
    end
  }
}

