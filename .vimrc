"  Core
"  ====

  " Use Vim settings instead of Vi settings.
  set nocompatible

  filetype plugin indent on

  let mapleader=","

" Vundle
" ======

  " Setting up Vundle - the vim plugin bundler
  let iCanHazVundle=1
  let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
  if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
  endif
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
  endif

  " Let Vundle manage Vundle
  Bundle 'gmarik/vundle'

  " My Bundles
  Bundle 'ervandew/supertab'
  Bundle 'kien/ctrlp.vim'
  Bundle 'Lokaltog/vim-easymotion'
  Bundle 'Lokaltog/vim-powerline'
  Bundle 'garbas/vim-snipmate'
    Bundle 'MarcWeber/vim-addon-mw-utils'
    Bundle 'tomtom/tlib_vim'
    Bundle 'honza/vim-snippets'
  Bundle 'nanotech/jellybeans.vim'
    color jellybeans
  Bundle 'godlygeek/tabular'
  Bundle 'scrooloose/nerdcommenter'
  Bundle 'scrooloose/nerdtree'
  Bundle 'scrooloose/syntastic'
  Bundle 'tpope/vim-fugitive'

  " Syntax
  Bundle 'plasticboy/vim-markdown'
  Bundle 'puppetlabs/puppet-syntax-vim'
  Bundle 'saltstack/salt-vim'

" FileTypes
" =========

  autocmd! BufEnter *.pp set filetype=puppet

" Vim Settings
" ============

  syntax enable

  set cursorline
  set expandtab
  set modelines=0
  set shiftwidth=2
  set clipboard=unnamed
  set synmaxcol=128
  set ttyscroll=10
  set encoding=utf-8
  set tabstop=2
  set nowrap
  set number
  set expandtab
  set nowritebackup
  set noswapfile
  set nobackup
  set hlsearch
  set ignorecase
  set smartcase
  set laststatus=2

  " Highlight Trailing Whitespace
  highlight ExtraWhitespace ctermbg=darkblue guibg=darkblue
  match ExtraWhitespace /\s\+$/

  " Persistent Undo
  if v:version >= 703
      set undofile
      set undodir=~/.vim/tmp,~/.tmp,~/tmp,~/var/tmp,/tmp
  endif

  " Automatic formatting
  autocmd BufWritePre *.rb :%s/\s\+$//e
  autocmd BufWritePre *.go :%s/\s\+$//e
  autocmd BufWritePre *.haml :%s/\s\+$//e
  autocmd BufWritePre *.html :%s/\s\+$//e
  autocmd BufWritePre *.scss :%s/\s\+$//e
  autocmd BufWritePre *.slim :%s/\s\+$//e
  au BufNewFile * set noeol
  au BufRead,BufNewFile *.go set filetype=go

  " No show command
  autocmd VimEnter * set nosc

  " Toggle Paste/No Paste
  nnoremap <leader>p :set paste!<CR>

  " Quick ESC
  imap jj <ESC>

  " Jump to the next row on long lines
  map <Down> gj
  map <Up>   gk
  nnoremap j gj
  nnoremap k gk

  " format the entire file
  nmap <leader>fef ggVG=

  " Open new buffers
  nmap <leader>s<left>   :leftabove  vnew<cr>
  nmap <leader>s<right>  :rightbelow vnew<cr>
  nmap <leader>s<up>     :leftabove  new<cr>
  nmap <leader>s<down>   :rightbelow new<cr>

  " Tab between buffers
  noremap <tab> <c-w><c-w>

  " Switch between last two buffers
  nnoremap <leader><leader> <C-^>

  " Sudo write
  cnoremap w!! w !sudo tee % >/dev/null

  " Keep search matches in the center of the screen
  nnoremap n nzzzv
  nnoremap N Nzzzv

  " Resize buffers
  if bufwinnr(1)
    nmap Ä <C-W><<C-W><
    nmap Ö <C-W>><C-W>>
    nmap ö <C-W>-<C-W>-
    nmap ä <C-W>+<C-W>+
  endif

  " Disable Q (Command Shell Mode)
  nnoremap Q <nop>

  " Quit with :Q
  command -nargs=0 Quit :qa!

" Plugin Settings
" ===============

  " NERDTree
  nmap <leader>n :NERDTreeToggle<CR>
  let NERDTreeHighlightCursorline=1
  let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

  " Syntastic
  let g:syntastic_c_checkers=['make','splint']
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_always_populate_loc_list = 1
  "let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

  " CtrlP
  let g:ctrlp_working_path_mode = 2
  let g:ctrlp_by_filename = 1
  let g:ctrlp_max_files = 600
  let g:ctrlp_max_depth = 5

  " Numbers
  nmap <leader><leader>n :NumbersToggle<CR>


" Performance Optimization
" ========================

  " Fast terminal connections
  set ttyfast

  " Don't redraw when running macros
  set lazyredraw

  " Set timeout on keycodes but not mappings
  set notimeout
  set ttimeout
  set ttimeoutlen=10

  " Syntax optimazations
  "syntax sync minlines=256
  "set syntaxcol=256
