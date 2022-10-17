local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.rubocop,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint_d] #{m}\n(#{c})'
    }),
  },
})
