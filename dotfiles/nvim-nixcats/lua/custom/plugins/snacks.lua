return {
  {
    "folke/snacks.nvim",
    priority = 1000, -- Se încarcă primul pentru că gestionează UI-ul și Dashboard-ul
    lazy = false,    -- Nu vrem lazy loading la dashboard
    
    -- 1. Verificare NixCats
    enabled = require('nixCatsUtils').lazyAdd(true, false),

    ---@type snacks.Config
    opts = {
      -- === Module Activate ===
      bigfile = { enabled = true },      -- Optimizează deschiderea fișierelor mari
      dashboard = { enabled = true },    -- Ecran de pornire frumos
      indent = { enabled = true },       -- Linii de indentare (înlocuiește indent-blankline)
      input = { enabled = true },        -- UI mai bun pentru input/rename
      notifier = { enabled = true },     -- Notificări (înlocuiește nvim-notify)
      quickfile = { enabled = true },    -- Încarcă rapid fișierele
      scroll = { enabled = true },       -- Scroll fin (smooth scrolling)
      statuscolumn = { enabled = true }, -- Coloana din stânga (git signs, line numbers)
      words = { enabled = true },        -- Highlight la cuvinte similare sub cursor
      
      -- === PICKER (Înlocuitorul Telescope) ===
      picker = {
        enabled = true,
        sources = {
             explorer = {
                -- Configurare pentru file explorer-ul intern (dacă vrei să înlocuiești Oil pe viitor)
                replace_netrw = false, -- Îl lăsăm pe Oil să fie șef momentan
             }
        }
      },
    },

    -- === Scurtături (Keymaps) ===
    keys = {
      -- :: Căutare Fișiere (Picker)
      { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep (Căutare text)" },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
      
      -- :: Buffere
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },

      -- :: Git
      { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
      { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit Toggle" },

      -- :: Utilitare
      { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Pad" },
      { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
      
      -- :: Terminal
      { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
      { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
    },
    
    -- Inițializare pentru comenzi speciale (ex: debugging, reîncărcare config)
    init = function()
      vim.api.nvim_create_user_command("Snacks", function(opts)
        Snacks.picker(opts.args)
      end, { nargs = "?" })
    end,
  }
}
