return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'saghen/blink.cmp', -- Blink este acum dependința principală pentru capabilități
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    local lspconfig = require('lspconfig')
    
    -- Pregătim capabilitățile folosind Blink
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    -- Funcție minimalistă pentru on_attach
    local on_attach = function(client, bufnr)
      -- Formatare automată la salvare
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr, async = false })
          end,
        })
      end
    end

    -- CONFIGURARE SERVERELOR (Instalate în prealabil prin Nix)
    -- Adaugă aici orice server ai instalat în configuration.nix / home.nix
    
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
    })

    lspconfig.clangd.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- UI: Margini rotunjite pentru ferestrele de info (Hover)
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  end
}
