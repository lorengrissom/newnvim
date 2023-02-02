require("lsp-format").setup {}

local on_attach = function(client, bufnr)
  require("lsp-format").on_attach(client, bufnr)
end

require("luasnip.loaders.from_vscode").lazy_load()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- ... custom code ...
require("lspconfig").gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
require("lspconfig").zls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
require("lspconfig").sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
require("lspconfig").pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
require("lspconfig").rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("lsp-format").setup {
  typescript = {
    tab_width = function()
      return vim.opt.shiftwidth:get()
    end,
  },
  yaml = { tab_width = 2 },
}

local prettier = {
  formatCommand = [[prettier --stdin-filepath ${INPUT} ${--tab-width:tab_width}]],
  formatStdin = true,
}

require("lspconfig").efm.setup {
  on_attach = require("lsp-format").on_attach,
  init_options = { documentFormatting = true },
  settings = {
    languages = {
      typescript = { prettier },
      yaml = { prettier },
    },
  },
}
