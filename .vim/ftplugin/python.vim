let b:ale_fix_on_save=1
nnoremap <Leader>vrr :call VimuxRunCommand("clear; python " . bufname("%"))<CR>
nnoremap <Leader>l :call VimuxRunLastCommand()<CR>
let g:ctrlp_custom_ignore="lib/python3.5/"
