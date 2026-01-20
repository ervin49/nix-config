require("custom.plugins.blink")
require("custom.plugins.diagnostics")
require("custom.plugins.lsp")
require("custom.plugins.oil")
require("custom.plugins.snacks")
require("custom.plugins.transparent")
require("custom.plugins.autopairs")

require('lze').load({
    { import = "custom.plugins.lualine"},
    { import = "custom.plugins.themery"},
    { import = "custom.plugins.harpoon" },
})
