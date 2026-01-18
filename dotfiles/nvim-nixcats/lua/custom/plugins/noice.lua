require("noice").setup({
  -- Mută linia de comandă (:w, :q) într-un popup central
  cmdline = {
    enabled = true,
    view = "cmdline_popup", 
  },
  
  -- Mută mesajele (ex: "file written") în notificări, ca să nu apară jos
  messages = {
    enabled = true,
    view = "notify",
    view_error = "notify",
    view_warn = "notify",
  },

  -- Ascunde bara de status clasică a plugin-ului (noi folosim lualine -> tmux)
  lsp = {
    -- Override pentru a folosi noice la documentație și semnături
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  
  -- Aici poți ascunde și alte mesaje care te enervează
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
  },
})
