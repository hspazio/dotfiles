set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'elixir-lang/vim-elixir'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
"
execute pathogen#infect()
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'scwood/vim-hybrid'
call plug#end()

syntax on
set background=dark
colorscheme hybrid

set number
set ruler
" Highlight current line
set cursorline
" Define tab size
set tabstop=2
" Show invisible characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
" set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Don't show the intro message when starting vim
set shortmess=atI
" Show current mode
set showmode
" Show the partial command as it is being typed
set showcmd
" Show the file name in the title bar
set title
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif
" Set automatic commands
if has("autocmd")
				" Enable filetype detection
				filetype on
				" Treat json files as js
				autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
				" Treat md file as markdown
				autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

nmap :NT :NERDTree<CR>
nmap :r :!ruby %<CR>
nmap :ff :CtrlP<CR>

" Syntastic 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec = '~/.rbenv/shims/rubocop'
