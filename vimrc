set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

"Discord RPC Plugin so that the whole world can see what cool projects I'm working on
" Plugin 'ananagame/vimsence'
Plugin 'hugolgst/vimsence'

" Smooth scroll plugin
" Plugin 'terryma/vim-smooth-scroll'

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Plugin for cool status bar
Plugin 'vim-airline/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:airline_powerline_fonts = 1

set pastetoggle=<F3>

nnoremap <Left>  :echoe "Stop being a n00b and use h"<CR>
nnoremap <Right> :echoe "Stop being a n00b and use l"<CR>
nnoremap <Up>    :echoe "Stop being a n00b and use k"<CR>
nnoremap <Down>  :echoe "Stop being a n00b and use j"<CR>

" Clear search highlight
noremap <F1> :noh<CR>

" Number toggle switch
nnoremap <F2> :set nonumber! norelativenumber!<CR>
set number
set relativenumber

" Smooth scroll stuff
" noremap <silent> <C-U> :call smooth_scroll#up(&scroll*2, 10, 2)<CR>
" noremap <silent> <C-D> :call smooth_scroll#down(&scroll*2, 10, 2)<CR>

" Vim 8.2 doesn't have these enabled by default for some reason
syntax on
set backspace=indent,eol,start

" Gets rid of vim-airline bar mode update changes
set ttimeoutlen=0

" Search highlight
set hlsearch
set incsearch

" Change near invisible bracket highlight color to something more reasonable
hi MatchParen cterm=none ctermbg=none ctermfg=red

" vim-airline already shows the mode, no need to show it again
set noshowmode

if has('persistent_undo')      " check if your vim version supports it
  set undofile                 " turn on the feature  
  set undodir=$HOME/.vim/undo  " directory where the undo files will be stored
endif

" Tab char, trailing space
set list
set listchars=trail:·,tab:▸-

" Stuff
set tabstop=4
set shiftwidth=4
set ai
