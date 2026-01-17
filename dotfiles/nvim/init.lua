-- Set Global Variables
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.vimtex_syntax_enabled = 0
vim.g.use_tmp_buffer = 1

-- Set Options
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.laststatus = 3
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.mousemoveevent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.expandtab = true

-- Loads Plugins
require("config.lazy")
require("oil").setup()

-- Sets Color Theme
vim.cmd([[colorscheme jb]])

-- Loads Mappings
require("core.keybinds")
require("core.settings")

-- LSPs
vim.lsp.enable("pyright")  -- Python
vim.lsp.enable("marksman") -- Markdown
vim.lsp.enable("texlab")   -- LaTeX

vim.lsp.handlers["$/progress"] = function() end

-- Autocommands
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufReadPost", "BufNewFile" }, { command = "call glyph_palette#apply()" })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "py", "md" },
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
  end,
})
