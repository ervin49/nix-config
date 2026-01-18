local blink = require('blink.cmp')
local lspconfig = require('lspconfig') -- Îl păstrăm doar pentru utilitare (ex: root_pattern)

-- 1. Obținem capabilitățile de la Blink (pentru autocomplete)
local capabilities = blink.get_lsp_capabilities()

-- Funcție ajutătoare pentru a aplica noul standard
-- Aceasta verifică dacă ai Neovim-ul nou care suportă 'vim.lsp.config'
local function enable_server(server_name, config)
  -- Adăugăm capabilities la config-ul serverului
  config.capabilities = capabilities
  
  -- Dacă există noul sistem (Neovim 0.11+), îl folosim
  if vim.lsp.config then
    vim.lsp.config[server_name] = config
    vim.lsp.enable(server_name)
  else
    -- Fallback pentru versiuni mai vechi (dacă nu ai Neovim 0.11 încă)
    -- Accesăm direct configs pentru a evita eroarea de 'deprecated'
    require('lspconfig.configs')[server_name].setup(config)
  end
end

-- ==========================================
-- AICI CONFIGURĂM SERVERELE
-- ==========================================

-- 1. C++ (clangd)
enable_server("clangd", {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
})

-- 2. Java (jdtls)
enable_server("jdtls", {
  cmd = { "jdtls" },
  root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
})

-- 3. Nix (nil)
enable_server("nil_ls", {})

-- 4. Lua (lua_ls)
enable_server("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } }
    }
  }
})

-- ==========================================
-- SCURTĂTURI DE TASTE (Keymaps)
-- ==========================================
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  end,
})
