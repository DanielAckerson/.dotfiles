so ~/.dotfiles/vim/common.vim

" Config for vim8 setups

" TODO: polish it (don't care atm bc neovim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required

if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
    
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neco-vim'
    Plug 'zchee/deoplete-clang'
    " Plug 'zchee/deoplete-zsh' zsh requires other things
    Plug 'fszymanski/deoplete-emoji'
    Plug 'KeyboardFire/vim-minisnip'
    Plug 'joereynolds/deoplete-minisnip'
else
    call plug#begin('~/.vim/plugged')
endif

    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-commentary'
    Plug 'kien/ctrlp.vim'
    Plug 'scrooloose/syntastic'
    Plug 'scrooloose/nerdtree'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'tommcdo/vim-exchange'
    Plug 'majutsushi/tagbar'
    Plug 'scrooloose/nerdcommenter'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'qpkorr/vim-bufkill'
    "Plug 'SirVer/ultisnips'
call plug#end()

filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Update vim whenever vimrc is edited and saved
" augroup myvimrc
" 	au!
" 	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
" augroup END


set ttyfast

" Set to auto read when a file is changed from the outside
set autoread 


" Set 7 lines to the cursor - when moving vertically using j/k
" set so=7

" Turn on the WiLd menu
set wildmenu 

" Configure backspace so it acts as it should act
set backspace=indent,eol,start 

" Highlight search results
set hlsearch 

" Makes search act like search in modern browsers
set incsearch 

" Be smart when using tabs ;)
set smarttab

set autoindent "Auto indent 
