local status_ok, themery = pcall(require, "themery")
if not status_ok then
    return
end

require("themery").setup({
    livePreview = true,
    themes = {
        {
            name = "kanagawa",
            colorscheme = "kanagawa",
            before = [[
            vim.opt.background = "dark"
            ]],
            after = [[-- Same as before, but after if you need it]]
        } 
        {
            name = "jb",
            colorscheme = "jb",
            before = [[
            vim.opt.background = "dark"
            ]],
        },
    },
})
