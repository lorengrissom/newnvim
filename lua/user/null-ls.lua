local null_ls = require("null-ls")

local builtins = null_ls.builtins
local sources = {
  builtins.formatting.stylua,
  builtins.formatting.prettier.with({ extra_args = "--no-semi", "--single-quote", "--jsx-single-quote" }),
  builtins.diagnostics.luacheck,
  builtins.formatting.black.with({ extra_args = { "--fast" } }),
  builtins.diagnostics.flake8,
  builtins.diagnostics.eslint_d.with({
    condition = function(utils)
      return utils.root_has_file(".eslintrc.json")
    end,
  }),
  builtins.formatting.eslint_d,
  builtins.formatting.stylelint,
  builtins.formatting.clang_format,
  builtins.diagnostics.stylelint,
  -- builtins.diagnostics.htmlhint,
  builtins.formatting.prettier_d_slim.with({
    -- filetypes = { "html", "json", "css", "scss", "less", "yaml", "markdown" },
    filetypes = { "html", "json", "yaml", "markdown" },
  }),

  builtins.code_actions.gitsigns,
}
null_ls.setup({
  debug = true,
  sources = sources,
})

local defaults = {
  border = nil,
  cmd = { "nvim" },
  debounce = 250,
  debug = false,
  default_timeout = 5000,
  diagnostic_config = nil,
  diagnostics_format = "#{m}",
  fallback_severity = vim.diagnostic.severity.ERROR,
  log_level = "warn",
  notify_format = "[null-ls] %s",
  on_attach = nil,
  on_init = nil,
  on_exit = nil,
  root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
  should_attach = nil,
  sources = nil,
  temp_dir = nil,
  update_in_insert = false,
}
