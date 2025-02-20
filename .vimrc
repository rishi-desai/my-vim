" SET COMMANDS ------------------------------------------------------------------------------- {{{

set nocompatible
set number
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set incsearch
set nowrap
set ignorecase
set smartcase
set mouse=a
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
set wildmenu
set wildmode=longest:list,full
set wildignore=*.docx,*.pdf,*.exe,*.pyc
set cursorline
set cursorcolumn
set background=dark
set ruler
set scrolljump=5
set scrolloff=3



" }}}

" FILETYPE COMMANDS -------------------------------------------------------------------------- {{{

filetype on
filetype plugin on
filetype indent on

" }}}

" VISUAL COMMANDS ---------------------------------------------------------------------------- {{{

syntax on

set guioptions-=T
set guioptions-=L
set guioptions-=r
set guioptions-=m
set guioptions-=b

" }}}

" MAPPINGS ----------------------------------------------------------------------------------- {{{

" Set the backslash as the leader key
let mapleader = '\'

" Press \\ to jump back to the last cursor position
nnoremap <leader>\ ``

" Type jj to exit insert mode quickly
inoremap jj <Esc><space>

" Press the space bar to type the : character in command mode
nnoremap <space> :

" Pressing the letter o will open a new line below the current one
" Exit insert mode after creating a new line above or below the current line
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line
nnoremap Y y$

" You can split the window in VIm by typing :split or :vsplit
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" }}}

" PLUGINS --------------------------------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

    Plug 'townk/vim-autoclose'
    Plug 'joshdick/onedark.vim'

call plug#end()

" }}}

" VIMSCRIPT ------------------------------- {{{

" Enable the marker method of folding
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Load onedark color scheme if it exists
if filereadable(expand("~/.vim/plugged/onedark.vim/colors/onedark.vim"))
    colorscheme onedark
endif

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" }}}
