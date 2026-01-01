local function compile_and_run_terminal()
  vim.cmd('write')
  vim.cmd('vsplit | terminal bash -c "g++ ' ..
  vim.fn.expand('%') .. ' -o ' .. vim.fn.expand('%:r') .. ' && ./' .. vim.fn.expand('%:r') .. '"')
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, true, true), 't', true)
  vim.api.nvim_feedkeys('i', 't', true)
end


vim.api.nvim_create_user_command('CompileAndRunTerminal', compile_and_run_terminal, {})

function compile_and_run_java()
  vim.cmd('write')
  vim.cmd('vsplit | terminal bash -c "java ' .. vim.fn.expand('%') .. '"')
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, true, true), 't', true)
  vim.api.nvim_feedkeys('i', 't', true)
end

vim.api.nvim_create_user_command('CompileAndRunJava', compile_and_run_java, {})


vim.api.nvim_set_keymap('n', '<leader>tt', ':Themery<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>i', 'ggVG=<C-O>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', ':Oil<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':CompileAndRunJava<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':CompileAndRunTerminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })

local keymap = vim.keymap.set

keymap('n', '<leader>ff', require('telescope.builtin').find_files, {})
keymap('n', '<leader>fg', require('telescope.builtin').live_grep, {})
keymap('n', '<leader>fb', require('telescope.builtin').buffers, {})
keymap("n", "<leader>e", "<cmd>Oil<cr>")
keymap("n", "<leader>c", "<cmd>NvimTreeFocus<cr>")
keymap('n', '<leader>fh', require('telescope.builtin').help_tags, {})
keymap('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, {})
keymap('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, {})
keymap('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, {})

vim.api.nvim_set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>', '<C-^>', { noremap = true, silent = true })
