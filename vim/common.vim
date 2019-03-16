" settings for my usual vim experience, common between neovim and vim 8


""""""""""""""""""
" => Settings <= "
""""""""""""""""""

set number
set relativenumber

" makes cursor work conventionally
set virtualedit=onemore

set mouse=

syntax enable
set background=dark
colorscheme ron

set history=700

let mapleader = ","
let g:mapleader = ","

" ignore compiled files (assumes wildmenu is set)
set wildignore=*.o,*~,*.pyc

" show current position
set ruler

" command bar height
set cmdheight=2

" hide abandoned buffers instead
set hid

set whichwrap+=<,>,h,l

set ignorecase
set smartcase

" don't redraw while executing macros (good performance config)
set lazyredraw

" regex
set magic

" show bracket match
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
" 'vb' on and 't_vb=' disable bell sound
set visualbell
set t_vb=

" timeout for map
set tm=500

set encoding=utf8

" default type
set ffs=unix,dos,mac

" tabs
set expandtab
set shiftwidth=4
set tabstop=4

" Line break
set lbr
" set tw=5000

set smartindent
set wrap

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" TODO: check if deprecated
" Remember info about open buffers on close
set viminfo^=%

" always show the status line
set laststatus=2

" format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" search down into subfolders
set path+=**


""""""""""""""""""
" => Mappings <= "
""""""""""""""""""

nmap <leader>w :w!<cr>

" traverse line-breaks normally
map j gj
map k gk

" disable highlighting
map <silent> <leader><cr> :noh<cr>

" TODO: update according to denite (if installed)
nnoremap gp :bp<cr>
nnoremap gn :bn<cr>
nnoremap gl :ls<cr>
nnoremap gb :ls<cr>:b<space>

" manage tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Window movement shortcuts
map <silent> <leader>h :call WinMove('h')<cr>
map <silent> <leader>j :call WinMove('j')<cr>
map <silent> <leader>k :call WinMove('k')<cr>
map <silent> <leader>l :call WinMove('l')<cr>

" Open vimrc
nmap <silent> <leader>vr :e $MYVIMRC<cr>


""""""""""""""
" => AUTO <= "
""""""""""""""

augroup WrapLineInTXTFile
    autocmd!
    autocmd FileType txt setlocal wrap
augroup END

" return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


""""""""""""""""""""""""""""
" => Functions/Commands <= "
""""""""""""""""""""""""""""

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

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
function! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

