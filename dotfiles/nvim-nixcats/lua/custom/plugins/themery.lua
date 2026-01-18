local status_ok, themery = pcall(require, "themery")
if not status_ok then
    return
end

require("themery").setup({
    livePreview = true,
    themes = {
        {
            name = "rose-pine",
            colorscheme = "rose-pine",
            before = [[
            vim.opt.background = "dark"
            ]],
        },
        {
            name = "jb",
            colorscheme = "jb",
            before = [[
            vim.opt.background = "dark"
            ]],
        },
    },
})
