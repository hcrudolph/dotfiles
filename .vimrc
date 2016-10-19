"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Plugins from GitHub
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'

call vundle#end()
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Read when a file is changed from another editor
set autoread

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>e :q!<cr>
nmap <C-d> yyp
noremap cc ddO

" Creating and closing Tabs
map <leader>t :tabnew<cr>
map <leader>w :tabclose<cr>

" Switching Tabs
map <leader>n :tabprevious<cr>
map <leader>m :tabnext<cr>

" Forget about arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor when moving vertically
set so=7

" Enable relative line numbers
set number numberwidth=4
set relativenumber

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.hi

"Always show current position
set ruler

" Highlight lines > 80 columns
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

" Highlight tabs and trailing whitespaces
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Show git diff vertically
set diffopt=vertical

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Enable syntax highlighting
syntax enable
set background=dark
colorscheme molokai

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
language en_US

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway
set nobackup
set nowritebackup
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Acceptable paste command
set pastetoggle=<leader>p

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines
map j gj
map k gk

" Map Space to search and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" Convenient indenting
nnoremap > >>
nnoremap < <<

" Disable highlight when <leader><cr> is pressed
map <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>k :NERDTree<cr>

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map ALT key properly
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
nnoremap <M-j> j
nnoremap <M-k> k

" Move a line of text using ALT+[jk]
noremap <M-j> :m+1<cr>==
noremap <M-k> :m-2<cr>==

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbrevations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iabbrev esle else
iabbrev eles else
iabbrev eles else
iabbrev sefl self
iabbrev @@ hanschristianrudolph@gmail.com
iabbrev hcr Hans Christian Rudolph


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


" Switch on indent folding
augroup vimrc
    au BufReadPre * setlocal foldmethod=indent
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

