return {
  {
    "zaldih/themery.nvim",
    
    -- 1. Verificare NixCats
    enabled = true,
    cmd = "Themery",

    -- 2. Configurare
    config = function()
        require("themery").setup({
            livePreview = true,
            themes = {
                {
                    name = "gruvbox-material",
                    colorscheme = "gruvbox-material",
                    before = [[
                        vim.opt.background = "dark"
                    ]],
                },
                {
                    name = "rose-pine",
                    colorscheme = "rose-pine",
                    before = [[
                        vim.opt.background = "dark"
                    ]],
                },
            },
        })
    end
  }
}
