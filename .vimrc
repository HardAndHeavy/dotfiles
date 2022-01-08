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
call plug#end()

let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

map <silent> <leader><leader> :NERDTreeToggle<CR>
map <C-n> :NERDTreeFind<CR>

map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

nmap <leader>fr <Plug>CtrlSFPrompt
" }}hardandheavy
