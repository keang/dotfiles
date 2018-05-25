" Ruby shorthand
"
nnoremap <Leader>r :call VimuxRunCommand("clear; rubocop -a " . bufname("%"))<CR>
nnoremap <Leader>tt :Dispatch rspec %<CR>
nnoremap <Leader>tn :Dispatch rspec %:<C-r>=line('.')<CR><CR>
nnoremap <Leader>tf :Dispatch clear; rspec --color --next-failure<CR>
" shorthand for above
nnoremap <Leader>f :call VimuxRunCommand("clear; rspec --next-failure")<CR>
"nnoremap <Leader>ta :call VimuxRunCommand("clear; export RAILS_ENV=test; rails parallel:setup; rails parallel:spec")<CR>
nnoremap <Leader>ta :Dispatch clear; export RAILS_ENV=test; rails parallel:setup; rails parallel:spec<CR>

" quite byebug

map <Leader>vsq :call VimuxSendText("q")<CR>:call VimuxSendKeys("Enter")<CR>:call VimuxSendText("y")<CR>:call VimuxSendKeys("Enter")<CR>

nnoremap ;r :call ri#OpenSearchPrompt(0)<cr>
