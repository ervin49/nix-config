-- Variabile scurte
local g   = vim.g
local opt = vim.opt

-- General UI
opt.number        = true       -- Show absolute line numbers
opt.cmdheight     = 0
opt.relativenumber= true       -- Show relative line numbers
opt.cursorline    = true       -- Highlight current line
opt.termguicolors = true       -- Enable true colors
opt.syntax        = 'on'       -- Enable syntax highlighting
opt.background    = 'dark'     -- Dark background
opt.scrolloff     = 4          -- Lines to keep above/below cursor

-- Indentation / Tabs
opt.tabstop       = 4          -- Tab width
opt.shiftwidth    = 4          -- Indent width
opt.expandtab     = true       -- Use spaces instead of tabs
opt.cindent       = true       -- Smart auto-indent
opt.cinoptions:append(":0")

-- Editing behavior
opt.autowrite     = true       -- Auto-save before commands
opt.smartcase     = true       -- Override ignorecase if uppercase
opt.swapfile      = false      -- Disable swap files

-- Diagnostics
vim.diagnostic.config {
    float = { border = "rounded" }     -- Rounded border for diagnostic popups
}
