" golang
"
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_term_mode = "vsplit"
let g:go_term_width = 30

nnoremap <Leader>t :GolangTestCurrentPackage<CR>
nnoremap <Leader>f :wa<CR> :GolangTestFocused<CR>
nnoremap <Leader>b :GoBuild<CR>
nnoremap <Leader>r :call VimuxRunCommand("clear; go run " . bufname("%"))<CR>
" We want to see test outputs in vertical pane
"
let g:VimuxOrientation = "h"
let g:VimuxHeight = "30"

" Save and restore views
inoremap ;w <Esc>:mkview<CR>:w<CR>:lo<CR>
nnoremap ;w :mkview<CR>:w<CR>:lo<CR>
