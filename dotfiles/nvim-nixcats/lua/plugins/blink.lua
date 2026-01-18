local blink = require("blink.cmp")

blink.setup({
  -- Scurtături: Tab pentru selecție, Enter pentru confirmare
  keymap = { preset = 'super-tab' },

  -- Sursele de unde vin sugestiile
  sources = {
    default = {  'snippets','lsp','path','buffer' },
  },

  -- Aspect (fereastră cu bordură, iconițe)
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono'
  },

  -- Afișare documentație automată când selectezi o opțiune
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    ghost_text = { enabled = true }, -- Arată textul gri înainte să scrii
  },
  
  -- IMPORTANT: Spune-i să semneze capabilitățile pentru LSP
  -- Asta face ca LSP-ul să știe că Blink există
  signature = { enabled = true } 
})
