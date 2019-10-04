syntax on

" Automatic indentation rules
set autoindent
filetype plugin indent on
set smarttab
"set expandtab
set tabstop=4
set softtabstop=4
set shiftround
set shiftwidth=4
set backspace=indent,eol,start
"set formatoptions=tcqor
set formatoptions=tcqoraw

" Visible Tabs
set list
set listchars=tab:>-

set hlsearch
set ignorecase
set incsearch

set wildmenu

set ruler
set number

set showcmd

" Printer Device
set pdev=HPLJ
set printoptions=number:y,syntax:y,paper:letter
" Printer Command
set pexpr=system('/usr/local/bin/lpr'\ .\ (&printdevice\ ==\ ''\ ?\ ''\ :\ '\ -P'\ .\ &printdevice)\ .\ '\ '\ .\ v:fname_in)\ .\ delete(v:fname_in)\ +\ v:shell_error

let $MANSECT = "2:3:4:9:1:8:n:5:6:7:l"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'viewdoc'
Plugin 'vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'PaperColor.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'embear/vim-localvimrc'
Plugin 'valloric/youcompleteme'
call vundle#end()

" Per-terminal settings

if (&term == "screen")
    set mouse=a
    set t_Co=256
    colorscheme 256_blackdust
    set background=dark
endif

if (&term == "xterm")
    set mouse=a
    set t_Co=256
    " Light Theme
    set background=light
    colorscheme PaperColor
    " Dark Theme (either one)
    " set background=dark
    " colorscheme desert256
    " colorscheme xoria256
endif

if has("gui_running")
    " colorscheme desert
    colorscheme xoria256
    set background=dark
    set akm
    set guifont=Consolas
endif

if (v:version > 700)
    set spelllang=en_us
endif

" Make tags command to allow for ctag creation
command! MakeTags !exctags -R

" Airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" NERDTree
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '+'
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" YouCompleteMe
"let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
"let g:ycm_key_list_select_completion = ['<Down>']

" ViewDoc
let g:viewdoc_open='vnew'

" Bind spellcheck to F10
nmap <silent> <F10> :silent set spell!<CR>
imap <silent> <F10> <C-O>:silent set spell!<CR>
imap <c-e> <ESC>$A
imap <c-a> <ESC>0i

" Mouse Wheel Support
map <MouseDown> 12<C-U>
map <MouseUp> 12<C-E>

" File Type
autocmd BufReadPre SConstruct set filetype=python
autocmd BufReadPre SConscript set filetype=python
autocmd BufReadPre *.sc set filetype=python
autocmd BufReadCmd *.tbz call tar#Browse(expand("<amatch>"))
autocmd BufRead,BufNewFile *.ll set filetype=llvm
autocmd BufRead,BufNewFile *.llx set filetype=llvm
autocmd BufRead,BufNewFile *.td set filetype=tablegen
autocmd BufRead,BufNewFile *.etch set filetype=etch
autocmd BufRead,BufNewFile *.log set filetype=liblog

