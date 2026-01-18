vim.g.AutoPairsFlyMode = 0
vim.o.number = true
vim.o.ruler = true
vim.o.termguicolors = true
vim.o.syntax = 'on'
vim.opt.cursorline = true
vim.opt.iskeyword:append("-")
vim.diagnostic.config {
  float = { border = "rounded" }, -- add border to diagnostic popups
}
vim.o.scrolloff = 4
vim.o.autowrite = true
vim.o.background = 'dark'
vim.o.tabstop = 4
vim.o.cindent = true
vim.o.shiftwidth = 4
vim.cmd("set noswapfile")
vim.o.expandtab = true
vim.opt.smartcase = true
vim.o.smartindent = true
vim.o.relativenumber = true
vim.o.autoindent = true
vim.opt.ignorecase = true
vim.api.nvim_set_hl(0, 'my_bg', { bg = '#000000' })
vim.api.nvim_set_hl(0, 'my_bg_cursor', { fg = '#fabd2f', bg = '#3c3836' })
vim.api.nvim_set_hl(0, 'LineNr', { link = 'my_bg' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { link = 'my_bg_cursor' })
