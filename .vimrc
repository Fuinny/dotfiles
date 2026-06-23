set nocompatible                        " Make Vim modern
set clipboard=unnamed                   " Use the OS clipboard
set backspace=indent,eol,start          " Allow backspace in insert mode
set esckeys                             " Allow cursor keys in insert mode
set mouse=a                             " Enable mouse support in all modes

set ttyfast                             " Optimize Vim for fast terminal connections
set lazyredraw                          " Don't redraw screen while executing macros

set encoding=utf-8                      " Use UTF-8 encoding
set nobomb                              " Do not use a Byte Order Mark (BOM)

set tabstop=4                           " Width of a tab character
set shiftwidth=4                        " Amount of whitespace to add in normal mode
set expandtab                           " Convert tabs to spaces
set smartindent                         " Enable smart auto-indenting

set number                              " Enable line numbers
set relativenumber                      " Enable relative line numbers

set gdefault                            " Enable g flag by default
set hlsearch                            " Highlight search results
set incsearch                           " Highlight search results dynamically
set ignorecase                          " Ignore case when searching...
set smartcase                           " ...unless a capital letter is typed

set ruler                               " Show cursor position
set scrolloff=5                         " Keep cursor vertically centered
syntax on                               " Enable syntax highlighting
set title                               " Show file name in title bar
set showmode                            " Show current Vim mode

set noerrorbells                        " Disable error bells

set exrc                                " Enable per-directory .vimrc files
set secure                              " Disable unsafe commands in those .vimrc files

set undofile                            " Enable undo file
set undodir=~/.vim/undo                 " Set undo file directory
set directory=~/.vim/swaps              " Set swap file directory
set backupdir=~/.vim/backups            " Set backup file directory
set viminfo+=n~/.vim/viminfo            " Set viminfo file

set backupskip=/tmp/*,/private/tmp/*    " Don’t create backups when editing files in these directories

let &t_SI = "\e[6 q"                    " Start Insert mode: Solid vertical bar (|)
let &t_EI = "\e[2 q"                    " End Insert mode (Normal mode): Solid block
let &t_SR = "\e[4 q"                    " Start Replace mode: Solid underline (_)

inoremap kj <Esc>
nnoremap <Leader>o o<Esc>o
nnoremap <Leader>O O<Esc>O
