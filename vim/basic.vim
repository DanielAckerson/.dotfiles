" basic vim configuration
" no external plugins
" source this file by itself

syntax enable
set background=dark
colorscheme ron

let mapleader = ","
let g:mapleader = ","

set cmdheight=2 laststatus=2
set number ruler
set showmatch matchtime=2
set showtabline=2
set statusline=%<%f%h%m%r%=%-14.(%l,%c%V%)\ %P:%L

set hidden
set history=300
set mouse=
set switchbuf=useopen,usetab,newtab
set virtualedit=onemore
set whichwrap+=<,>,h,l

set encoding=utf8
set fileformats=unix,dos,mac

set magic
set path+=**
set wildmenu
set wildignore=*.o,*~,*.pyc
set incsearch
set hlsearch

set timeoutlen=500
set updatetime=1000
set lazyredraw

set autoindent smartindent linebreak wrap
set backspace=indent,eol,start 
set expandtab smarttab shiftwidth=4 tabstop=4
set ignorecase smartcase

set ttyfast
set noerrorbells

map <silent> <leader><cr> :noh<cr>
map <silent> <leader>h :call WinMove('h')<cr>
map <silent> <leader>j :call WinMove('j')<cr>
map <silent> <leader>k :call WinMove('k')<cr>
map <silent> <leader>l :call WinMove('l')<cr>
nmap <leader>cd :cd %:p:h<cr>:pwd<cr>
nmap <leader>tc :tabclose<cr>
nmap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
nmap <leader>tm :tabmove
nmap <leader>tn :tabnew<cr>
nmap <leader>to :tabonly<cr>
nmap <leader>w :w!<cr>
nmap <silent> <leader>vr :e $MYVIMRC<cr>
nnoremap gb :ls<cr>:b<space>
nnoremap gl :ls<cr>
nnoremap gn :bn<cr>
nnoremap gp :bp<cr>
noremap j gj
noremap k gk
nnoremap <c-e> <c-e>gj
nnoremap <c-y> <c-y>gk

function! WinMove(key)
    let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr())
		if (match(a:key,'[jk]'))
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction
