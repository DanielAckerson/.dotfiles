" Config for vim8 setups

set nocompatible

call plug#begin(join([$HOME, '/.vim/plugged'], ''))
    so $HOME/.dotfiles/vim/common_plugins.vim
call plug#end()

filetype plugin indent on

"""""""""""""""""
" => GENERAL <= "
"""""""""""""""""

set ttyfast
set noerrorbells
set autoread
set viminfo^=!

set wildmenu
set hlsearch
set incsearch
set laststatus=2

set backspace=indent,eol,start
set smarttab
set autoindent
set wrap

"""""""""""""""""""""""
" => Source Common <= "
"""""""""""""""""""""""

so $HOME/.dotfiles/vim/common.vim
