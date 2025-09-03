" Set highlight on the searched term
set hlsearch

" Set history to 500 lines
set history=500

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

" When searching try to be smart about cases
set smartcase

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell

" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Colorscheme
set background=dark

" Credits to https://github.com/amix/vimrc
