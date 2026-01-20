return {
  {
    "windwp/nvim-autopairs",
    enabled = require('nixCatsUtils').lazyAdd(true, false),
    event = "InsertEnter", -- Poți folosi și event-uri Lazy
    config = function()
        require("nvim-autopairs").setup({})
    end
  }
}
