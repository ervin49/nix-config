-- lua/custom/plugins/init.lua
return {
  -- Aici importăm modulele pe care le-am creat
  require("custom.plugins.lualine"),
  require("custom.plugins.no_conf"),
  require("custom.plugins.colorscheme"),
  require("custom.plugins.snacks"),
  require("custom.plugins.harpoon"),
  require("custom.plugins.themery"),
  require("custom.plugins.oil"),
  require("custom.plugins.blink"),
  require("custom.plugins.noice"),
  require("custom.plugins.diagnostics"),
  require("custom.plugins.lsp"),
  require("custom.plugins.autopairs"),
}
