" Config for neovim setups

call plug#begin(join([$HOME, '/.local/share/nvim/plugged'], ''))
    so $HOME/.dotfiles/vim/common_plugins.vim
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
    Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
    Plug 'chrisbra/csv.vim', { 'for': 'csv' }
call plug#end()

so $HOME/.dotfiles/vim/common.vim

" set diffopt=filler,internal,algorithm:histogram,indent-heuristic

set inccommand=nosplit

"""""""""""""""""
" => GENERAL <= "
"""""""""""""""""

set shada=!,'100,<0,s10,h

"""""""""""""""""""""""""
" => Plugin Settings <= "
"""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1

autocmd FileType java setlocal omnifunc=javacomplete#Complete

let g:fugitive_gitlab_domains = {'ssh://gitlab.optotraffic.local': 'http://gitlab.optotraffic.local/ai/'}

" disable this when using deoplete-jedi
let g:jedi#completions_enabled = 0
