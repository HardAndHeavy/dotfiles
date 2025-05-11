" hardandheavy{{
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set breakindent
set number
set numberwidth=2

call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-sensible'
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'dyng/ctrlsf.vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-spectre'
  Plug 'rebelot/kanagawa.nvim'
call plug#end()

colorscheme kanagawa

let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

map <silent> <leader><leader> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeFind<CR>

map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

nmap <leader>fr <Plug>CtrlSFPrompt

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

vmap cc :norm i#<CR>
vmap uc :norm ^x<CR>
" }}hardandheavy
