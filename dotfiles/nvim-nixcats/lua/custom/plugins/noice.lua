require("noice").setup({
  lsp = {
    -- Suprascrie interfața LSP pentru a nu mai avea ferestre mari
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.styled_pa_at_cursor"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- Dezactivăm explicit nvim-notify
  notify = {
    enabled = false,
  },
  messages = {
    enabled = true, -- Activează gestionarea mesajelor
    view = "mini",  -- Trimite toate mesajele (inclusiv "Theme Saved") în colț
    view_error = "mini",
    view_warn = "mini",
  },
  presets = {
    bottom_search = true,         -- Bara de căutare jos (clasic)
    command_palette = false,      -- NU mută bara de comenzi în centrul ecranului
    long_message_to_split = true, -- Mesajele lungi se deschid în split, nu cu Press Enter
  },
  routes = {
    {
      -- Această regulă elimină complet mesajul "Theme Saved" dacă te deranjează chiar și în colț
      filter = {
        event = "msg_show",
        kind = "",
        find = "Theme Saved",
      },
      opts = { skip = true },
    },
  },
})
