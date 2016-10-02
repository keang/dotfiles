"
" Vundle
"
set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Functionality
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim.git'
Bundle 'airblade/vim-gitgutter'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'
Bundle 'wakatime/vim-wakatime'

" Syntaxs
Bundle 'digitaltoad/vim-jade.git'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'plasticboy/vim-markdown.git'
Bundle 'kchmck/vim-coffee-script'
Bundle 'Blackrush/vim-gocode'
Bundle 'derekwyatt/vim-scala'
Bundle 'rking/ag.vim'
Bundle 'junegunn/vim-easy-align'
Bundle 'vim-scripts/indentpython.vim'

"
" General
"
filetype indent plugin on
set history=700
set autoread

"
" User interface
"
set number
set rnu
set so=7
set wildmenu
set ruler
set backspace=eol,start,indent
set whichwrap+=<,>,h,l,[,]
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set noerrorbells
set novisualbell

"
" Color and Fonts
"
syntax on
set background=dark
set encoding=utf8
set ffs=unix,mac,dos

"
" Files, backups and undo
"
set nobackup
set nowb
set noswapfile

"
" Text, tab and indent related
"
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set fdm=manual
set nofen

set nowrap
set autoindent
set smartindent

set lbr
set tw=500

"
" Status line
"
set laststatus=2

"
" MacVim
"
if has("gui_macvim")
  set guifont=menlo:h14
endif

"
" Mapping Key
"
let mapleader="m"
inoremap jj <Esc>
inoremap jw <Esc>:w<CR>
nnoremap K i<Enter><Esc>

noremap <Leader>y "+y
nnoremap <Leader>p :let @+ = expand("%")<CR>

noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

"autocomplete
inoremap <tab> <C-p>

" Reload file
noremap <Leader>e :e<CR>
" Pane map
noremap <Leader>] :vertical resize +5<CR>
noremap <Leader>[ :vertical resize -5<CR>
" Tab map
noremap <Leader>tn :tabe<CR>
noremap <Leader>ta :tabp<CR>
noremap <Leader>td :tabn<CR>
" Pane map
noremap <Leader>sp :vsp<CR>
noremap <Leader>st :vsp#<CR>
" Buffer map
noremap <Leader>n :bunload<CR>
noremap <Leader>b :bn<CR>
noremap <Leader>m :bp<CR>
" vim.ag quick search
nnoremap <Leader>/ :Ag <cword>
" git map
nnoremap <Leader>g :Gstatus<CR>
nnoremap <Leader>d :Gvdiff<CR>
nnoremap dp :diffput<CR>

" vroom
let g:vroom_use_vimux = 1
let g:vroom_write_all = 1
let g:vroom_clear_screen = 1
let g:vroom_use_bundle_exec = 0
let g:vroom_use_colors = 1
map <leader>ir :VimuxInspectRunner<CR>
map <Leader>qr :VimuxCloseRunner<CR>

nmap <Leader>o o<Esc>k

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" Toggle
map <F3> :set number!<CR>
map <Leader>w :set wrap!<CR>
map <F4> :set invpaste<CR>
"cnoremap q1 q!
"cnoremap Q q
"cnoremap Wq wq
"cnoremap WQ wq
if has("user_commands")
  command! -bang -nargs=? -complete=file E e<bang> <args>
  command! -bang -nargs=? -complete=file W w<bang> <args>
  command! -bang -nargs=? -complete=file Wq wq<bang> <args>
  command! -bang -nargs=? -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
endif

" Remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za


" CtrlP
let g:ctrlp_show_hidden = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|bower_components|dev/gae|dev/android|tmp|)$'
  \,'file': '\v\.(swp|jar|png|jpg|gif|tgz|gz|pdf|pyc)$'
  \ }

" Specific filetype
" Markdown
let g:vim_markdown_folding_disabled=1
au FileType mkd set shiftwidth=4 tabstop=4 wrap

" EJS
au FileType ejs set filetype=html

