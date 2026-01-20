return {
  {
    "windwp/nvim-autopairs",
    enabled = true,
    event = "InsertEnter", -- Poți folosi și event-uri Lazy
    config = function()
        require("nvim-autopairs").setup({})
    end
  }
}
