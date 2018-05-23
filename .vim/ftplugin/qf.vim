" Settings to navigate from quickfix window
"

" This is qf setting, window prefix is c, ie. copen
let s:matches_window_prefix = 'c'

nnoremap <silent> <buffer> h  <C-W><CR><C-w>K
nnoremap <silent> <buffer> H  <C-W><CR><C-w>K<C-w>b
nnoremap <silent> <buffer> o  <CR>
nnoremap <silent> <buffer> t  <C-w><CR><C-w>T
nnoremap <silent> <buffer> T  <C-w><CR><C-w>TgT<C-W><C-W>
nnoremap <silent> <buffer> v  <C-w><CR><C-w>H<C-W>b:resize 10<CR><C-W>J<C-W>t

exe 'nnoremap <silent> <buffer> e <CR><C-w><C-w>:' . s:matches_window_prefix .'close<CR>'
exe 'nnoremap <silent> <buffer> go <CR>:' . s:matches_window_prefix . 'open<CR>'
exe 'nnoremap <silent> <buffer> q  :' . s:matches_window_prefix . 'close<CR>'

exe 'nnoremap <silent> <buffer> V :let b:height=winheight(0)<CR><C-w><CR><C-w>H:' . s:matches_window_prefix . 'open<CR><C-w>J:exe printf(":normal %d\<lt>c-w>_", b:height)<CR>'
" Interpretation:
" :let b:height=winheight(0)<CR>                      Get the height of the quickfix/location list window
" <CR><C-w>                                           Open the current item in a new split
" <C-w>H                                              Slam the newly opened window against the left edge
" :copen<CR> -or- :lopen<CR>                          Open either the quickfix window or the location list (whichever we were using)
" <C-w>J                                              Slam the quickfix/location list window against the bottom edge
" :exe printf(":normal %d\<lt>c-w>_", b:height)<CR>   Restore the quickfix/location list window's height from before we opened the match
