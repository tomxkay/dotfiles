vim.cmd [[
 "OSCYank
 vnoremap <leader>c :OSCYank<CR>
 nmap <leader>o <Plug>OSCYank

 noremap <leader>/ :Commentary<CR>

 nnoremap <Leader>; :NvimTreeToggle<CR>
 nnoremap <Leader>r :NvimTreeRefresh<CR>
 nnoremap <Leader>v :NvimTreeFindFile<CR>

 " Make arrow keys move visual blocks around
 nmap ˚ V<Plug>SchleppUp
 nmap ∆ V<Plug>SchleppDown
 nmap ¬ V<Plug>SchleppRight
 nmap ˙ V<Plug>SchleppLeft

 vmap ˚ <Plug>SchleppUp
 vmap ∆ <Plug>SchleppDown
 vmap ¬ <Plug>SchleppRight
 vmap ˙ <Plug>SchleppLeft

 vmap <up>    <Plug>SchleppUp
 vmap <down>  <Plug>SchleppDown
 vmap <right> <Plug>SchleppRight
 vmap <left>  <Plug>SchleppLeft

 vmap <C-D> <Plug>SchleppDup
 vmap  <Plug>SchleppDup k
 vmap Ô <Plug>SchleppDup j
 nmap  <Plug>SchleppDup k
 nmap Ô <Plug>SchleppDup j

 "" vim-test
 nmap <silent> <leader>tn :TestNearest<CR>
 nmap <silent> <leader>tf :TestFile<CR>
 nmap <silent> <leader>ta :TestSuite<CR>
 nmap <silent> <leader>tl :TestLast<CR>
 nmap <silent> <leader>tv :TestVisit<CR>

 " Telescope
 nnoremap <Leader>ff :Telescope find_files<CR>
 nnoremap <Leader>fg :Telescope live_grep<CR>
 nnoremap <Leader>fb :Telescope buffers<CR>
 nnoremap ; :Telescope buffers<CR>
 nnoremap <Leader>fh :Telescope find_files<CR>
 nnoremap <Leader>fl :Telescope current_buffer_fuzzy_find<CR>

 " vim-autoformat
 noremap <F4> :Autoformat<CR>
]]
