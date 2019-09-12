" Make sure we have autoload so stuff don't break.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Make clipboard global.
set clipboard+=unnamedplus

" Set how many lines of history to remember.
set history=10

" Enable filetype plugins.
filetype plugin on
filetype indent on

" Auto read when a file is changed externally.
set autoread

" Set # lines below cursor to scroll.
set so=7

" Save file (when encountering permission-denied).
command W w !sudo tee % > /dev/null

" Turn on the Wild menu.
set wildmenu
set wildmode=longest:full,full

" Command line height.
set cmdheight=2

" Use relative number lines.
set relativenumber

" Always show current position.
set ruler

" Make a buffer hidden when abandoned.
set hid

" Highlight search results.
set hlsearch

" Be smart about cases when searching.
set smartcase

" Cool searching functionalities.
set incsearch

" Don't redraw while executing macros.
set lazyredraw

" Enable regexp support.
set magic

" Show matching brackets when text indicator is over them.
set showmatch
" Tenths of a second to blink when matching brackets.
set mat=3

" Disable sound on errors.
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add extra margin to the left side.
set foldcolumn=1

" Enable syntax highlighting.
syntax enable

" Set utf8 as standard encoding.
set encoding=utf8
" Set Unix as standard file type.
set ffs=unix

" Turn swap/backup off.
set nobackup
set nowb
set noswapfile

" Be smart about tabs.
set smarttab

" tab = 4 spaces.
set shiftwidth=4
set tabstop=4

" Be smart about indent.
set si

" Wrap lines.
set wrap

" Search for current selection.
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Return to last edit position when opening files.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Highlight characters past 79.
:au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>78v.\+', -1)

" Move between windows.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map 0 ^
map <space> @@
map <c-space> /

" .cls files are LaTeX.
autocmd BufRead,BufNewFile   *.cls setlocal syntax=tex
" .scm files are Scheme.
autocmd BufRead,BufNewFile   *.scm setlocal syntax=scheme

" Be smart about lisps
autocmd BufRead,BufNewFile   *.clj setlocal lisp
autocmd BufRead,BufNewFile   *.scm setlocal lisp

" Plugins.
" Initialize plug.
call plug#begin('~/.local/share/nvim/plugged')

" you can find the supported files in
" ls /usr/share/vim/vim81/ftplugin/
Plug 'tpope/vim-surround'
Plug 'junegunn/rainbow_parentheses.vim', { 'for': ['clojure', 'scheme'] }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': ['clojure', 'scheme'] }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': ['clojure', 'scheme'] }
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }
Plug 'Olical/vim-scheme', { 'for': 'scheme', 'on': 'SchemeConnect' }
Plug 'ntk148v/vim-horizon'
Plug 'elmcast/elm-vim' "TODO: elm not supported so no { 'for': }
Plug 'dense-analysis/ale'
Plug 'elixir-editors/vim-elixir' "TODO: elixir not supported so no { 'for': }
Plug 'mhinz/vim-mix-format' "TODO: elixir not supported so no { 'for': }


" Initialize plug system.
call plug#end()

" Set dark background.
"set background=dark
" Set terminal colors.
set termguicolors
" Set 'horizon' colorscheme.
colo horizon
