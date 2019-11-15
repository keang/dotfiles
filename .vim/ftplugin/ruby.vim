" Ruby shorthand
"

" vroom
"
let g:vroom_use_vimux = 1
let g:vroom_write_all = 1
let g:vroom_clear_screen = 1
let g:vroom_use_colors = 1
let g:vroom_map_keys=0
let g:vroom_use_bundle_exec = 1
let g:vroom_spec_command='rspec --format documentation --require ~/work/quickfix_formatter.rb --format QuickfixFormatter --out tmp/.quickfix_list'

nnoremap <Leader>rr :call VimuxRunCommand("clear; rubocop -a " . bufname("%"))<CR>
nnoremap <Leader>ra :call VimuxRunCommand("clear; .git/hooks/post-commit")<CR>
nnoremap <Leader>tt :VroomRunTestFile<CR>
nnoremap <Leader>tn :VroomRunNearestTest<CR>
nnoremap <Leader>tn :VroomRunNearestTest<CR>
nnoremap <Leader>tl :VroomRunLastTest<CR>
nnoremap <Leader>tf :call VimuxRunCommand("clear; bundle exec rspec --next-failure; say done")<CR>
" shorthand for above
nnoremap <Leader>ta :call VimuxRunCommand("clear; export RAILS_ENV=test; rails parallel:setup; rails parallel:spec")<CR>

" quite byebug

map <Leader>vsq :call VimuxSendText("q")<CR>:call VimuxSendKeys("Enter")<CR>:call VimuxSendText("y")<CR>:call VimuxSendKeys("Enter")<CR>

nnoremap ;r :call ri#OpenSearchPrompt(0)<cr>

set synmaxcol=3000
let g:VimuxOrientation = "h"
let g:VimuxHeight = "50"

let b:ale_fix_on_save=0
