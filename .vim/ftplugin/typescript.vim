" Fix files with prettier, and then ESLint.
let b:ale_fix_on_save = 1
let b:ale_lint_on_save = 1
let b:ale_sign_column_always = 1
let b:ale_set_loclist = 1
nmap <Leader>k <Plug>(TsuquyomiSplitDefinition)
nmap <Leader>K <Plug>(TsuquyomiDefinition)
nnoremap <Leader>tn 0f'vi'"py:call VimuxRunCommand("npm run test -- -t '" . @p . "'")<CR>
nnoremap <Leader>tt :call VimuxRunCommand("npm run test -- " . bufname("%"))<CR>
nnoremap <Leader>ta :call VimuxRunCommand("npm run test")<CR>
nnoremap <Leader>tl :call VimuxRunLastCommand()<CR>
