" Pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set nocompatible

" Reload vimrc after write
autocmd! bufwritepost .vimrc source %

let mapleader = ","
nmap ; :

" Basic {{{
set encoding=utf-8
set modelines=0
set autoindent
set showmode
set showcmd
set hidden
set ttyfast
set ruler
set backspace=indent,eol,start
set nonumber
set norelativenumber
set laststatus=2
set history=1000
set undofile
set undoreload=10000
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set shell=/bin/bash\ --login
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set fillchars=diff:⣿,vert:│
set autowrite
set autoread
set shiftround
set title
set dictionary=/usr/share/dict/words
set number

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

syntax on
filetype on
filetype plugin indent on

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" }}}

" Backups {{{
set backup                        " enable backups
set noswapfile                    " It's 2012, Vim.

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
" }}}

" Folding {{{
set foldmethod=marker
set foldmarker={{{,}}}
nnoremap <space> za
" }}}

" Color scheme
set t_Co=16
set background=dark
colorscheme solarized 

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.
set cursorline
" }}}

" Line Return {{{
" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
" }}}

" Copy/paste
set pastetoggle=<f2>
set clipboard=unnamed

" Block indent
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" Searching {{{
set hlsearch
set incsearch
set ignorecase
set smartcase
" }}}

" Buffers {{{
map <leader>v <c-w>v
map <leader>h <c-w>s

map <leader>q <c-w>q

map <leader>1 :bp<cr>
map <leader>2 :bn<cr>
map <leader>d :bd<cr>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

map <c-n> :bp<cr>
map <c-m> :bn<cr>
" }}}

" Delete to end of line
nnoremap D d$

" Gundo
map <leader>g :GundoToggle<CR>

" Supertab
let g:SuperTabMappingTabLiteral='<tab>'
imap <nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-p>")<cr>

" Java
augroup java
	autocmd Filetype java setlocal omnifunc=javacomplete#Complete 
augroup END

" Python

" Pep8
let g:pep8_map='<leader>8'

" Tab completion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

set completeopt=menuone,longest,preview

" Ropevim
map <leader>j :RopeGotoDefinition<cr>
map <leader>r :RopeRename<cr>
" Ack
nmap <leader>a <Esc>:Ack!
