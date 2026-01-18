local oil_status, oil = pcall(require, "oil")
if not oil_status then
    return
end

oil.setup({
  default_file_explorer = true, -- Înlocuiește file explorer-ul standard (netrw)
  columns = {
    "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
  },
  view_options = {
    show_hidden = true, 
  },
  skip_confirm_for_simple_edits = true,
})
