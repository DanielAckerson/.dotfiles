so ~/.dotfiles/vim/common.vim

" Config for neovim setups

"TEMP
"
if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
    
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neco-vim'
    Plug 'zchee/deoplete-clang'
    " Plug 'zchee/deoplete-zsh' zsh requires other things
    Plug 'fszymanski/deoplete-emoji'
    " Plug 'KeyboardFire/vim-minisnip'
    " Plug 'joereynolds/deoplete-minisnip'
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
