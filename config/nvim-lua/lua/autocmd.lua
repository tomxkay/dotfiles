vim.cmd [[
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

	augroup YankTrigger
		autocmd!
		autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif
		autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '+' | execute 'OSCYankReg "' | endif
		autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '*' | execute 'OSCYankReg "' | endif
	augroup END

  augroup PersistView
    autocmd!
    " autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview
  augroup END

  augroup Numbertoggle
    autocmd!
		let blacklist = ['NvimTree']
    autocmd BufEnter,FocusGained * if index(blacklist, &ft) < 0 | set relativenumber | endif
    autocmd BufLeave,FocusLost   * if index(blacklist, &ft) < 0 | set norelativenumber | endif
  augroup END

  augroup VimFold
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd BufWinEnter * silent! :%foldopen!
  augroup END
]]
