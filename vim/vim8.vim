so $HOME/.dotfiles/vim/common.vim

" Config for vim8 setups

" TODO: polish it (don't care atm bc neovim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required

call plug#begin(join([$HOME, '/.vim/plugged'], ''))
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'kien/ctrlp.vim'
    Plug 'majutsushi/tagbar'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'qpkorr/vim-bufkill'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/syntastic'
    Plug 'tommcdo/vim-exchange'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDTreeQuitOnOpen=1
nmap <silent> <leader><leader> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='<SPACE>'

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall'

let g:syntastic_asm_compiler = 'nasm'
let g:syntastic_asm_compiler_options = '-f elf'

let g:deoplete#enable_at_startup = 1
