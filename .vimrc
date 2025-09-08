" Base options
set nocompatible              " be iMproved, required
set modeline		      " read 5 first/last lines looking for modelines
set syntax=on                 " highlight syntax
set filetype=on
set laststatus=2

" Search down into subfolders
set path+=**
set wildignore+=/usr/include/**
set wildignore+=**/node_modules/**
set wildignore+=**/.cache/**

" The default for 'backspace' is very confusing to new users, so change it to a
" more sensible value.  Add "set backspace&" to your ~/.vimrc to reset it.
set backspace+=indent,eol,start

" Display all matching files when tabbing
set wildmenu

" Do not save backup files in the same directory as the file
set backupdir=.backup/,~/.backup/,/tmp//,/var/tmp//
set directory=.swp/,~/.swp/,/tmp//,/var/tmp//
set undodir=.undo/,~/.undo/,/tmp//,/var/tmp//

" Settings	

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish' " alternatives: biogoo, powerlineish, distinguished, zenburn

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('./plugged')

	" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

	Plug 'flazz/vim-colorschemes'

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" Text operations
	Plug 'jeanCarloMachado/vim-toop'

	" Special targets
	Plug 'wellle/targets.vim'
	
	" Distractionless environment
	Plug 'junegunn/goyo.vim'

	" Pretty icons
	Plug 'ryanoasis/vim-devicons'

	" Simple alias and basic :command substitution
	Plug 'Konfekt/vim-alias'

call plug#end()

" fix for random characters appearing 
" ( somehow related to the devicons plugin )
" https://github.com/ryanoasis/vim-devicons/issues/266
set t_RV=

" vim : ft=vim syntax=on nowrap
