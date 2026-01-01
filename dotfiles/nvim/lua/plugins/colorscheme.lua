return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        style = "storm",
      })
    end
  },
  {
    "sainnhe/gruvbox-material", priority = 1000, config = true, opts = ...,
  }
}
