-- ==========================================================
-- 1. HACK PENTRU EROAREA "DEPRECATED"
-- ==========================================================
-- Asta blochează mesajul enervant ca să nu îți oprească editorul
local original_notify = vim.notify
vim.notify = function(msg, level, opts)
  if msg and (msg:match("deprecated") or msg:match("framework")) then
    return
  end
  original_notify(msg, level, opts)
end
-- ==========================================================

local lspconfig = require('lspconfig')
local blink = require('blink.cmp')

-- Conectăm Blink pentru autocompletare
local capabilities = blink.get_lsp_capabilities()

-- ==========================================================
-- 2. CONFIGURARE CLANGD (C++)
-- ==========================================================
lspconfig.clangd.setup({
  capabilities = capabilities,
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  
  -- TRUCUL MAGIC:
  -- Îl forțăm să considere folderul curent ca fiind rădăcina proiectului.
  -- Asta îl face să pornească imediat, chiar și pe fișiere simple.
  root_dir = function() 
      return vim.fn.getcwd() 
  end,
})

-- ==========================================================
-- 3. CONFIGURARE JAVA (JDTLS)
-- ==========================================================
lspconfig.jdtls.setup({
  capabilities = capabilities,
  cmd = { "jdtls" },
  -- Și la Java îl facem mai puțin pretențios
  root_dir = function() 
      return vim.fs.dirname(vim.fs.find({'.git', 'mvnw', 'gradlew', 'pom.xml'}, { upward = true })[1]) 
             or vim.fn.getcwd()
  end,
})

-- ==========================================================
-- 4. SCURTĂTURI DE TASTE
-- ==========================================================
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
})
