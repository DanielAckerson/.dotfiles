" Config for neovim setups

call plug#begin(join([$HOME, '/.local/share/nvim/plugged'], ''))
    so $HOME/.dotfiles/vim/common_plugins.vim
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " Plug 'Shougo/neoinclude.vim', { 'for': 'cpp' }
    Plug 'zchee/deoplete-clang', { 'for': 'cpp' }
    Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
    Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
    Plug 'chrisbra/csv.vim', { 'for': 'csv' }
    Plug 'udalov/kotlin-vim', { 'for': 'kt' }
    Plug 'stevearc/vim-arduino'
call plug#end()

so $HOME/.dotfiles/vim/common.vim

"""""""""""""""""
" => GENERAL <= "
"""""""""""""""""

set shada=!,'100,<0,s10,h

"""""""""""""""""""""""""
" => Plugin Settings <= "
"""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1

autocmd FileType java setlocal omnifunc=javacomplete#Complete
