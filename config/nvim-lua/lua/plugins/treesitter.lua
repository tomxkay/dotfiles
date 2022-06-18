local configs = require 'nvim-treesitter.configs'
configs.setup {
  ensure_installed = { "lua", "ruby", "typescript", "tsx", "vim" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
