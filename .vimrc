" Core
"  ====

 " Use Vim settings instead of Vi settings.
  set nocompatible

  filetype plugin indent on

  "let mapleader=","
  let mapleader=" "

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
  Plugin 'gmarik/vundle'

  " My Plugins

  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'garbas/vim-snipmate'
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'tomtom/tlib_vim'
    Plugin 'honza/vim-snippets'
  Plugin 'gcmt/wildfire.vim'
  " Plugin 'junegunn/fzf'

  Plugin 'kien/ctrlp.vim'
    let g:ctrlp_map = '<leader>f'
    nnoremap <leader>b :CtrlPBuffer<CR>
  Plugin 'tpope/vim-commentary'
  Plugin 'w0rp/ale'
  Plugin 'mhinz/vim-signify'
    let g:signify_realtime = 1
  Plugin 'francoiscabrol/ranger.vim'
    let g:ranger_map_keys = 0
    nnoremap <leader>d :Ranger<CR><CR>
  Plugin 'ervandew/supertab'
  Plugin 'godlygeek/tabular'
  Plugin 'vim-airline/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    Plugin 'vim-airline/vim-airline-themes'
    let g:airline_theme='tomorrow'
  Plugin 'tpope/vim-fugitive'
    nnoremap <leader>ga :Git add %:p<CR><CR>
    nnoremap <leader>gs :Gstatus<CR>
    nnoremap <leader>gc :Gcommit<cr>
    nnoremap <Leader>gb :Gblame<CR>
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>ge :Gedit<CR>
    nnoremap <leader>gr :Gread<CR>
    nnoremap <leader>gw :Gwrite<CR><CR>
    nnoremap <leader>gp :Ggrep<Space>
    nnoremap <leader>gm :Gmove<Space>
    nnoremap <leader>gq :Git branch<Space>
    nnoremap <leader>go :Git checkout<Space>
  Plugin 'sheerun/vim-polyglot'
  Plugin 'wincent/terminus'

  " Colors
  Plugin 'morhetz/gruvbox'
    set background=dark
    colorscheme gruvbox

" FileTypes
" =========

  autocmd! BufEnter *.pp set filetype=puppet
  autocmd! BufEnter *.sls set filetype=sls

" Vim Settings
" ============

  syntax enable

  set cursorline
  set expandtab
  set modelines=0
  set shiftwidth=2
  set clipboard=unnamed
  set synmaxcol=512
  set ttyscroll=10
  set encoding=utf-8
  set tabstop=2
  set nowrap
  set number
  set nowritebackup
  set noswapfile
  set nobackup
  set hlsearch
  set ignorecase
  set smartcase
  set laststatus=2
  set foldmethod=indent
  set foldlevel=20
  " set clipboard=unnamedplus

  " Highlight Trailing Whitespace
  highlight ExtraWhitespace ctermbg=darkblue guibg=darkblue
  match ExtraWhitespace /\s\+$/

  " Persistent Undo
  if v:version >= 703
      set undofile
      set undodir=~/.vim/tmp,~/.tmp,~/tmp,~/var/tmp,/tmp
  endif

  " No show command
  autocmd VimEnter * set nosc

  " Toggle Paste/No Paste
  nnoremap <leader>p :set paste!<CR>

  " Fix backspace on mac
  set backspace=indent,eol,start

  " Quick ESC
  imap jj <ESC>

  " Jump to the next row on long lines
  " nnoremap j gj
  " nnoremap k gk
  nnoremap <expr> j v:count ? 'j' : 'gj'
  nnoremap <expr> k v:count ? 'k' : 'gk'

  " Page Up/Down
  noremap J <C-F>
  noremap K <C-B>

  " Move between buffer
  nmap <leader>l :bnext<CR>
  nmap L :bprevious<CR>
  nmap <leader>h :bnext<CR>
  nmap H :bprevious<CR>

  " Open new buffers
  nmap <leader>sh :leftabove  vnew<cr>
  nmap <leader>sl :rightbelow vnew<cr>
  nmap <leader>sk :leftabove  new<cr>
  nmap <leader>sj :rightbelow new<cr>

  " Redefine split navigations
  nnoremap <C-J> <C-W><C-J>| " Use Ctrl+j to move down in split mode
  nnoremap <C-K> <C-W><C-K>| " Use Ctrl+k to move up in split mode
  nnoremap <C-L> <C-W><C-L>| " Use Ctrl+l to move right in split mode
  nnoremap <C-H> <C-W><C-H>| " Use Ctrl+h to move left in split mode

  " To open a new empty buffer
  nmap <leader>t :enew<cr>

  " Close the current buffer
  nmap <leader>q :bd <CR>
  nmap <leader><leader>q :bd! <CR>

  " Resize buffers
  if bufwinnr(1)
    nmap µ <C-W><<C-W><
    nmap ∆ <C-W>><C-W>>
    nmap Ô <C-W>-<C-W>-
    nmap Â <C-W>+<C-W>+
  endif

  " Tab between buffers
  noremap <tab> <c-w><c-w>

  " format the entire file
  nmap <leader>fef ggVG=

  " Remove trailing whitespace
  nmap <leader>w :%s/\s\+$//e<cr>

  " Sudo write
  cnoremap w!! w !sudo tee % >/dev/null

  " Keep search matches in the center of the screen
  nnoremap n nzzzv
  nnoremap N Nzzzv

  " Un-highlight last search
  nnoremap <silent> <leader>hl :set hlsearch!

  " Toggle showing numbers
  nmap <leader><leader>n :set nu!<CR>

  " Disable Q (Command Shell Mode)
  nnoremap Q <nop>

  " Quit with :Q
  command -nargs=0 Quit :qa!

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
