" Some basics:
syntax on
set encoding=utf-8
set autoindent
set shiftwidth=4
set tabstop=4
set ignorecase
set smartcase

" hybrid line numbers
set number relativenumber
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,WinEnter,InsertLeave 	* if mode() != "i" | set relativenumber | endif
	autocmd BufLeave,FocusLost,WinLeave,InsertEnter 	* set norelativenumber
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

" Spell check toggle
map <C-s> :setlocal spell!<cr>

" Plugins
call plug#begin()

" Git wrapper
Plug 'tpope/vim-fugitive'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Lint/fmt/LSP client
Plug 'dense-analysis/ale'

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

" Error/Warning navigation
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Autcomplete
set splitbelow
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

" Debug
packadd termdebug

" Status bar
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#ale#enabled = 1
"let g:airline#extensions#tabline#enabled = 1
