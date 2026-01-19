-- 1. Verificăm sigur dacă plugin-ul a fost încărcat de Nix
-- (Folosim pcall ca să nu crape config-ul dacă intri într-un shell fără trouble)
local status, trouble = pcall(require, "trouble")
if not status then
  return
end

trouble.setup({
  focus = true, -- Când deschizi, sari direct cu focus pe listă
  auto_close = false, -- Nu se închide automat când sari la cod (poți schimba în true)
})

vim.keymap.set("n", "<leader>d", function()
  trouble.toggle({ 
    mode = "diagnostics", 
    filter = { buf = 0 } 
  })
end, { desc = "Trouble: Buffer Diagnostics", silent = true })

vim.keymap.set("n", "<leader>D", function()
  trouble.toggle({ mode = "diagnostics" }) 
end, { desc = "Trouble: Project Diagnostics", silent = true })
