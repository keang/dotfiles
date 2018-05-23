" vroom
"
let g:vroom_use_vimux = 1
let g:vroom_write_all = 1
let g:vroom_clear_screen = 1
let g:vroom_use_bundle_exec = 0
let g:vroom_use_colors = 1

" Ruby shorthand
"
nnoremap ;r :call VimuxRunCommand("clear; rubocop -a " . bufname("%"))<CR>
