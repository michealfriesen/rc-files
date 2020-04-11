syntax on

" Automatic indentation rules
set autoindent
filetype plugin indent on

" Tab things
set expandtab
set tabstop=4
set softtabstop=4
set shiftround
set shiftwidth=4
set backspace=indent,eol,start

" Visible Tabs
set list
set listchars=tab:>-
set hlsearch
set ignorecase
set incsearch

" Clipboard
set clipboard=unnamed

"FZF
set rtp+=/usr/local/bin/fzf
let g:fzf_tags_command = 'ctags -R'

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'viewdoc'
Plugin 'vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'PaperColor.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'embear/vim-localvimrc'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'neoclide/coc.nvim'
Plugin 'junegunn/fzf', { 'dir':'/usr/local/bin/fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'whiteinge/diffconflicts'
Plugin 'preservim/nerdcommenter'
call vundle#end()

set spelllang=en_us

" Shortcuts
nnoremap <silent> /<space> :noh<CR>
nnoremap ,<space> :Ag<CR>
nnoremap <space><CR> :Files<CR>

" UI
colorscheme gruvbox 
set t_Co=256
set background=dark
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_contrast_light='soft'
set wildmenu
set ruler
set number
set showcmd


" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'gruvbox'

" NERDTree
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '+'
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Bind spellcheck to F10
nmap <silent> <F10> :silent set spell!<CR>
imap <silent> <F10> <C-O>:silent set spell!<CR>

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

" source ~/.vim/freebsd.vim
