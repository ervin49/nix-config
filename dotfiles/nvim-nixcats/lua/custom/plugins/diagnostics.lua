local status, tiny = pcall(require, "tiny-inline-diagnostic")
if not status then
    return
end

-- 1. Configurare Plugin
tiny.setup({
    preset = "powerline", -- Variante: "modern", "classic", "powerline", "ghost"
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
-- Este esențial să fie aici, în afara oricărui callback, pentru a se aplica la pornire
vim.diagnostic.config({
    virtual_text = false, -- Oprim textul standard ca să nu se suprapună cu Tiny
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
