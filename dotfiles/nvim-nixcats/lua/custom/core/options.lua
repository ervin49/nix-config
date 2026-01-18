-- Variabile scurte
local g   = vim.g
local opt = vim.opt

-- Global / Plugins
g.AutoPairsFlyMode = 0        -- Disable autopairs fly mode

-- General UI
opt.number        = true       -- Show absolute line numbers
opt.relativenumber= true       -- Show relative line numbers
opt.ruler         = false       -- Show cursor position
opt.cursorline    = true       -- Highlight current line
opt.termguicolors = true       -- Enable true colors
opt.syntax        = 'on'       -- Enable syntax highlighting
opt.background    = 'dark'     -- Dark background
opt.scrolloff     = 4          -- Lines to keep above/below cursor
opt.showmode = false
opt.laststatus = 0
opt.cmdheight = 1
opt.shortmess:append("cFW")

-- Indentation / Tabs
opt.tabstop       = 4          -- Tab width
opt.shiftwidth    = 4          -- Indent width
opt.expandtab     = true       -- Use spaces instead of tabs
opt.smartindent   = true       -- Smart auto-indent
opt.iskeyword:append("-")      -- Treat dash as part of a word

-- Editing behavior
opt.autowrite     = true       -- Auto-save before commands
opt.ignorecase    = true       -- Ignore case in search
opt.smartcase     = true       -- Override ignorecase if uppercase
opt.swapfile      = false      -- Disable swap files

-- Highlight / Colors
vim.api.nvim_set_hl(0, 'my_bg',        { bg = '#000000' })
vim.api.nvim_set_hl(0, 'my_bg_cursor', { fg = '#fabd2f', bg = '#3c3836' })
vim.api.nvim_set_hl(0, 'LineNr',       { link = 'my_bg' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { link = 'my_bg_cursor' })

-- Diagnostics
vim.diagnostic.config {
    float = { border = "rounded" }     -- Rounded border for diagnostic popups
}
