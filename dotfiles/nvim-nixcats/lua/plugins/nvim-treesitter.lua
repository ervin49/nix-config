return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,         -- se încarcă imediat
  build = ':TSUpdate',  -- construiește parser-ele
  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
      after = 'nvim-treesitter',  -- se încarcă după Treesitter
    },
  },
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = { 'lua', 'c', 'cpp' },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
    },
  },
  config = function(_, opts)
    vim.schedule(function()  -- rulează config-ul după ce runtimepath e gata
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if ok then
        configs.setup(opts)
      else
        vim.notify("nvim-treesitter not found in runtimepath!", vim.log.levels.ERROR)
      end
    end)
  end,
}

