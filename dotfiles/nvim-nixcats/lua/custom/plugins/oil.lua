-- Nu mai este nevoie de pcall(require, "oil") aici, 
-- deoarece 'lze' se ocupă de gestionarea erorilor și a încărcării.

return {
    "oil.nvim", -- Numele plugin-ului (cum e definit în nixCats)
    on_cmd = "Oil", -- Se încarcă doar când rulezi comanda :Oil
    -- on_ft = "directory", -- Sau când deschizi un director
    load = function()
        require("oil").setup({
            default_file_explorer = true,
            columns = {
                "icon",
            },
            view_options = {
                show_hidden = true,
            },
            skip_confirm_for_simple_edits = true,
        })
    end,
}
