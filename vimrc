"~~~~~~~~~~~~~~~~~~~~~
" Package Manager
"~~~~~~~~~~~~~~~~~~~~~

" Make % ruby aware
runtime macros/matchit.vim

call plug#begin('~/.vim/plugged')
  Plug 'altercation/vim-colors-solarized'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rake'
  Plug 'vim-ruby/vim-ruby'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'kana/vim-textobj-user'
"  Plug 'tpope/unimpaired'
call plug#end()


"~~~~~~~~~~~~~~~~~~~~~~~
" General Configuration
"~~~~~~~~~~~~~~~~~~~~~~~
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins: Automatically detect file types
filetype plugin indent on

set hlsearch " Highlight search

set timeoutlen=250 " Time to wait after ESC (default causes an annoying delay)
set history=256    " History size
set noerrorbells

"~~~~~~~~~~~~~~~~~~~~~
" Filtetype detection
"~~~~~~~~~~~~~~~~~~~~~
if has("autocmd")
    filetype on
    filetype indent on
    filetype plugin on
endif

"~~~~~~~~~~~~~~~~~~~~~
" Show list of files
"~~~~~~~~~~~~~~~~~~~~~
set wildmode=longest,list,full
set wildmenu

"~~~~~~~~~~~~~~~~~~~~~
" Formatting
"~~~~~~~~~~~~~~~~~~~~~
set expandtab " Use spaces instead of tab
set tabstop=2 " Tabs are 2 spaces
set shiftwidth=2 " 2 spaces for indentation
set bs=2 " Backspace over everything in insert mode
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab

"
"set statusline=%#warningmsg#%{SyntasticStatuslineFlag()}%*\ %t\ %l,%v
" set laststatus=2 " Always show status line

"~~~~~~~~~~~~~~~~~~~~~
"  Restore cursor position
"~~~~~~~~~~~~~~~~~~~~~
  autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \ exe "normal! g`\"" |
      \ endif

"~~~~~~~~~~~~~~~~~~~~~
"  Set Color scheme
"~~~~~~~~~~~~~~~~~~~~~
syntax enable
set t_Co=256
set background=dark " dark | light
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

"~~~~~~~~~~~~~~~~~~~~~
"  Pretty-print JSON files
"~~~~~~~~~~~~~~~~~~~~~
autocmd BufRead,BufNewFile *.json set filetype=json
" json.vim is here: http://www.vim.org/scripts/script.php?script_id=1945
autocmd Syntax json sou ~/.vim/syntax/json.vim
" json_reformat is part of yajl: http://lloyd.github.com/yajl/
autocmd FileType json set equalprg=json_reformat

" Spell check and wrap commit message at 72 characters
autocmd Filetype gitcommit setlocal spell textwidth=72

"~~~~~~~~~~~~~~~~~~~~~
"  Keyboard Mapping
"~~~~~~~~~~~~~~~~~~~~~
" Force Saving Files that Require Root Permission: http://vimbits.com/bits/45
cmap w!! %!sudo tee > /dev/null %

" F12: Toggle background dark/light
map <F12> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
