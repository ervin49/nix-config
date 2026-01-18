-- Set Global Variables
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

require("oil").setup()

-- Sets Color Theme
vim.cmd([[colorscheme jb]])

-- Loads plugins configs
require("plugins")

-- Loads Mappings
require("core.keybinds")
require("core.settings")

vim.lsp.handlers["$/progress"] = function() end
