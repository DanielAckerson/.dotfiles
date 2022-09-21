" Common config for vim/neovim

""""""""""""""""""
" => Settings <= "
""""""""""""""""""

syntax enable
colorscheme ron
set background=dark
set cursorline

" maybe enable to make underscores standout in cursorline?
" TODO: doesn't work in this file but does work when manually set
"syn match DOTunderscore "_"
"hi DOTunderscore cterm=bold

set cmdheight=2
set number relativenumber
set showmatch matchtime=2
set showtabline=2
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%{HasPaste()}\ %-14.(%l,%c%V%)\ %P:%L

set hidden
set history=700
set mouse=nv
set switchbuf=useopen
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

set noexpandtab copyindent preserveindent
set softtabstop=0 shiftwidth=4 tabstop=4
set smartindent linebreak
set ignorecase smartcase

"""""""""""""""""""""""""
" => Plugin Settings <= "
"""""""""""""""""""""""""

let g:NERDTreeQuitOnOpen=1
let NERDTreeMapActivateNode='<space>'

let g:ale_linters = { 'cpp': ['clangtidy'], 'python': ['pylint'], 'rust': ['analyzer'] }
let g:ale_linters_explicit = 1

" avoiding unreadable blue highlight on Rust warning
hi ALEWarning ctermbg=DarkYellow

""""""""""""""""""
" => Mappings <= "
""""""""""""""""""

let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>

noremap j gj
noremap k gk
" nnoremap <c-e> <c-e>gj
" nnoremap <c-y> <c-y>gk

" disable highlighting
map <silent> <leader><cr> :noh<cr>

" manage tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

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

"""""""""""""""""""""""""
" => Plugin Mappings <= "
"""""""""""""""""""""""""

" fugitive
nmap <silent> <leader>gs :Git<cr>

" gitgutter
nmap <silent> <leader>n :GitGutterNextHunk<cr>
nmap <silent> <leader>p :GitGutterPrevHunk<cr>

" git 

" NERDTree
nmap <silent> <leader><leader> :NERDTreeToggle<cr>

" undotree
nmap <silent> <leader>u :UndotreeToggle<cr>

""""""""""""""
" => AUTO <= "
""""""""""""""

augroup WrapLine
    autocmd!
    autocmd filetype txt,markdown setlocal wrap
    autocmd filetype txt,markdown setlocal textwidth=80
    autocmd filetype txt,markdown setlocal colorcolumn=80
augroup END

" return to last edit position when opening files (You want this!)
autocmd bufreadpost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

autocmd bufwrite *.py :call DeleteTrailingWS()

augroup RunPython
    autocmd!
    autocmd filetype python nnoremap <buffer> <F5> :exec '!python '.shellescape('%').' &'<cr>
augroup END

augroup PandocMarkdownHTML
    autocmd!
    autocmd filetype markdown nnoremap <buffer> <F5> :exec '!pandoc '.shellescape('%').' -o '.shellescape('%:r.html').' &'<cr>
augroup END

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
    endif
    return ''
endfunction

"""""""""""""""""""""
" => Source Temp <= "
"""""""""""""""""""""

try
    so $HOME/.config/dotfiles/vim/vimrc
catch
    :silent! !echo > $HOME/.config/dotfiles/vim/vimrc
endtry
