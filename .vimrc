" Core
"  ====

 " Use Vim settings instead of Vi settings.
  set nocompatible

  filetype plugin indent on

  let mapleader=" "

" vim-plug
" ======

  " Setting up vim-plug
  if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  call plug#begin('~/.vim/plugged')

  " My Plugins
  Plug 'Lokaltog/vim-easymotion'
  " Plug 'garbas/vim-snipmate'
  "   Plug 'MarcWeber/vim-addon-mw-utils'
  "   Plug 'tomtom/tlib_vim'
  "   Plug 'honza/vim-snippets'
  Plug 'gcmt/wildfire.vim'
  " Plug 'junegunn/fzf'

  Plug 'kien/ctrlp.vim'
    let g:ctrlp_map = '<leader>f'
    nnoremap <leader>b :CtrlPBuffer<CR>
  Plug 'tpope/vim-commentary'
  Plug 'dense-analysis/ale'
    let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \  'go': ['gofmt'],
    \}
    let g:ale_fix_on_save = 1
  Plug 'mhinz/vim-signify'
    let g:signify_realtime = 1
  Plug 'francoiscabrol/ranger.vim'
    let g:ranger_map_keys = 0
    nnoremap <leader>d :Ranger<CR><CR>
  " Plug 'ervandew/supertab'
  Plug 'godlygeek/tabular'
  Plug 'vim-airline/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme='tomorrow'
  Plug 'tpope/vim-fugitive'
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
  Plug 'sheerun/vim-polyglot'
  Plug 'wincent/terminus'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Theme
  Plug 'morhetz/gruvbox'

  call plug#end()

  " Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Theme
" =========
"
    colorscheme gruvbox
    set background=dark

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
  set incsearch
  set ignorecase
  set smartcase
  set laststatus=2
  set foldmethod=indent
  set foldlevel=20
  set scrolloff=3

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
  nmap <leader>h :bprevious<CR>
  nmap H :bprevious<CR>
  nmap <leader>l :bnext<CR>
  nmap L :bnext<CR>

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

  " Fold to top level
  nmap <leader>ft :%foldc<cr>

  nnoremap <leader>x *``cgn

  " Fold max depth
  nmap <leader>fd2 :set fdn=2<cr> zM
  nmap <leader>fd3 :set fdn=3<cr> zM
  nmap <leader>fd4 :set fdn=4<cr> zM
  nmap <leader>fd5 :set fdn=5<cr> zM
  nmap <leader>fd6 :set fdn=6<cr> zM
  nmap <leader>fd7 :set fdn=7<cr> zM

  " Sudo write
  cnoremap w!! w !sudo tee % >/dev/null

  " Keep search matches in the center of the screen
  nnoremap n nzzzv
  nnoremap N Nzzzv

  " Un-highlight last search
  nnoremap <silent> <leader>hl :set hlsearch!<CR>

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
  set ttimeoutlen=10
