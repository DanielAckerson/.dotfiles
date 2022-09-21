" For plug.vim declarations only; source this file within scope of plug#begin and plug#end

" Plugins I use in both vim and neovim.

" motions and objects
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tommcdo/vim-exchange'

" UI
Plug 'christoomey/vim-tmux-navigator'
Plug 'kien/ctrlp.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" code
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'dense-analysis/ale', { 'for': ['python', 'rust'] }
Plug 'vhdirk/vim-cmake', { 'for': 'cmake' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" fixes
Plug 'tmux-plugins/vim-tmux-focus-events'

" unused
" Plug 'majutsushi/tagbar'
