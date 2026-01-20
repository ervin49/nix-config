local status_ok, themery = pcall(require, "themery")
if not status_ok then
    return
end

return {
    "themery.nvim",
    cmd = {"Themery"},
    load = function()
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
                    name = "jetbrains",
                    colorscheme = "jb",
                    before = [[
                    vim.opt.background = "dark"
                    ]],
                },
            },
        })
    end,
}
