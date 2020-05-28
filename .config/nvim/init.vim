" Some basics:
set nocompatible
syntax on
set encoding=utf-8
set autoindent
set shiftwidth=4
set tabstop=4

" hybrid line numbers
set number relativenumber
augroup numbertoggle
    autocmd!
	autocmd BufEnter,InsertLeave * set relativenumber
	autocmd BufLeave,InsertEnter * set norelativenumber
augroup END

" Break the habit of using arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" X
set clipboard=unnamedplus

" ; as :
nnoremap ; :

" Ctrl+c as Esc
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
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
"Plug 'vim-scripts/Conque-GDB'
Plug 'dense-analysis/ale'
call plug#end()

" Ale configs
let g:ale_linters = {
\	'rust': ['analyzer', 'cargo'],
\}
let g:ale_rust_cargo_use_clippy = 1

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\	'*': 	['remove_trailing_lines', 'trim_whitespace'],
\	'sh': 	['shfmt'],
\	'rust': ['rustfmt'],
\}

let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
set completeopt=menu,menuone,preview,noselect,noinsert
set splitbelow

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:airline#extensions#ale#enabled = 1

" Airline
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
"let g:airline#extensions#tabline#enabled = 1
