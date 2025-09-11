"true" ; set -e
"true" ; echo "Installing vim-plug ..."
"true" ; [ ! -f ~/.vim/autoload/plug.vim ] && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"true" ; echo "Running PlugInstall ..."
"true" ; \vim +"PlugInstall --sync"  +qall
"true" ; echo "Finished installing vim-plug plugins."
"true" ; set +e && exit 0

" Base options
set nocompatible			" be iMproved, required
set modeline					" read 5 first/last lines looking for modelines
set syntax=on					" highlight syntax
set filetype=on
set laststatus=2
set relativenumber

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
let g:airline_theme = 'base16_spacemacs' " alternatives: biogoo, powerlineish, distinguished, zenburn

" Auto-install
if empty(glob('~/.vim/autoload/plug.vim'))
	echom "vim-plug not installed! run this command to install it automatically:"	
	echom "    bash .vimrc"
	echom " "
	finish
endif

let b:vim_plugged_path = '~/.vim/plugged/'
if empty(glob(b:vim_plugged_path))
  let g:no_vim_plugins_installed = 1
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()

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

	" Language packs
	Plug 'sheerun/vim-polyglot'

	" Theme
	Plug 'ghifarit53/tokyonight-vim'

call plug#end()


if exists('g:no_vim_plugins_installed')
	echo "no vim plugins installed yet... skipping user config."
	finish
endif

" fix for random characters appearing 
" ( somehow related to the devicons plugin )
" https://github.com/ryanoasis/vim-devicons/issues/266
set t_RV=

" Theming
set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" vim : ft=vim syntax=on nowrap
