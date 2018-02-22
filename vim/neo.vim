so $HOME/.dotfiles/vim/common.vim

" Config for neovim setups

call plug#begin(join([$HOME, '/.local/share/nvim/plugged'], ''))
    " Plug 'KeyboardFire/vim-minisnip'
    " Plug 'fszymanski/deoplete-emoji'
    " Plug 'joereynolds/deoplete-minisnip'
    " Plug 'zchee/deoplete-zsh' zsh requires other things
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/deoplete.nvim', { 'tag': '4.0-serial', 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neco-vim'
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
    Plug 'zchee/deoplete-clang'
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
