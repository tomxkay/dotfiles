local g = vim.g

g.webdevicons_enable_startify = 1
g.startify_enable_special = 0
g.startify_session_autoload = 1
g.startify_session_delete_buffers = 1
g.startify_change_to_vcs_root = 1
g.startify_fortune_use_unicode = 1
g.startify_session_persistence = 1
g.startify_session_dir = vim.fn.stdpath('data').."/sessions/"

g.startify_bookmarks = {
  { p = '~/.config/nvim/lua/plugins/init.lua'},
  { i = '~/.config/nvim/init.lua'},
  { m = '~/.config/nvim/lua/mappings.lua'},
  { z = '~/.config/zsh/.zshrc'},
}
