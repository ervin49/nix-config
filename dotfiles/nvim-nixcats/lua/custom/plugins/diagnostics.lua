return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    
    -- 1. Verificare NixCats
    enabled = require('nixCatsUtils').lazyAdd(true, false),
    
    -- 2. Încărcare: "VeryLazy" sau la evenimentul "LspAttach" e cel mai sigur
    event = "VeryLazy", 
    priority = 1000, -- Vrem să se încarce printre primele de UI

    -- 3. Configurare
    config = function()
        -- Aici lipim exact codul tău de setup
        require('tiny-inline-diagnostic').setup({
            preset = "powerline", 
            hi = {
                error = "DiagnosticError",
                warn = "DiagnosticWarn",
                info = "DiagnosticInfo",
                hint = "DiagnosticHint",
            },
            options = {
                show_source = true, 
                use_icons_from_diagnostic = true,
                add_messages = true,
                pills = false,
                blend = {
                    factor = 0.2,
                },
                enable_on_insert = false,
                virt_texts = {
                    priority = 2048,
                },
            },
        })

        -- 4. Tot aici punem și logica de dezactivare a textului standard
        -- E important să fie aici ca să se execute DOAR când se încarcă pluginul
        vim.diagnostic.config({
            virtual_text = false, -- Oprim textul standard ca să nu se suprapună cu Tiny
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })
    end
  }
}
