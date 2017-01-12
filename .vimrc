set nocompatible              " be iMproved, required
filetype off                  " required
" set encoding=utf-8
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ruby/vim-ruby'
Plugin 'elixir-lang/vim-elixir'
Plugin 'tpope/vim-bundler'

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
" enable backspace button
set backspace=indent,eol,start
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

" Execute current file
noremap <F9> :!%:p<CR>
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

" Vim airline bar
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
