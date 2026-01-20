-- Fisier: custom/plugins/harpoon.lua
return {
    -- 1. Numele pachetului din Nix. 
    -- Daca in flake.nix ai pkgs.vimPlugins.harpoon2, lasa "harpoon2".
    "harpoon2", 

    -- 2. ACESTA ESTE FIX-UL: Spunem lui lze ca atunci cand codul cere modulul "harpoon",
    -- el trebuie sa activeze pachetul "harpoon2" din Nix.
    on_require = { "harpoon" },

    -- 3. Triggere pentru incarcare: Plugin-ul porneste cand apesi aceste taste.
    keys = {
        { "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon Add" },
        { "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon Menu" },
        { "<C-j>", function() require("harpoon"):list():select(1) end, desc = "Harpoon Select 1" },
        { "<C-k>", function() require("harpoon"):list():select(2) end, desc = "Harpoon Select 2" },
        { "<C-l>", function() require("harpoon"):list():select(3) end, desc = "Harpoon Select 3" },
        { "<C-h>", function() require("harpoon"):list():select(4) end, desc = "Harpoon Select 4" },
    },

    -- 4. Configurarea propriu-zisa: Se executa DOAR dupa ce pachetul e incarcat.
    after = function()
        local harpoon = require("harpoon")
        harpoon:setup({
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true,
            },
        })
    end,
}
