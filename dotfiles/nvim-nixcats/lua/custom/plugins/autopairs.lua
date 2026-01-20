return {
    "nvim-autopairs", -- Numele pachetului din flake.nix
    after = function()
        local autopairs = require("nvim-autopairs")

        autopairs.setup({
            check_ts = true, -- activează integrarea cu treesitter
            ts_config = {
                lua = { "string" }, -- nu pune perechi în string-uri Lua
                javascript = { "template_string" }, -- nu pune perechi în template strings JS
            }
        })
    end,
}
