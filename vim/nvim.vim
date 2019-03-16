so $HOME/.dotfiles/vim/common.vim

" Config for neovim setups

call plug#begin(join([$HOME, '/.local/share/nvim/plugged'], ''))
    so $HOME/.dotfiles/vim/common_plugins.vim
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDTreeQuitOnOpen=1
nmap <silent> <leader><leader> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='<SPACE>'

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++17 -Wall'
let g:syntastic_cpp_include_dirs = ['../deps', 'deps']
let g:syntastic_c_include_dirs = ['../deps', 'deps']

let g:syntastic_asm_compiler = 'nasm'
let g:syntastic_asm_compiler_options = '-f elf'

let g:deoplete#enable_at_startup = 1

" let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_checkers = []
" let g:syntastic_pylint_args = '--error-only'
