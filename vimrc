" Get the defaults because those are pretty sweet
source $VIMRUNTIME/defaults.vim

filetype off " Maybe for plugins to work as expected? idk

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" Plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" Surround stuff plugin
Plugin 'tpope/vim-surround'

" Auto detect indentation and set params accordingly
Plugin 'tpope/vim-sleuth'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Discord RPC Plugin so that the whole world can see what cool projects I'm working on
" Plugin 'hugolgst/vimsence'

" Smooth scroll plugin
" Plugin 'terryma/vim-smooth-scroll'

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Plugin for cool status bar (Is it needed tho?)
" Plugin 'vim-airline/vim-airline'

call vundle#end()

filetype plugin indent on
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" let g:airline_powerline_fonts = 1 (Don't remember if this does work, probably yes with airline)

set pastetoggle=<F3>

" These felt like a big hinderance tbh
" nnoremap <Left>  :echoe "Stop being a n00b and use h"<CR>
" nnoremap <Right> :echoe "Stop being a n00b and use l"<CR>
" nnoremap <Up>    :echoe "Stop being a n00b and use k"<CR>
" nnoremap <Down>  :echoe "Stop being a n00b and use j"<CR>

" Clear search highlight
noremap  <F1>      :noh<CR>
inoremap <F1> <C-O>:noh<CR>

" Number toggle switch
nnoremap <F2> :set nonumber! norelativenumber!<CR>
set number
set relativenumber

" Smooth scroll stuff
" noremap <silent> <C-U> :call smooth_scroll#up(&scroll*2, 10, 2)<CR>
" noremap <silent> <C-D> :call smooth_scroll#down(&scroll*2, 10, 2)<CR>

" Wait for to make sure that esc is truly and esc keypress
set ttimeoutlen=0

" Case insentitive search (Use \C for sensitive match)
set ignorecase

" Search highlight
set hlsearch
set incsearch

" Change near invisible bracket highlight color to something more reasonable
" (Use if tmux+vim-airline)
" hi MatchParen cterm=none ctermbg=none ctermfg=red

" vim-airline already shows the mode, no need to show it again
" set noshowmode

if has('persistent_undo')      " check if your vim version supports it
  set undofile                 " turn on the feature  
  set undodir=$HOME/.vim/undo  " directory where the undo files will be stored
endif

" Tab char, trailing space
set list
set listchars=trail:·,tab:▸-

" Indentation stuff (sleuth plugin above overrides these)
set tabstop=4
set shiftwidth=4
set ai

" I don't like deleted chars getting into registers
noremap x "_x
