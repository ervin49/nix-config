-- Verificăm dacă plugin-ul este încărcat
local status, tiny = pcall(require, "tiny-inline-diagnostic")
if not status then
  vim.notify("Tiny Diagnostic nu este instalat!", vim.log.levels.WARN)
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
        show_source = true, -- Arată sursa (ex: clangd)
        use_icons_from_diagnostic = true,
        add_messages = true, -- Arată mesajul erorii lângă cursor
        pills = false,
        blend = {
            factor = 0.2,
        },
        enable_on_insert = false, -- Nu arăta erori cât timp scrii (distrage atenția)
        virt_texts = {
            priority = 2048,
        },
    },
})

-- 2. Dezactivăm diagnosticele standard (virtual_text)
-- Acest pas este OBLIGATORIU pentru ca tiny-inline să aibă sens
vim.diagnostic.config({
    virtual_text = false, -- Oprim textul de la capătul liniei
    signs = true,         -- Păstrăm iconițele din stânga (Gutter)
    underline = true,     -- Păstrăm sublinierea codului greșit
    update_in_insert = false,
    severity_sort = true,
})
