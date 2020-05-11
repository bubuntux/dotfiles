" Some basics:
	set nocompatible
	syntax on
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

call plug#begin()

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'buoto/gotests-vim'

call plug#end()
