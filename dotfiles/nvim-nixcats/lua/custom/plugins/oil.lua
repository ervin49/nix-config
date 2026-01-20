-- Creăm o comandă de utilizator care încarcă plugin-ul la prima rulare
vim.api.nvim_create_user_command('Oil', function()
    -- 1. Încărcăm plugin-ul în runtimepath
    require('nixCats').pawsible.load({'oil.nvim'})
    -- 2. Rulăm setup-ul
    require('oil').setup({
        columns = { "icon" },
    })
    -- 3. Executăm comanda efectivă
    vim.cmd('Oil')
    -- 4. Ștergem această comandă temporară pentru a nu rula setup-ul de două ori
    vim.api.nvim_del_user_command('Oil')
end, {})
