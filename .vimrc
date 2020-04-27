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
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
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
Plugin 'tpope/vim-surround'
Plugin 'skalnik/vim-vroom'
Plugin 'dense-analysis/ale'
Plugin 'junegunn/fzf.vim'
Plugin 'vim-scripts/Greplace.vim'
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
Plugin 'terryma/vim-smooth-scroll'

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
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'ianks/vim-tsx'

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
" Files search fzf
"

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
let $FZF_DEFAULT_COMMAND='ag -l --hidden --ignore .git --nocolor -g ""'

set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
"nnoremap <C-p> :Files<CR>
nnoremap <C-p> :call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>
"Use fzf for search results window:
nnoremap <C-n> :Buffers<CR>
"let g:fzf_layout = { 'right': '~30%' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9, 'border': 'round' } }
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
let mapleader=";"
inoremap jj <Esc>
imap <Leader>w <Esc>:w<CR>
nmap <Leader>w <Esc>:w<CR>
nnoremap K i<Enter><Esc>
inoremap <Leader>p <Esc>Pi
nnoremap <Leader>k i<Enter><Esc>

" Sometimes "+y works
noremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>% :let @+ = expand("%")<CR>
nnoremap <Leader>m :Gmove <C-r>=expand('%')<cr>

noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

"autocomplete
inoremap <tab> <C-n>

" Close file
noremap <Leader>q :q<CR>
noremap <Leader>;d :bd<CR>
noremap <leader>f :tab sp<CR>

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
"noremap <Leader>d :bunload<CR>

" ag.vim quick search
" See https://github.com/rking/ag.vim (looks like there's a successor ack.vim, but i haven't set that up)
nnoremap <Leader>/ :Ag! <cword><CR>
nnoremap <Leader>a :Ag!<Space>
nnoremap <Leader>z :cclose<CR>
nnoremap z] :cnext<CR>
nnoremap z[ :cprev<CR>
nnoremap zz :cc!<CR>
nnoremap <Leader>x :copen<CR>
" Don't use mappings from ag.vim, because we'll define them in .vim/ftplugin/qf.vim
let g:ag_apply_qmappings = 0


" search and replace
nnoremap <Leader>? :%s/<C-R><C-W>//g<left><left>
vnoremap <Leader>/ <Esc>:%s/\%V
nnoremap <Leader><Space> :set foldlevel=

" easymotion

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)'

" git map
nnoremap <Leader>g :Gstatus<CR>
nnoremap <Leader>G :Gedit .git/index<CR>
nnoremap <Leader>d :Gvdiff<CR>
nnoremap <silent> <Leader>l :Glog<CR>:copen<CR><C-w>J
nnoremap dp :diffput<CR>
nnoremap <expr> dg &diff ? ':diffget<CR>' : 'dg'

nmap <Leader>o o<Esc>k

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" Toggle
map <F3> :set number!<CR>:set rnu!<CR>
map <F5>  :set wrap!<CR>
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
nnoremap z; za

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

function! CheckQuickFixListError()
  if filereadable('tmp/.quickfix_list')
    :cf tmp/.quickfix_list | :copen
  else
    echo "No errors!"
  endif
endfunction
nnoremap <Leader>re :call CheckQuickFixListError()<CR>

nnoremap ø xep

let g:VimuxRunnerType = "window"
let g:AutoPairsShortcutFastWrap = 'ø'
let g:nremap = {"m": ""}
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \   'typescript': ['eslint'],
      \   'python': ['autopep8'],
      \   'ruby': ['rubocop'],
      \   'json': ['prettier'],
      \   'yml': ['prettier'],
      \   'yaml': ['prettier'],
      \}
map <Leader>fos :let b:ale_fix_on_save=

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
