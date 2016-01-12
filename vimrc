"~~~~~~~~~~~~~~~~~~~~~
" Plugins
"~~~~~~~~~~~~~~~~~~~~~
" Make % ruby aware
runtime macros/matchit.vim

" install plugins:  :PlugInstall
" update plugins:   :PlugUpdate
call plug#begin('~/.vim/plugged')
  Plug 'altercation/vim-colors-solarized'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'rizzatti/dash.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rake'
  Plug 'tpope/vim-surround'
  Plug 'thoughtbot/vim-rspec'
  Plug 'vim-ruby/vim-ruby'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'kana/vim-textobj-user'
  Plug 'christoomey/vim-tmux-runner'
"  Plug 'tpope/unimpaired'
call plug#end()

"~~~~~~~~~~~~~~~~~~~~~~~
" Vim/Tmux integration
"~~~~~~~~~~~~~~~~~~~~~~~
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =


" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" <Leader>irb   Open a tmux pane on the right, occupying 50% of the screen
" and start ruby irb
nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>

" <Leader>pry   Open a tmux pane on the right, occupying 50% of the screen
" and start pry
nnoremap <leader>pry :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'pry'}<cr>

"~~~~~~~~~~~~~~~~~
" Run RSpec Tests
"   vim-rspec required
"~~~~~~~~~~~~~~~~~
let g:rspec_command = "call VtrSendCommand('rspec {spec}')"

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"~~~~~~~~~~~~~~~~~~~~~~~
" Leader
"~~~~~~~~~~~~~~~~~~~~~~~
let mapleader = ","

" Dash integration (dash.vim required)
nmap <silent> <leader>d <Plug>DashSearch

" Paste Clipboard at cursor position
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

" Ident current file, keeping current position
map <Leader>i mmgg=G'm

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

