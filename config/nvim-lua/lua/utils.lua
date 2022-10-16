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

function M.imap(keybind, action, opts)
  M.keymap('i', keybind, action, opts)
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

-- require all lua files in specified dir except init.lua
function M.require_dir(path)
  for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/'..path, [[v:val =~ '\.lua$']])) do
    if file ~= 'init.lua' then
      local status_ok, _ = pcall(require, path..'.'..file:gsub('%.lua$', ''))

      if not status_ok then
        vim.notify('Failed loading ' .. file, vim.log.levels.ERROR)
      end
    end
  end
end

return M
