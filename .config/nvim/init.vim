" Some basics:
syntax on
set encoding=utf-8
set autoindent
set shiftwidth=4
set tabstop=4
set ignorecase
set smartcase
set number relativenumber

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

" Spell check toggle
map <C-s> :setlocal spell!<cr>

" Plugins
call plug#begin()

" Visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bubuntux/vim-numbertoggle'

" Coding
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'

call plug#end()

" Linters
let g:ale_linters = {
\	'rust': ['analyzer', 'cargo'],
\}
let g:ale_rust_cargo_use_clippy = 1

" Fixers/Fmt
nmap <C-l> <Plug>(ale_fix)
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\	'*': 	['remove_trailing_lines', 'trim_whitespace'],
\	'sh': 	['shfmt'],
\	'rust': ['rustfmt'],
\	'go':	['gofmt', 'goimports'],
\	'yaml': ['prettier'],
\}

" Easy aligns
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Error/Warning navigation
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Autcomplete
set splitbelow
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
set completeopt=menu,menuone,preview,noselect,noinsert

" Debug
augroup rust_debug
	autocmd!
	autocmd FileType rust	packadd termdebug			|
						\   let termdebugger='rust-gdb' |
augroup END

" Status bar
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
