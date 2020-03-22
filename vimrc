" Author: Felipe Martins https://blog.fefas.net
"
" Reference: https://github.com/joedicastro/dotfiles/tree/master/vim

set nocompatible " No to the total compatibility with the ancient vi

" Dein {{{

" Auto installing Dein
let iCanHazDein=1
let dein_readme = expand('~/.vim/dein/repos/github.com/Shougo/dein.vim/README.md')
if !filereadable(dein_readme)
    echo "Installing Dein..."
    echo ""
    silent !mkdir -p ~/.vim/dein
    silent !git clone https://github.com/Shougo/dein.vim ~/.vim/dein/repos/github.com/Shougo/dein.vim
    let iCanHazDein=0
endif

" Call Dein
if has('vim_starting')
    set rtp+=~/.vim/dein/repos/github.com/Shougo/dein.vim
endif
call dein#begin(expand('~/.vim/dein'))

" plugins {{{

call dein#add('Shougo/dein.vim') " is better if Dein rules Dein (needed!)

call dein#add('joedicastro/vim-molokai256')
call dein#add('Yggdroot/indentLine')

call dein#add('tpope/vim-commentary')
call dein#add('Raimondi/delimitMate')
call dein#add('ntpeters/vim-better-whitespace')

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-fugitive')

call dein#add('elzr/vim-json', {'on_ft' : 'json'})
call dein#add('scrooloose/syntastic')

" }}}

call dein#end()


" Auto install the Plugins
" First-time plugins installation
if iCanHazDein == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    set nomore
    call dein#install()
endif
if  dein#check_install()
    call dein#install()
endif

" }}}

" Make a dir if no exists {{{

function! MakeDirIfNoExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction

" }}}

" <Leader> & <LocalLeader> mapping {{{

let mapleader=','
let maplocalleader= ' '

" }}}

" Basic options {{{

scriptencoding utf-8
set encoding=utf-8              " setup the encoding to UTF-8
set ls=2                        " status line always visible
set go-=T                       " hide the toolbar
set go-=m                       " hide the menu
set visualbell                  " turn on the visual bell
set cursorline                  " highlight the line under the cursor
set fillchars+=vert:│           " better looking for windows separator
set ttyfast                     " better screen redraw
set title                       " set the terminal title to the current file
set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed
set autoread                    " update a open file edited outside of Vim
set ttimeoutlen=0               " toggle between modes almost instantly
set backspace=indent,eol,start  " defines the backspace key behavior
set virtualedit=all             " to edit where there is no actual character
set more                        " to show pages using `more` in command outpouts

" }}}

" History and permanent undo levels {{{

set history=500
set undofile
set undoreload=500

" }}}

" Backups {{{

set backup
set noswapfile
set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/
set viminfo+=n$HOME/.vim/tmp/viminfo

" make this dirs if no exists previously
silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)

" }}}

" Ok, a vim for braves, get off the cursor keys {{{

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" }}}

" Tabs, space and wrapping {{{

set expandtab                  " spaces instead of tabs
set tabstop=4                  " a tab = four spaces
set shiftwidth=4               " number of spaces for auto-indent
set softtabstop=4              " a soft-tab of four spaces
set autoindent                 " set on the auto-indent
set textwidth=80
set colorcolumn=81

au FileType yaml setl sw=2 sts=2 et

" }}}

" cut/paste to/from clipboard  {{{

map <Leader>y "*y
map <Leader>p "*p

" }}}

" Colorscheme {{{

syntax enable                  " enable the syntax highlight
set background=dark            " set a dark background
set t_Co=256                   " 256 colors for the terminal
colorscheme molokai256

" }}}

" New windows {{{

nnoremap <Leader>v <C-w>v
nnoremap <Leader>s <C-w>s

" }}}

" Fast window moves {{{

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" }}}

" Toggle line numbers {{{

set number
set norelativenumber

nnoremap <silent><Leader>l :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
    if &number && &relativenumber
        set number
        set norelativenumber
    elseif &number && !&relativenumber
        set number
        set relativenumber
    endif
endfunction

" }}}

" Show hidden chars {{{

nmap <Leader>eh :set list!<CR>
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

" }}}

" dein {{{

let g:dein#enable_notification=1
let g:dein#notification_time=5

" }}}

" indent line {{{

let g:indentLine_enabled=1
let g:indentLine_char='|'
let g:indentLine_noConcealCursor=2
let g:indentLine_color_term = 239

" }}}

" commentary {{{

nmap <Leader>c <Plug>CommentaryLine
xmap <Leader>c <Plug>Commentary

au FileType php setlocal commentstring=//%s

" }}}

" delimitmate {{{

let delimitMate_expand_space = 1

" }}}

" airline {{{

set noshowmode

let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=0
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_section_z = airline#section#create(['%l:%c'])

" }}}

" json {{{

let g:vim_json_syntax_conceal=0

" }}}
