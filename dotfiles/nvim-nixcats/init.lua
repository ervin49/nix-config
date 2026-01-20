-- 2. Setări de bază (Leader key trebuie setat ÎNAINTE de lazy)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local lazyPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazyPluginName = "lazy.nvim"

-- Verificăm dacă suntem în modul Nix
if require('nixCatsUtils').isNixCats then
    -- AICI E MAGIA: Îi spunem exact unde a pus Nix plugin-ul lazy
    -- "startupPlugins" trebuie să fie numele categoriei din flake.nix unde ai pus lazy-nvim
    -- "start" înseamnă că e un plugin de pornire
    -- "lazy-nvim" este numele pachetului definit în flake
    local nixLazyPath = nixCats.pawsible({ "startupPlugins", "start", "lazy-nvim" })
    if nixLazyPath ~= nil then
        lazyPath = nixLazyPath
    end
end

-- 2. Configurația Lazy folosind wrapper-ul lazyCat
-- Observă că folosim 'nixCatsUtils.lazyCat' în loc de 'lazy' direct
require('nixCatsUtils.lazyCat').setup(
    lazyPath, 
    {
        -- Aici vine SPEC-ul (lista de plugin-uri)
        { import = "custom.plugins" },
    },
    {
        -- Aici vin OPȚIUNILE (opts)
        performance = {
            rtp = {
                reset = false, -- Încă e critic să fie false
            },
        },
    }
)
require("custom")
