local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local group = augroup("LuaAutoCmdGroup", { clear = true })

autocmd(
  "FileType",
  {
    desc = "Delete git buffer on exit",
    pattern = { "gitcommit", "gitrebase", "gitconfig" },
    command = "set bufhidden=delete",
    group = group
  })

autocmd(
  { "BufWritePost", "FileWritePost" },
  {
    desc = "Source lua on edit",
    pattern = { "*.lua" },
    command = "source % | redraw",
    group = group
  }
)

autocmd(
  { "BufWritePre" },
  {
    desc = "Remove trailing whitespace on save",
    pattern = { "*" },
    command = ":%s/\\s\\+$//e",
    group = group
  }
)

vim.cmd [[
  augroup YankTrigger
    autocmd!
    autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif
    autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '+' | execute 'OSCYankReg "' | endif
    autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '*' | execute 'OSCYankReg "' | endif
  augroup END
]]
