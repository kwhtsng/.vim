" #####################
" ### Personal conf ###
" #####################

set number
set relativenumber
set cursorline
set scrolloff=5
set bs=2    " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more than 50 lines of registers
set history=10000    " keep 10000 lines of registers
set ruler    " show the cursor position all the time
set laststatus=2    " statusline
set statusline=%f
set showcmd    " show command in the last line of the screen
set wildmenu
set showmatch
set backspace=indent,eol,start
source $VIMRUNTIME/macros/matchit.vim " % expansion
syntax enable    " syntax highlighting

" Search management
set hlsearch    " highlight searches
set ignorecase    " \c and \C are not used for the character classes
set smartcase    " override the 'ignorecase' option if the search pattern contains upper casee characters.
set incsearch    " while typing a search command, show where the pattern, as it was typed so far, matches.

" Tabulation management
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab    " use the appropriate number of spaces to insert a <Tab>
set autoindent
set smartindent

" Backup management
set backup
set swapfile
set noundofile
set updatetime=250
set updatecount=500
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set viminfo+=n~/.vim/tmp/viminfo.txt

" Mapping
let mapleader = "\<Space>"
nnoremap ; :
nnoremap : ;
nnoremap j gj
nnoremap k gk
nnoremap <Esc><Esc> :nohl<CR>

" 80 column
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

" ##############
" ### Plugin ###
" ##############

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'goerz/jupytext.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'bronson/vim-trailing-whitespace'

call plug#end()

" Theme
set background=dark
colorscheme solarized

" Airline
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'

" Load _config
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
    return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! _config/*.vim
