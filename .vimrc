"
"Vundle
"
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Functionality
Plugin 'jiangmiao/auto-pairs'
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
Plugin 'benmills/vimux-golang'
Plugin 'tpope/vim-dispatch'
Plugin 'skalnik/vim-vroom'
Plugin 'w0rp/ale'

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
filetype plugin on

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
imap ;w <Esc>:w<CR>
nmap ;w <Esc>:w<CR>
nnoremap K i<Enter><Esc>
inoremap ;p <Esc>pi
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
" Pane map
noremap <Leader>sp :vsp<CR>
noremap <Leader>st :vsp#<CR>
noremap <Leader>so :only<CR>
" Buffer map
"noremap <Leader>n :bunload<CR>

" ag.vim quick search
nnoremap <Leader>/ :Ag! <cword><CR>
nnoremap <Leader>a :Ag!<Space>
nnoremap <Leader>z :cclose<CR>
" Don't use mappings from ag.vim, because we'll define them in .vim/ftplugin/qf.vim
let g:ag_apply_qmappings = 0


" search and replace
nnoremap <Leader>? :%s/<C-R><C-W>//g<left><left>
vnoremap <Leader>/ <Esc>:%s/\%V

" easymotion

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)'

" Move to word
map  <Leader>m <Plug>(easymotion-bd-w)
nmap <Leader>m <Plug>(easymotion-overwin-w)

" git map
nnoremap <Leader>g :Gstatus<CR>
nnoremap <Leader>d :Gvdiff<CR>
nnoremap <silent> <Leader>l :Glog<CR>:copen<CR><C-w>J
nnoremap dp :diffput<CR>

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
let g:netrw_bufsettings = 'noma nomod nu rnu nowrap ro nobl'

" Vimux
"
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>

function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction
vmap <Leader>vs "vy:call VimuxSlime()<CR>
nmap <Leader>vs viw<Leader>vs<CR>
map <Leader>vr :VimuxRunCommand("")<left><left>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vtw :let g:VimuxRunnerType = "window"<CR>
map <Leader>vtp :let g:VimuxRunnerType = "pane"<CR>
map <Leader>vz :VimuxZoomRunner<CR>
map <Leader>vd :Dispatch<Space>
nnoremap ø xep

let g:AutoPairsShortcutFastWrap = 'ø'
let g:nremap = {"m": ""}
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_fixers = {
      \   'javascript': ['standard'],
      \   'python': ['autopep8'],
      \   'ruby': ['rubocop'],
      \}

