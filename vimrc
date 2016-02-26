" Thank you @thoughbot @r00k, @christoomey, 
" Requirements:
"  * taskwiki, taskwarrior, task, fzf, ag: 
"      brew install task tasksh vit ansiesc fzf ag
"
" Disable vimrc:  vim -U NONE
"
"~~~~~~~~~~~~~~~~~~~~~
" Vim Plugins
"
" Install plugins:  :PlugInstall
" Update plugins:   :PlugUpdate
"~~~~~~~~~~~~~~~~~~~~~
" Make % ruby aware
runtime macros/matchit.vim

call plug#begin('~/.vim/plugged')
  Plug    'ctrlpvim/ctrlp.vim'
  Plug    'rizzatti/dash.vim'
  Plug    'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'vim-scripts/loremipsum'
  Plug  'majutsushi/tagbar'
  Plug      'tbabej/taskwiki' " Tasks in vimwiki (requires vim-taskwarrior)
  Plug      'SirVer/ultisnips'  " Snippets engine
  Plug       'tpope/vim-bundler'
  Plug       'tpope/vim-commentary' " Comment the current line: gcc
  Plug       'tpope/vim-fugitive'   " Git
  Plug 'altercation/vim-colors-solarized'  " Solarized colour theme
  Plug    'powerman/vim-plugin-AnsiEsc' " for colorful charts in taskwiki
  Plug 'christoomey/vim-quicklink'  " Look up a topic in google and insert the markdwn link
  Plug       'tpope/vim-repeat'
  Plug       'tpope/vim-projectionist'
  Plug     'blindFS/vim-taskwarrior' " interface to task-warrior (required)
  Plug       'tpope/vim-rails'
  Plug       'tpope/vim-rake' " https://github.com/tpope/vim-rake/master/doc/rake.txt
  Plug  'thoughtbot/vim-rspec'
  Plug 'christoomey/vim-rfactory'  " Navigate to FactoryGirl factory definition
  Plug    'vim-ruby/vim-ruby'
  Plug    'honza/vim-snippets'  " Snippets
  Plug       'tpope/vim-surround'
  Plug        'kana/vim-textobj-user'
  Plug    'nelstrom/vim-textobj-rubyblock'
  Plug 'christoomey/vim-tmux-runner'
  Plug     'vimwiki/vimwiki'  " https://github.com/vimwiki/vimwiki#key-bindings
  Plug       'mattn/webapi-vim'  " required by vim-quicklinks
call plug#end()

"~~~~~~~~~~~~~~~~~~~~~~~
" General Configuration
"~~~~~~~~~~~~~~~~~~~~~~~
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins: Automatically detect file types

set timeoutlen=400 " Time to wait after ESC (default causes an annoying delay)
set history=256    " History size
set noerrorbells
set showcmd        " Show the curent command while it is active
set ruler          " show the cursor position all the time

"set statusline=%#warningmsg#%{SyntasticStatuslineFlag()}%*\ %t\ %l,%v
set laststatus=2 " Always show status line
" set autowrite    " Automatically write before running commands

"~~~~~~~~~~~~~~~~~~~~~~~
" Search
"~~~~~~~~~~~~~~~~~~~~~~~
set hlsearch    " Highlight all matches after entering a search pattern
set incsearch   " incremetal search
set ignorecase  " Case insensitive search
set smartcase   " Override ignorecase if pattern contains uppercase
set scrolloff=4 " Keep at least 4 lines below the cursor when scrolling
set wrapscan    " Search wrap around
" Display search hitory using either of these 2 options
"  q/  
" /<Control>F

"~~~~~~~~~~~~~~~~~~~~
" Filtetype detection
"~~~~~~~~~~~~~~~~~~~~~
if has("autocmd")
    filetype on
    filetype indent on
    filetype plugin on
endif

"~~~~~~~~~~~~~~
" Autocomplete
"~~~~~~~~~~~~~~
set wildmode=list:longest,list:full
set wildmenu   " Autocomplete command-line

" <Shift><Tab> pops up autocompletion
inoremap <S-Tab> <c-n>

" <Tab> inserts a tab when at beginning of a line, or else use completion.
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<CR>

"~~~~~~~~~~~~~
" Tabulation
"~~~~~~~~~~~~~
set expandtab    " Use spaces instead of tab
set tabstop=2    " Tabs are 2 spaces
set shiftwidth=2 " 2 spaces for indentation
set shiftround   " Round indent to a multiple of shiftwidth

"~~~~~~~~~~~~~~~~~~~~~~~~~
" Show special characters
"~~~~~~~~~~~~~~~~~~~~~~~~~
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
set bs=indent,eol,start " Backspace over everything in insert mode

"~~~~~~~~~~~~~
" Indentation
"~~~~~~~~~~~~~
set autoindent
set smarttab

set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent

" Indent inside <li> and <p> tags
let g:html_indent_tags = 'li\|p'

"~~~~~~~~~~~~~
" Spell Check
"~~~~~~~~~~~~~
" spellfile location 
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete also suggests dictionary words when spell check is enabled
set complete+=kspell

"~~~~~~~~~~~~~
" Line length
"~~~~~~~~~~~~~
set textwidth=80   " Break line longer than 80 characters
" set colorcolumn=+1 " Draw a vertical line at column 81

" Make lines longer than 80 character stand out
"   using magenta background only for the character in column 81
" Source:  https://youtu.be/aHm36-na4-4?t=144
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

"~~~~~~~~~~~~~~~~~~~~~
"  Line Numbers
"~~~~~~~~~~~~~~~~~~~~~
set number  " Display absolute line numbers by default

"autocmd InsertEnter * :set norelativenumber " Absolute number in insert mode
"autocmd InsertLeave * :set relativenumber   " Relative number in normal mode

"autocmd FocusLost *   :set norelativenumber
"autocmd FocusGained * :set relativenumber

"~~~~~~~~~~~~~~~~~~~~~
" Help
"~~~~~~~~~~~~~~~~~~~~~
"   :help func<TAB>
"   :helpgrep
"   :help function-list
set infercase " "Preserves the case of the partial word you're completing, 
"                  even if the selected completion word was differently cased."

"~~~~~~~~~~~~~~~~~~~~~
"  Code Folding
"~~~~~~~~~~~~~~~~~~~~~
set nofoldenable " No Code folding

"~~~~~~~~~~~~~~~~~~~~~
" Diff
"~~~~~~~~~~~~~~~~~~~~~
" Always use vertical diffs
set diffopt+=vertical

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"  Restore previous cursor position
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \ exe "normal! g`\"" |
      \ endif

"~~~~~~~~~~~~~~~~~~~~~
"  Colours, terminal
"~~~~~~~~~~~~~~~~~~~~~
set t_Co=256
set background=dark " dark | light
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

" <F12>: Toggle background dark/light
map <F12> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>

"~~~~~~~~~~~~~~~~~~~~~~~
" TagBar
"~~~~~~~~~~~~~~~~~~~~~~~
nmap <F8> :TagbarToggle<CR>

"~~~~~~~~~~~~~~~~~~~~~~~
" Window / Split size
"~~~~~~~~~~~~~~~~~~~~~~~

" Maximize focused split
" set winwidth=84
" set winheight=5
" set winminheight=5
" set winheight=999

"~~~~~~~~~~~~~~~~~~~~~~~~~~
" Where to put a new window
"~~~~~~~~~~~~~~~~~~~~~~~~~~
" When using split, put the new window below the current one.
set splitbelow
" When using vsplit, put the new window right of the current one.
set splitright

" Close all other windows. Make the current window the only one on the screen.
" :on

" :help opening-window

"~~~~~~~~~~~~~~~~~~~~~~~
" Vim/Tmux integration
"~~~~~~~~~~~~~~~~~~~~~~~
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

"~~~~~~~~~~~~~~~~~~~~~~~
" Key Bindings / Mapping
"~~~~~~~~~~~~~~~~~~~~~~~
" :h map-which-key  " Find keys available

" Map <Leader> to space
let mapleader = " "

" Switch between the last two files <=> :e #<CR>
nnoremap <leader><leader> <c-^>

" Copy the entire buffer to the clipboard (system register)
nmap <leader>co mmggVG"*y`m

" Dash integration (dash.vim required)
nmap <silent> <leader>d <Plug>DashSearch

" <Leader>h  Toggle highlighting of search pattern matches
noremap <silent> <leader>h  :silent :set hlsearch! hlsearch?<CR>

" Ident current file, keeping current position
nmap <Leader>i mmgg=G`m

" <Leader>n  Toggle line numbers 
" (http://vim.wikia.com/wiki/Display_line_numbers)
nmap <Leader>n :set number!<CR>


" <Leader>r  Toggle relative line numbers
nmap <Leader>r :set relativenumber!<CR>

" Paste system clipboard at cursor position
map <Leader>p :set paste<CR>o<ESC>"*]p:set nopaste<CR>

" Reload ~/.vimrc
nmap <leader>so :source $MYVIMRC<CR>

" Edit ~/.vimrc in a split window
nmap <leader>vr :split $MYVIMRC<CR>

" Edit ~/.vimrc in a new tab
nmap <leader>vt :tabedit $MYVIMRC<CR>

" Pre-populate  a split command with the current directory
nmap <leader>v :vnew <C-r>=escape(expand("%:p:h"), '').'/'<CR>

" Execute the current line as a Vim script
map <Leader>x :exec getline(".")<cr>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<CR>:wincmd \|<CR>

" Rebalance panes
nnoremap <leader>= :wincmd =<CR>

" <Leader>irb   Open a tmux pane on the right, occupying 50% of the screen
" and start ruby irb
nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<CR>

" <Leader>pry   Open a tmux pane on the right, occupying 50% of the screen
" and start pry
nnoremap <leader>pry :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'pry'}<CR>

"~~~~~~~~~~~~~~~~~
" Run RSpec Tests
"   vim-rspec required
"~~~~~~~~~~~~~~~~~
" let g:rspec_command = "!rspec --drb {spec}"
let g:rspec_command = "VtrSendCommand! rspec {spec}"

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


"~~~~~~~~~~~~~~~~~~~~~
"  Pretty-print JSON files
"~~~~~~~~~~~~~~~~~~~~~
autocmd BufRead,BufNewFile *.json set filetype=json
" json.vim is here: http://www.vim.org/scripts/script.php?script_id=1945
autocmd Syntax json source ~/.vim/syntax/json.vim
" json_reformat is part of yajl: http://lloyd.github.com/yajl/
autocmd FileType json set equalprg=json_reformat

" Spell check and wrap commit message at 72 characters
autocmd Filetype gitcommit setlocal spell textwidth=72

" Set Syntax highlighting for Markdown files
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Bind `q` to close the buffer for help files
autocmd Filetype help nnoremap <buffer> q :q<CR>

" <Space> goto "next" help page
autocmd Filetype help nnoremap <Space>   <C-F>

" <Backspace> goto "previous" help page
autocmd Filetype help nnoremap <Backspace>  <C-B>

"~~~~~~~~~~~~~~~~~~~~~
"  Keyboard Mapping
"~~~~~~~~~~~~~~~~~~~~~
" Force Saving Files that Require Root Permission: http://vimbits.com/bits/45
cmap w!! %!sudo tee > /dev/null %

" save the current file in insert and normal mode
map  <C-s> :wq<CR>
imap <C-s> <ESC>:wq<CR>a

" open up a new tab
map <C-t> <ESC>:tabnew<CR>

" Substitue globally (I did not use <S> but <c><c> to replace the current line)
nmap  S  :%s//g<LEFT><LEFT>

" Substitute globally the previouly searched pattern
nmap <expr>  M  ':%s/' . @/ . '//g<LEFT><LEFT>'


"~~~~~~~~~~~~~~~~~~~~~
" Use ag (The Silver Searcher) over grep
"   https://github.com/ggreer/the_silver_searcher
"~~~~~~~~~~~~~~~~~~~~~
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"~~~~~~~~~~~~~~~~~~~~~
" Plugin VimWiki
"~~~~~~~~~~~~~~~~~~~~~
" Generate the HTML and the TOC when saving a wiki page
let g:vimwiki_list = [ {'path': '~/vimwiki/', 'auto_export': 1, 'auto_toc': 1} ]

" Number HTML headings starting from level 1
let g:vimwiki_html_header_numbering=1

"~~~~~~~~~~~~~~~~~~~~~
" OS Specific config
"~~~~~~~~~~~~~~~~~~~~~
if has('unix')
  if has('mac')
    source ~/.vimrc-macos
  else
    source ~/.vimrc-linux
  endif
end

"~~~~~~~~~~~~~~~~~~~~~
" Local config
"~~~~~~~~~~~~~~~~~~~~~
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
