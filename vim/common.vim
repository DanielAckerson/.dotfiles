" Common config for vim/neovim

""""""""""""""""""
" => Settings <= "
""""""""""""""""""

syntax enable
set background=dark
colorscheme ron

let mapleader = ","
let g:mapleader = ","

set cmdheight=2
set number relativenumber
set showmatch matchtime=2
set showtabline=2
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%{HasPaste()}\ %-14.(%l,%c%V%)\ %P:%L

set hidden
set history=700
set mouse=nv
set switchbuf=useopen,usetab,newtab
set virtualedit=onemore
set whichwrap+=<,>,h,l

set encoding=utf8
set fileformats=unix,dos,mac

set magic
set path+=**
set wildignore=*.o,*~,*.pyc

set timeoutlen=500
set updatetime=1000
set lazyredraw

set expandtab shiftwidth=4 tabstop=4
set smartindent linebreak
set ignorecase smartcase

""""""""""""""""""
" => Mappings <= "
""""""""""""""""""

nmap <leader>w :w!<cr>

noremap j gj
noremap k gk
nnoremap <c-e> <c-e>gj
nnoremap <c-y> <c-y>gk

" disable highlighting
map <silent> <leader><cr> :noh<cr>

" manage buffers
nnoremap gp :bp<cr>
nnoremap gn :bn<cr>
nnoremap gl :ls<cr>
nnoremap gb :ls<cr>:b<space>

" manage tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Toggle paste mode on and off
map <silent> <leader>pp :setlocal paste!<cr>

" Window movement shortcuts
map <silent> <leader>h :call WinMove('h')<cr>
map <silent> <leader>j :call WinMove('j')<cr>
map <silent> <leader>k :call WinMove('k')<cr>
map <silent> <leader>l :call WinMove('l')<cr>

" Open vimrc
nmap <silent> <leader>vr :e $MYVIMRC<cr>

" Source current file
nmap <leader>vs :so %<cr>

" Source visual selection
vmap <leader>vs y:@"<cr>

""""""""""""""
" => AUTO <= "
""""""""""""""

augroup WrapLine
    autocmd!
    autocmd FileType txt,markdown setlocal wrap
augroup END

" return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

autocmd BufWrite *.py :call DeleteTrailingWS()

""""""""""""""""""""""""""""
" => Functions/Commands <= "
""""""""""""""""""""""""""""

" TODO check out modern ctag implementations
" create the 'tags' file (may need to install ctags first)
command! MakeTags !ctags -R .

" move to the window in the direction shown, or create a new window
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


function! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction


function! HasPaste()
    if &paste
        return '[PASTE]'
    en
    return ''
endfunction

"""""""""""""""""""""""""
" => Plugin Settings <= "
"""""""""""""""""""""""""

nmap <silent> <leader>gs :Gstatus<cr>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>

let g:NERDTreeQuitOnOpen=1
let NERDTreeMapActivateNode='<SPACE>'

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++17 -Wall'

let g:syntastic_asm_compiler = 'nasm'
let g:syntastic_asm_compiler_options = '-f elf'

" let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_checkers = []
" let g:syntastic_pylint_args = '--error-only'

"""""""""""""""""""""
" => Source Temp <= "
"""""""""""""""""""""

try
    so $HOME/.dotfiles/vim/local.vim
catch
    :silent! !echo > $HOME/.dotfiles/vim/local.vim
endtry
