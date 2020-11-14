let mapleader = "\<Space>"

nmap <leader>w <C-w>
nmap <leader>bk :q<CR>

syntax on 
set tabstop=4 softtabstop=4
set expandtab
set nu 
set nowrap 
set smartcase
set noswapfile 
set nobackup
set undodir=~/.vim/undodir
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'

call plug#end()

set background=dark

