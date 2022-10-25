" #############################################################################
" #    Personal conf                                                          #
" #############################################################################
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
set encoding=utf-8
source $VIMRUNTIME/macros/matchit.vim " % expansion
syntax enable    " syntax highlighting
set clipboard+=unnamed
set mouse=a

" Search management
set hlsearch    " highlight searches
set ignorecase    " \c and \C are not used for the character classes
set smartcase    " override the 'ignorecase' option if the search pattern contains upper casee characters.
set incsearch    " while typing a search command, show where the pattern, as it was typed so far, matches.

" Tabulation management
set tabstop=4
set shiftwidth=0
set expandtab    " use the appropriate number of spaces to insert a <Tab>
set autoindent
set smartindent
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.sql setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" Backup management
set backup
set swapfile
set noundofile
set updatetime=250
set updatecount=500
set backupdir=$XDG_CONFIG_HOME/nvim/backup
set directory=$XDG_CONFIG_HOME/nvim/tmp
set viminfo+=n$XDG_CONFIG_HOME/nvim/viminfo.txt

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

" #############################################################################
" #    Plugin                                                                 #
" #############################################################################

call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'goerz/jupytext.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'vim-jp/vimdoc-ja'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'thinca/vim-quickrun'

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
