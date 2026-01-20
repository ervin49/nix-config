return {
    "tiny-inline-diagnostic.nvim", -- sau numele exact din flake.nix
    after = function()
        local tiny = require("tiny-inline-diagnostic")

        -- 1. Configurare Plugin
        tiny.setup({
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

        -- 2. Dezactivăm diagnosticele standard
        -- Punem asta aici pentru a ne asigura că setările se aplică 
        -- exact când Tiny Inline preia controlul.
        vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })
    end,
}
