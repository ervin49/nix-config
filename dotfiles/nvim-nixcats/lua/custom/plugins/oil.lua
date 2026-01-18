local oil_status, oil = pcall(require, "oil")
if not oil_status then
    return
end

oil.setup({
  -- Opțiuni implicite bune:
  default_file_explorer = true, -- Înlocuiește file explorer-ul standard (netrw)
  columns = {
    "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
  },
  view_options = {
    show_hidden = true, -- Arată fișierele cu punct (.)
  },
  -- Ca să poți șterge fișierele trimise în coșul de gunoi, nu permanent (opțional)
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
})
