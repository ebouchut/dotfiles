runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

filetype on " Automatically detect file types
filetype plugin indent on

set hlsearch

" Syntax highlighting
syntax enable

" Filtetype detection
if has("autocmd")
    filetype on
    filetype indent on
    filetype plugin on
endif


" Show list of files
set wildmode=longest,list,full
set wildmenu

set timeoutlen=250 " Time to wait after ESC (default causes an annoying delay)
set history=256    " History size
set noerrorbells

" Formatting
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


"Restore cursor position
  autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \ exe "normal! g`\"" |
      \ endif

" Set Color scheme
set t_Co=256
set background=dark " dark | light
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

" pretty-print JSON files
autocmd BufRead,BufNewFile *.json set filetype=json
" json.vim is here: http://www.vim.org/scripts/script.php?script_id=1945
autocmd Syntax json sou ~/.vim/syntax/json.vim
" json_reformat is part of yajl: http://lloyd.github.com/yajl/
autocmd FileType json set equalprg=json_reformat

" Spell check and wrap commit message at 72 characters
autocmd Filetype gitcommit setlocal spell textwidth=72


" ~~~~~~~~~~~~~~~~~~
" Keyboard Mapping
"
" Force Saving Files that Require Root Permission: http://vimbits.com/bits/45
cmap w!! %!sudo tee > /dev/null %

" F12: Toggle background dark/light
map <F12> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
