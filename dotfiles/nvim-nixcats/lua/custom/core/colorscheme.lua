-- Încercăm să setăm tema cu pcall (protected call)
-- Astfel, dacă tema nu există, Neovim nu va crăpa la pornire, ci doar va folosi tema default.

local status_ok, _ = pcall(vim.cmd, "colorscheme gruvbox-material")

if not status_ok then
  vim.notify("Tema 'gruvbox-material' nu a fost gasita!", vim.log.levels.WARN)
  -- Fallback la o temă default ca să nu arate urât
  vim.cmd("colorscheme default")
  return
end
