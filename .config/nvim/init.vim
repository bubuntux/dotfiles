" Some basics:
set nocompatible
syntax on
set autoindent
set encoding=utf-8
set number
set relativenumber

" Break the habit of using arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" X 
set clipboard=unnamedplus

" ; as :
nnoremap ; :

" Ctrl+c and Ctrl+k as Esc
nnoremap <C-k> <Esc>
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <Esc>
onoremap <C-k> <Esc>
lnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>

nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
snoremap <C-c> <Esc>
xnoremap <C-c> <Esc>
cnoremap <C-c> <Esc>
onoremap <C-c> <Esc>
lnoremap <C-c> <Esc>
tnoremap <C-c> <Esc>

" Ctrl+h to stop searching
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" Jump to start and end of line using the home row keys
map H ^
map L $

" Plugins
call plug#begin()

Plug 'vim-scripts/Conque-GDB'

Plug 'dense-analysis/ale'

Plug 'rust-lang/rust.vim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'buoto/gotests-vim'

call plug#end()

" Ale
let g:ale_fix_on_save = 1
let g:ale_rust_cargo_use_clippy = 1

" Rust
let g:rustfmt_autosave = 1

