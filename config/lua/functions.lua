vim.cmd [[
  function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
      exec ':saveas ' . new_name
      exec ':silent !rm ' . old_name
      redraw!
    endif
  endfunction

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  function! JSFolds()
    let thisline = getline(v:lnum)
    if thisline =~? '\v^\s*$'
      return '-1'
    endif

    if thisline =~ '^import.*$'
      return 1
    else
      return indent(v:lnum) / &shiftwidth
    endif
  endfunction
]]
