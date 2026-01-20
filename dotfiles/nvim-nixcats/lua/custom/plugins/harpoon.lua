local harpoon = require("harpoon")

-- Setup obligatoriu pentru Harpoon v2
harpoon:setup()

-- Configurare Keymaps (Esențial pentru Harpoon)
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

-- Exemplu de mapări (modifică <leader>a după preferințe)
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: Add file" })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Toggle UI" })

-- Navigare rapidă (fișierele 1-4)
vim.keymap.set("n", "<M-j>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<M-k>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<M-l>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<M-;>", function() harpoon:list():select(4) end)
