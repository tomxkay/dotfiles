vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end

  augroup Reload
    autocmd!
    autocmd BufWritePost,FileWritePost *.lua source % | redraw
  augroup END

  augroup Vimrc
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace on save
    autocmd FileType html,css EmmetInstall
  augroup END

  augroup SaveTrigger
    autocmd!
    "autocmd BufWrite * :Autoformat
  augroup END

  augroup PersistView
    autocmd!
    " autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview
  augroup END

  augroup Numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained * set relativenumber
    autocmd BufLeave,FocusLost   * set norelativenumber
  augroup END

  augroup VimFold
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd BufWinEnter * silent! :%foldopen!
  augroup END
]]
