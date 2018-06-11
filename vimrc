"
"                       __   _(_)_ __ ___  _ __ ___
"                       \ \ / / | '_ ` _ \| '__/ __|
"                        \ V /| | | | | | | | | (__
"                       (_)_/ |_|_| |_| |_|_|  \___|
"
" Author: Felipe Martins https://blog.fefas.net
"
" Reference: joedicastro https://github.com/joedicastro/dotfiles/tree/master/vim

" neobundle {{{

set nocompatible     " no to the total compatibility with the ancient vi

" neobundle auto-installation and setup {{{

let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
  echo "Installing NeoBundle.."
  echo ""
  silent !mkdir -p $HOME/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
  let iCanHazNeoBundle=0
endif

" Call NeoBundle
if has('vim_starting')
  set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand($HOME.'/.vim/bundle/'))

" it is better if NeoBundle rules NeoBundle (needed!)
NeoBundle 'Shougo/neobundle.vim'

" }}}

" plugins install {{{

" Search
NeoBundle 'scrooloose/nerdtree'

" Comment
NeoBundle 'scrooloose/nerdcommenter'

" Layout
NeoBundle 'bling/vim-airline'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'ntpeters/vim-better-whitespace'
NeoBundle 'Yggdroot/indentLine'

" Syntax
NeoBundleLazy 'elzr/vim-json', {'filetypes' : 'json'}
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'ekalinin/Dockerfile.vim'

" Git
NeoBundle 'airblade/vim-gitgutter'

" }}}

call neobundle#end()

" auto install the plugins {{{

" First-time plugins installation
if iCanHazNeoBundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  set nomore
  NeoBundleInstall
endif

" Check if all of the plugins are already installed, in other case ask if we
" want to install them (useful to add plugins in the .vimrc)
NeoBundleCheck

" }}}

" }}} neobundle

" functions {{{

" make a dir if no exists {{{

function! MakeDirIfNoExists(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path), "p")
  endif
endfunction

" }}}

" }}} functions

" vim config {{{

scriptencoding utf-8
set encoding=utf-8              " setup the encoding to UTF-8
set laststatus=2                " status line always visible
set showcmd                     " shows partial commands
set ruler                       " sets a permanent rule
set title                       " set the terminal title to the current file
set hidden                      " hide the inactive buffers

set number                      " show line number
set cursorline                  " highlight the line under the cursor
set virtualedit=all             " to edit where there is no actual character
set backspace=indent,eol,start  " defines the backspace key behavior

"set mouse=a                     " enable mouse events
set nomousehide                 " don't hide cursor mouse while typing

set ttyfast                     " better screen redraw
set ttimeoutlen=0               " toggle between modes almost instantly

" appearance {{{

syntax enable                  " enable the syntax highlight
set background=dark            " set a dark background
set t_Co=256                   " 256 colors for the terminal
colorscheme bubblegum-256-dark
set colorcolumn=81

autocmd BufNewFile,BufRead *.ts set syntax=javascript
autocmd BufNewFile,BufRead Dockerfile.* set syntax=dockerfile

" }}}

" tabs, space and wrapping {{{

filetype plugin indent on      " enable indent size for file type

set expandtab                  " spaces instead of tabs
set tabstop=2                  " a tab = two spaces
set shiftwidth=2               " number of spaces for auto-indent
set softtabstop=2              " a soft-tab of four spaces
set autoindent                 " set on the auto-indent
set textwidth=80

au FileType php setl sw=4 sts=4 et
au FileType python setl sw=4 sts=4 et
au FileType c setl sw=4 sts=4 et
au FileType cpp setl sw=4 sts=4 et
au FileType json setl sw=4 sts=4 et
au FileType dockerfile setl sw=4 sts=4 et
au FileType yaml setl sw=2 sts=2 et
au FileType sh setl sw=4 sts=4 et

" }}}

" backup {{{

set backup
set noswapfile
set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/
set viminfo+=n$HOME/.vim/tmp/viminfo

silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)

" }}}

" get off the cursor keys {{{

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" }}}

" fast window split and moves {{{

nnoremap <Leader>v <C-w>v
nnoremap <Leader>s <C-w>s

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" }}}

" cut/paste to/from clipboard  {{{

map <Leader>y "*y
map <Leader>p "*p

" }}}

" }}} vim config

" plugins setup {{{

" airline {{{

set noshowmode

let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#whitespace#enabled=1
let g:airline#extensions#hunks#non_zero_only=1
let g:airline#extensions#tabline#enabled=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_y=''

" }}}

" better whitespace {{{

highlight ExtraWhitespace ctermbg=red

" }}}

" json {{{

let g:vim_json_syntax_conceal=0

" }}}

" indent line {{{

let g:indentLine_enabled=1
let g:indentLine_char='¦'
let g:indentLine_noConcealCursor=2
let g:indentLine_color_term = 239

" }}}

" }}} plugins setup