-- Compile & Run
local function compile_and_run_terminal()
    vim.cmd('write')
    vim.cmd('vsplit | terminal bash -c "g++ ' .. vim.fn.expand('%') .. ' -o ' .. vim.fn.expand('%:r') .. ' && ./' .. vim.fn.expand('%:r') .. '"')
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, true, true), 't', true)
    vim.api.nvim_feedkeys('i', 't', true)
end

local function compile_and_run_java()
    vim.cmd('write')
    vim.cmd('vsplit | terminal bash -c "java ' .. vim.fn.expand('%') .. '"')
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, true, true), 't', true)
    vim.api.nvim_feedkeys('i', 't', true)
end

vim.api.nvim_create_user_command('CompileAndRunTerminal', compile_and_run_terminal, {}) -- Run C++ program in terminal
vim.api.nvim_create_user_command('CompileAndRunJava', compile_and_run_java, {})         -- Run Java program in terminal

-- Keymaps
let mapleader = " "
local keymap = vim.keymap.set
keymap('n', '<leader>tt', ':Themery<CR>', { noremap = true, silent = true })               -- Theme switcher
keymap('n', '<leader>i', 'ggVG=<C-O>', { noremap = true, silent = true })                 -- Auto indent buffer
keymap('n', '<leader>e', ':Oil<CR>', { noremap = true, silent = true })                   -- Open Oil file explorer
keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })                     -- Save file
keymap('n', '<leader>q', ':q!<CR>', { noremap = true, silent = true })                    -- Quit without saving
keymap('n', '<leader>j', ':CompileAndRunJava<CR>', { noremap = true, silent = true })     -- Compile & run Java
keymap('n', '<leader>x', ':CompileAndRunTerminal<CR>', { noremap = true, silent = true }) -- Compile & run C++
keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })                        -- Copy to clipboard
keymap('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })                  -- Move selection down
keymap('v', 'K', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })                  -- Move selection up
keymap('n', '<leader><leader>', '<C-^>', { noremap = true, silent = true })               -- Switch to last buffer
keymap('n', '<leader>ff', require('telescope.builtin').find_files, {})                     -- Find files
keymap('n', '<leader>fg', require('telescope.builtin').live_grep, {})                     -- Live grep
keymap('n', '<leader>fb', require('telescope.builtin').buffers, {})                       -- List buffers
keymap('n', '<leader>fh', require('telescope.builtin').help_tags, {})                     -- Help tags search
keymap('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, {})     -- Fuzzy search in buffer
keymap('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, {})         -- LSP document symbols
keymap('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, {})           -- LSP incoming calls
keymap('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })             -- Go to definition
keymap("n", "<leader>c", "<cmd>NvimTreeFocus<cr>")                                       -- Focus NvimTree
