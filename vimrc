" Thank you @thoughbot @r00k, @christoomey, Damian Conway
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
Plug      'ctrlpvim/ctrlp.vim'
Plug      'rizzatti/dash.vim'
Plug      'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug       'itchyny/lightline.vim'
Plug   'vim-scripts/loremipsum'
Plug    'scrooloose/nerdtree'       " Tree explorer for vim
Plug           'sjl/splice.vim'     " Resolve conflicts during git 3-way merge
Plug   'AndrewRadev/splitjoin.vim'  " Join and split ruby blocks
Plug    'scrooloose/syntastic'      " Check syntax
Plug    'majutsushi/tagbar'         " Show tags in 
Plug        'tbabej/taskwiki'       " Tasks in vimwiki (requires vim-taskwarrior)
Plug        'SirVer/ultisnips'      " Snippets engine
Plug         'tpope/vim-bundler'
Plug         'tpope/vim-commentary' " Comment the current line: gcc
Plug         'tpope/vim-endwise'        " Add end in ruby
Plug         'tpope/vim-eunuch' " helpers for UNIX (file/directory operations)
Plug         'tpope/vim-fugitive'   " Git
Plug   'altercation/vim-colors-solarized'  " Solarized colour theme
Plug     'powerman/vim-plugin-AnsiEsc' " for colorful charts in taskwiki
Plug   'christoomey/vim-quicklink'   " Look up a topic in google and insert the markdwn link
Plug        'tpope/vim-repeat'
Plug         'tpope/vim-projectionist'
Plug       'blindFS/vim-taskwarrior' " interface to task-warrior (required)
Plug         'tpope/vim-rails'
Plug         'tpope/vim-rake' " https://github.com/tpope/vim-rake/master/doc/rake.txt
Plug    'thoughtbot/vim-rspec'
Plug   'christoomey/vim-rfactory'  " Navigate to FactoryGirl factory definition
Plug      'vim-ruby/vim-ruby'
Plug         'honza/vim-snippets'  " Snippets
Plug         'tpope/vim-speeddating' " Increment/Decrement dates, times (C-A/C-X)
Plug         'tpope/vim-surround'
Plug          'kana/vim-textobj-user'
Plug      'nelstrom/vim-textobj-rubyblock'
Plug   'christoomey/vim-tmux-runner'
Plug       'vimwiki/vimwiki'  " https://github.com/vimwiki/vimwiki#key-bindings
Plug         'mattn/webapi-vim'  " required by vim-quicklinks
call plug#end()

"~~~~~~~~~~~~~~~~~~~~~~~
" General Configuration
"~~~~~~~~~~~~~~~~~~~~~~~
set nocompatible      " We are running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Automatically detect file types

set hidden         " Do not ask to save buffer modifications 
set timeoutlen=400 " Time to wait after ESC (default causes an annoying delay)
set history=1000   " History size
set noerrorbells
set showcmd        " Show the curent command while it is active
set ruler          " show the cursor position all the time
set undofile       " Make undo persistent across vim sessions (ie. vim restart)
set undodir^=~/.vim/undo//

" Store swap files in a central location
"   The // at the end of the directory name tells Vim to use the absolute path 
" to the file to create the swap file to prevent collisions between files 
" of the same name from different directories.
set directory^=~/.vim/swap//

" Where to store backup files
set backupdir^=~/.vim/backup//

" Where to store the state of the previous editing session
" See http://stackoverflow.com/a/23036077/386517
set viminfo=%,<800,'10,/50,:100,h,f0,n~/.vim/viminfo
"           | |    |   |   |    | |  + viminfo file path
"           | |    |   |   |    | + file marks 0-9,A-Z 0=NOT stored
"           | |    |   |   |    + disable 'hlsearch' while loading viminfo
"           | |    |   |   + command-line history saved
"           | |    |   + search history saved
"           | |    + files marks saved
"           | + lines saved for each register 
"           + save/restore buffer list


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
set wrapscan    " Search wrap around
set scrolloff=4 " Keep at least 4 lines below the cursor when scrolling
set sidescroll=10 " Scroll horizontally 10 characteres at a time
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
set colorcolumn=+1 " Draw a vertical line at column 81

" Make lines longer than 80 character stand out
"   using magenta background only for the character in column 81
" Source:  https://youtu.be/aHm36-na4-4?t=144
" highlight ColorColumn ctermbg=magenta
" call matchadd('ColorColumn', '\%81v', 100)

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

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"  Colours, terminal
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set t_Co=256
set background=dark " Use a dark background (the other option is light)

" <F5>: Toggle background dark/light
call togglebg#map("<F5>")

"~~~~~~~~~~~~~~~~~~~~~
" colorscheme solarized
"~~~~~~~~~~~~~~~~~~~~~
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

"~~~~~~~~~~~~~~~~~~~~~
" colorscheme molokai
"~~~~~~~~~~~~~~~~~~~~~
"" let g:molokai_original = 1
" let g:rehash256 = 1
" colorscheme molokai


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Window / Split size
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
"   :only
"   <C-W>o
" :help opening-window

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"  Leader Key Bindings / Mapping
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" :h map-which-key  " Find keys available

" Map <Leader> to space
let mapleader = " "

" Switch between the last two files <=> :e #<CR>
nnoremap <leader><leader> <c-^>

" Copy the entire buffer to the clipboard (system register)
nnoremap <leader>co mmggVG"*y`m

" Dash integration (dash.vim required)
nnoremap <silent> <leader>d <Plug>DashSearch

" grep the word under the cursor
nnoremap <Leader>g :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>

" Toggle highlighting of search pattern matches
noremap <silent> <leader>h  :silent :set hlsearch! hlsearch?<CR>

" Ident current file, keeping current position
nnoremap <Leader>i mmgg=G`m

" Rename curent file  (vim-eunuch required)
nnoremap <Leader>m :Move <C-r>%

" Toggle line numbers
" (http://vim.wikia.com/wiki/Display_line_numbers)
nnoremap <Leader>n :set number!<CR>

" Toggle relative line numbers
nnoremap <Leader>r :set relativenumber!<CR>

" Paste system clipboard at cursor position
noremap <Leader>p :set paste<CR>o<ESC>"*]p:set nopaste<CR>

" Reload ~/.vimrc
nnoremap <leader>so :source $MYVIMRC<CR>

" Edit ~/.vimrc in a split window
nnoremap <leader>vr :split $MYVIMRC<CR>

" Edit ~/.vimrc in a new tab
nnoremap <leader>vt :tabedit $MYVIMRC<CR>

" Pre-populate  a split command with the current directory
nnoremap <leader>v :vnew <C-r>=escape(expand("%:p:h"), '').'/'<CR>

" Execute the current line as a Vim script
noremap <Leader>x :exec getline(".")<cr>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<CR>:wincmd \|<CR>

" Rebalance panes
nnoremap <leader>= :wincmd =<CR>

" Open a tmux pane on the right, occupying 50% of the screen
" and start ruby irb
nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<CR>

" Open a tmux pane on the right, occupying 50% of the screen
" and start pry
nnoremap <leader>pry :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'pry'}<CR>


"~~~~~~~~~~~~~~~~~~~~~
"  Keyboard Mapping
"~~~~~~~~~~~~~~~~~~~~~
" Force Saving Files that Require Root Permission: http://vimbits.com/bits/45
cnoremap w!! %!sudo tee > /dev/null %

" save the current file in insert and normal mode
noremap  <C-s>      :w<CR>
" <C-o> run a normal mode command wihout leaving insert mode
"   h: ins-special-special
inoremap <C-s> <C-o>:w<CR>

" open up a new tab
noremap <C-t> <ESC>:tabnew<CR>

" Substitue globally (I did not use <S> but <c><c> to replace the current line)
nnoremap  S  :%s//g<LEFT><LEFT>

" Substitute globally the previously searched pattern 
nnoremap <expr>  M  ':%s/' . @/ . '//g<LEFT><LEFT>'

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Disable arrow keys
nnoremap <LEFT>  <NOP>
nnoremap <RIGHT> <NOP>
nnoremap <UP>    <NOP>
nnoremap <DOWN>  <NOP>

inoremap <LEFT>  <NOP>
inoremap <RIGHT> <NOP>
inoremap <UP>    <NOP>
inoremap <DOWN>  <NOP>

"~~~~~~~~~~~~~~~~~
" Plugin vim-rspec
" Run RSpec Tests
"~~~~~~~~~~~~~~~~~
" let g:rspec_command = "!rspec --drb {spec}"
let g:rspec_command = "VtrSendCommand! rspec {spec}"

noremap <Leader>t :call RunCurrentSpecFile()<CR>
noremap <Leader>s :call RunNearestSpec()<CR>
noremap <Leader>l :call RunLastSpec()<CR>
noremap <Leader>a :call RunAllSpecs()<CR>


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Filetypes
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"~~~~~~~~~~~~~~~~~~~~~
" JSON file
"~~~~~~~~~~~~~~~~~~~~~
autocmd BufRead,BufNewFile *.json set filetype=json
" json.vim is here: http://www.vim.org/scripts/script.php?script_id=1945
autocmd Syntax json source ~/.vim/syntax/json.vim
" json_reformat is part of yajl: http://lloyd.github.com/yajl/
autocmd FileType json set equalprg=json_reformat

"~~~~~~~~~~~~~~~~~~~~~
" Markdown file
"~~~~~~~~~~~~~~~~~~~~~
" Set Syntax highlighting for Markdown files (not modula 2!)
autocmd BufRead,BufNewFile *.md set filetype=markdown

"~~~~~~~~~~~~~~~~~~~~~
" Help file
"~~~~~~~~~~~~~~~~~~~~~
" Bind `q` to close the buffer for help files
autocmd Filetype help nnoremap <buffer> q :q<CR>

" <Space> goto "next" help page
autocmd Filetype help nnoremap <Space>   <C-F>

" <Backspace> goto "previous" help page
autocmd Filetype help nnoremap <Backspace>  <C-B>

"~~~~~~~~~~~~~~~~~~~~~~~
" Vim/Tmux integration
"~~~~~~~~~~~~~~~~~~~~~~~
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"  Restore previous cursor position
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
augroup END

"~~~~~~~~~~~~~~~~~~~~~
" Git commit
"~~~~~~~~~~~~~~~~~~~~~
" Spell check and wrap commit message at 72 characters
autocmd Filetype gitcommit setlocal spell textwidth=72
" Go to the top of the file
autocmd Filetype gitcommit exe "normal gg"


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Use ag (The Silver seacrher) over grep
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if executable('ag')
  " Use ag (The Silver Searcher) over grep when available
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
" Plugin syntastic
"~~~~~~~~~~~~~~~~~~~~~
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"~~~~~~~~~~~~~~~~~~~~~
" Plugin NERDTree
"~~~~~~~~~~~~~~~~~~~~~
" Toogle NERDTree
nnoremap <F9>          :NERDTreeToggle<CR>
nnoremap <leader>nerd :NERDTreeToggle<CR>

" Locate (jump to) the current file in NERDTree
nnoremap <leader>j :NERDTreeFind<CR>

" Use the right arrow to open tree node
let NERDTreeMapActivateNode='<RIGHT>'

" Do not display these files
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

"~~~~~~~~~~~~~~~~~~~~~~~
" Plugin TagBar
"~~~~~~~~~~~~~~~~~~~~~~~
nnoremap <F8>         :TagbarToggle<CR>
nnoremap <Leader>tag  :TagbarToggle<CR>

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
