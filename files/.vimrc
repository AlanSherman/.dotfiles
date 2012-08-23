set nocompatible " Vim defaults, instead of vi

filetype plugin indent on
syntax on

set title
set ruler
set paste

set hlsearch
set incsearch
set ignorecase
set smartcase
set shiftwidth=4            " Tabs for auto indent
set tabstop=4               " Tabs for the tab character
set cindent                 " Indent like Ck
set autoindent              " Auto indent
set smartindent             " Intelligently
set cinkeys=0{,0},:,0#,!^F
set smarttab
set expandtab

" line numbers toggle
 nma <leader>n :set invnumber<CR>
" " wrapping toggle
 nma <leader>w :set wrap!<CR>
" " remove search highlights
 nma <leader>h :noh<CR>

