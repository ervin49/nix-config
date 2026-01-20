-- 1. Setup-ul de bază pentru nixCats (obligatoriu pentru a avea comanda nixCats)
require('nixCatsUtils').setup({
  non_nix_value = true,
})

-- 2. Setări de bază (Leader key trebuie setat ÎNAINTE de lazy)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
  spec = {
    { import = "custom.plugins" }, 
  },
  performance = {
    rtp = {
      reset = false, 
    },
  },
})

require("custom")
