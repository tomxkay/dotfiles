local M = {}

function M.keymap(mode, keybind, action, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  vim.api.nvim_set_keymap(mode, keybind, action, options)
end

function M.map(keybind, action, opts)
  M.keymap('', keybind, action, opts)
end

function M.cmap(keybind, action, opts)
  M.keymap('c', keybind, action, opts)
end

function M.nmap(keybind, action, opts)
  M.keymap('n', keybind, action, opts)
end

function M.xmap(keybind, action, opts)
  M.keymap('x', keybind, action, opts)
end

function M.vmap(keybind, action, opts)
  M.keymap('v', keybind, action, opts)
end

function M.augroup(name, opts)
  local options = { clear = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  vim.api.nvim_create_augroup(name, options)
end

return M
