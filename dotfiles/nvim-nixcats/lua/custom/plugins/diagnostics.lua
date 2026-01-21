{
  "rachartier/tiny-inline-diagnostic.nvim",
  event = { "BufReadPost", "BufNewFile" },
  priority = 1000,
  config = function()
      require('tiny-inline-diagnostic').setup({
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
              blend = { factor = 0.2 },
              enable_on_insert = false,
              virt_texts = { priority = 2048 },
          },
      })

      vim.diagnostic.config({
          virtual_text = false,
          signs = true,
          underline = true,
          update_in_insert = false,
          severity_sort = true,
      })
  end
}

