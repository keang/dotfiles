"
" Vundle
"
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Functionality
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim.git'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'wakatime/vim-wakatime'
Plugin 'danchoi/ri.vim'
Plugin 'brooth/far.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-bundler'
Plugin 'benmills/vimux'

" Syntaxs
Plugin 'digitaltoad/vim-jade.git'
Plugin 'pangloss/vim-javascript'
Plugin 'groenewege/vim-less'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'plasticboy/vim-markdown.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'
Plugin 'derekwyatt/vim-scala'
Plugin 'slim-template/vim-slim.git'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'mxw/vim-jsx.git'
Plugin 'isRuslan/vim-es6'
Plugin 'elixir-lang/vim-elixir'

Plugin 'junegunn/vim-easy-align'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rking/ag.vim'

call vundle#end()            " required
filetype indent plugin on

"
" General
"
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
"set laststatus=2

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
inoremap ;w <Esc>:w<CR>
nnoremap ;w <Esc>:w<CR>
nnoremap K i<Enter><Esc>
nnoremap <Leader>k i<Enter><Esc>

noremap <Leader>y "+y
nnoremap <Leader>p :let @+ = expand("%")<CR>

noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

"autocomplete
inoremap <tab> <C-p>

" Close file
noremap ;q :q<CR>
noremap ;f :tab sp<CR>

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
noremap <Leader>v :bp<CR>
" vim.ag quick search
nnoremap <Leader>/ :Ag! <cword><CR>
cnoreabbrev Ag Ag!
nnoremap <Leader>a :Ag!<Space>

" search and replace
nnoremap <Leader>? :%s/
vnoremap <Leader>/ <Esc>:%s/\%V

" easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>m <Plug>(easymotion-bd-w)
nmap <Leader>m <Plug>(easymotion-overwin-w)

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
  \ 'dir':  '\v[\/](_build|deps|node_modules|vendor|bower_components|dev/gae|dev/android|tmp|)$'
  \,'file': '\v\.(swp|jar|png|jpg|gif|tgz|gz|pdf|pyc)$'
  \ }

" Specific filetype
" Markdown
let g:vim_markdown_folding_disabled=1
au FileType mkd set shiftwidth=4 tabstop=4 wrap

" EJS
au FileType ejs set filetype=html

" golang
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_term_mode = "vsplit"

nnoremap <Leader>t :GoTestFunc<CR>

" Ruby shorthand
"
let g:netrw_bufsettings = 'noma nomod nu rnu nowrap ro nobl'
nnoremap ;r :! rubocop -a %<CR>
