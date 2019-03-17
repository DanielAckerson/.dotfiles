" Config for neovim setups

call plug#begin(join([$HOME, '/.local/share/nvim/plugged'], ''))
    so $HOME/.dotfiles/vim/common_plugins.vim
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

"""""""""""""""""
" => GENERAL <= "
"""""""""""""""""

set shada=!,'100,<0,s10,h

"""""""""""""""""""""""""
" => Plugin Settings <= "
"""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""
" => Source Common <= "
"""""""""""""""""""""""

so $HOME/.dotfiles/vim/common.vim
