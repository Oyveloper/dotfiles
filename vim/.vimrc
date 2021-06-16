let mapleader = "\<Space>"

set timeoutlen=500

" Splitting
set splitbelow
set splitright
set tabstop=4
set number relativenumber
set nu rnu
set nohlsearch

nmap <leader>w <C-w>
nmap <leader>bk :q<CR>

set tabstop=2 shiftwidth=2 expandtab

" Marks
nmap - '




" Buffers
nmap <leader>bn :bNext<CR>
nmap <leader>bp :bPrev<CR>

nmap <tab> :tabn<CR>
nmap <S-tab> :tabp<CR>

nmap <leader>bb :buffers<CR>

nmap <leader>pi :PlugInstall<CR>
nmap <leader>pu :UpdateRemotePlugins<CR>

nmap <leader>vr :source ~/.vimrc<CR>
nmap <leader>ve :edit ~/.vimrc<CR>

nmap <leader>qq :qa<CR>

nmap gs :vsplit<CR>gd=gd

" Javascript
nmap <leader>jd O/**<CR>

" Easymotion
map <leader>ø <Plug>(easymotion-prefix)

" Indentation
" vnoremap L :action EditorIndentLineOrSelection<CR>
" vnoremap H :action EditorUnindentSelection<CR>
" vnoremap J :action MoveLineDown<CR>
" vnoremap K :action MoveLineUp<CR>
"
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

vnoremap > >gv
vnoremap < <gv

" Telescope
" nnoremap <leader>ff <cmd>Telescope find_files<cr>


call plug#begin('~/.vim/plugged')

Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'

" inside plug#begin:
" use normal easymotion when in vim mode
if (!exists('g:vscode'))

Plug 'easymotion/vim-easymotion'
endif

if (exists('g:vscode'))
Plug 'asvetliakov/vim-easymotion'
endif
" use vscode easymotion when in vscode mode

Plug 'liuchengxu/vim-which-key'

" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'gruvbox-community/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tpope/vim-surround'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

if !exists('g:vscode')

  "nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

  syntax on
  set expandtab
  set nowrap
  set smartcase
  set noswapfile
  set nobackup
  set undodir=~/.vim/undodir
  set incsearch
  set expandtab
  set tabstop=4
  set softtabstop=4

  " theme
  set background=dark
  colorscheme gruvbox

endif

" vscode specific
if exists('g:vscode')

  nnoremap <leader>ff <Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>
  nnoremap gs <Cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>
  nnoremap <leader>gg <Cmd>call VSCodeNotify('magit.status')<CR>


endif




