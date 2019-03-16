so $HOME/.dotfiles/vim/common.vim

" Config for vim8 setups

" TODO: polish it (don't care atm bc neovim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required

call plug#begin(join([$HOME, '/.vim/plugged'], ''))
    so $HOME/.dotfiles/vim/common_plugins.vim
call plug#end()

filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ttyfast

" Set to auto read when a file is changed from the outside
set autoread 

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
