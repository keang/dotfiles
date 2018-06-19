" Ruby shorthand
"

" vroom
"
let g:vroom_use_vimux = 1
let g:vroom_write_all = 1
let g:vroom_clear_screen = 1
let g:vroom_use_bundle_exec = 0
let g:vroom_use_colors = 1
let g:vroom_map_keys=0

nnoremap <Leader>r :call VimuxRunCommand("clear; rubocop -a " . bufname("%"))<CR>
nnoremap <Leader>tt :VroomRunTestFile<CR>
nnoremap <Leader>tn :VroomRunNearestTest<CR>
nnoremap <Leader>tl :VroomRunLastTest<CR>
nnoremap <Leader>tf :call VimuxRunCommand("clear; rspec --next-failure")<CR>
" shorthand for above
nnoremap <Leader>f :call VimuxRunCommand("clear; rspec --next-failure")<CR>
nnoremap <Leader>ta :call VimuxRunCommand("clear; export RAILS_ENV=test; rails parallel:setup; rails parallel:spec")<CR>

" quite byebug

map <Leader>vsq :call VimuxSendText("q")<CR>:call VimuxSendKeys("Enter")<CR>:call VimuxSendText("y")<CR>:call VimuxSendKeys("Enter")<CR>

nnoremap ;r :call ri#OpenSearchPrompt(0)<cr>

let g:VimuxOrientation = "h"
let g:VimuxHeight = "33"

let b:ale_fix_on_save=1
