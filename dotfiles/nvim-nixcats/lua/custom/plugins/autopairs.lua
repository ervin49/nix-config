-- Verificăm dacă plugin-ul este încărcat
local status_autopairs, autopairs = pcall(require, "nvim-autopairs")
if not status_autopairs then
    return
end

-- Configurare
autopairs.setup({
    check_ts = true, -- activează integrarea cu treesitter
    ts_config = {
        lua = { "string" }, -- nu pune perechi în string-uri Lua
        javascript = { "template_string" }, -- nu pune perechi în template strings JS
    }
})
