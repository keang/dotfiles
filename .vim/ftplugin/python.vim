let b:ale_fix_on_save=1
nnoremap <Leader>vr :call VimuxRunCommand("clear; python " . bufname("%"))<CR>
nnoremap <Leader>l :call VimuxRunLastCommand()<CR>