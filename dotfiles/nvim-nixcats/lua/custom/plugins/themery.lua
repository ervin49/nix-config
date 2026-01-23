return {
  {
    "zaldih/themery.nvim",
    
    cmd = "Themery",

    -- 2. Configurare
    config = function()
        require("themery").setup({
            livePreview = true,
            themes = {
                {
                    name = "gruvbox-material",
                    colorscheme = "gruvbox-material",
                },
                {
                    name = "rose-pine",
                    colorscheme = "rose-pine",
                },
            },
        })
    end
  }
}
