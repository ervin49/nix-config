return {
  {
    "folke/noice.nvim",
    
    -- 1. Verificare NixCats
    enabled = require('nixCatsUtils').lazyAdd(true, false),
    
    -- 2. Noice se încarcă de obicei cu "VeryLazy" pentru a prelua UI-ul rapid
    event = "VeryLazy",

    -- 3. Dependențe OBLIGATORII
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- "rcarriga/nvim-notify", -- Opțional, pentru că l-ai dezactivat în config, dar e bine de știut
    },

    -- 4. Configurare prin `opts` (Lazy face automat setup(opts))
    opts = {
        lsp = {
            -- Suprascrie interfața LSP
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true, -- Am corectat typo-ul probabil (era styled_pa_at_cursor)
                ["cmp.entry.get_documentation"] = true,
            },
        },
        -- Dezactivăm explicit nvim-notify
        notify = {
            enabled = false,
        },
        messages = {
            enabled = true, 
            view = "mini",
            view_error = "mini",
            view_warn = "mini",
        },
        presets = {
            bottom_search = true,
            command_palette = false,
            long_message_to_split = true,
        },
        routes = {
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    find = "Theme Saved",
                },
                opts = { skip = true },
            },
        },
    }
  }
}
