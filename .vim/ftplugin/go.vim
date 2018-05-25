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

nnoremap <Leader>t :GolangTestCurrentPackage<CR>
nnoremap <Leader>rf :wa<CR> :GolangTestFocused<CR>
" We want to see test outputs in vertical pane
"
let g:VimuxOrientation = "h"
let g:VimuxHeight = "33"
