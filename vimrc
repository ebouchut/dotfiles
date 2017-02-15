" Thank you @thoughbot @r00k, @christoomey, Damian Conway
" Requirements:
"  * fzf, ag, vit, ansiesc, flog
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
filetype off

call plug#begin('~/.vim/plugged')
Plug         'rking/ag.vim'
Plug   'jlanzarotta/bufexplorer'
Plug         'mattn/calendar-vim'
Plug      'ctrlpvim/ctrlp.vim'
Plug      'rizzatti/dash.vim'
Plug      'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug           'sjl/gundo.vim'      " Undo browser
Plug       'itchyny/lightline.vim'
Plug   'vim-scripts/loremipsum'
Plug    'scrooloose/nerdtree'       " Tree explorer for vim
Plug          'mtth/scratch.vim'    " Create scratch buffer with :Scratch or gs
Plug   'AndrewRadev/simple_bookmarks.vim'  " named bookmarks
Plug           'sjl/splice.vim'     " Resolve conflicts during git 3-way merge
Plug   'AndrewRadev/splitjoin.vim'  " Join and split ruby blocks
Plug    'scrooloose/syntastic'      " Check syntax
Plug     'godlygeek/tabular'
Plug    'majutsushi/tagbar'         " Show tags in a sidebar
Plug   'vim-scripts/taglist.vim'    " Source Code Browser (tag bar)
Plug        'SirVer/ultisnips'      " Snippets engine (needs honza/vim-snippets)
Plug 'MattesGroeger/vim-bookmarks'
Plug         'tpope/vim-bundler'
Plug 'jeetsukumaran/vim-buffergator'
Plug         'tpope/vim-commentary' " Comment the current line: gcc
Plug   'altercation/vim-colors-solarized'  " Solarized colour theme
Plug    'easymotion/vim-easymotion' " 
Plug         'tpope/vim-endwise'        " Add end in ruby
Plug         'tpope/vim-eunuch' " helpers for UNIX (file/directory operations)
Plug         'tpope/vim-fugitive'   " Git
Plug      'junegunn/gv.vim'         " Git commit browser
Plug          'elzr/vim-json'
Plug    'plasticboy/vim-markdown'      " requires "tabular"
Plug         'xolox/vim-misc'          " required by vim-session
Plug         'jistr/vim-nerdtree-tabs' " NERDTree and tabs together in Vim
Plug     'powerman/vim-plugin-AnsiEsc' " for colorful charts in taskwiki
Plug   'christoomey/vim-quicklink'   " Look up a topic in google and insert the markdwn link
" Plug 'sentientmonkey/vim-flog' " Compute Ruby cyclomatic complexity with flog
Plug        'tpope/vim-repeat'
Plug         'tpope/vim-projectionist'
Plug        'ecomba/vim-ruby-refactoring'
Plug         'tpope/vim-rails'
Plug         'tpope/vim-rake' " https://github.com/tpope/vim-rake/master/doc/rake.txt
Plug         'tpope/vim-rbenv'
Plug    'thoughtbot/vim-rspec'
Plug      'vim-ruby/vim-ruby'
Plug          'ngmy/vim-rubocop'
Plug         'xolox/vim-session'
Plug         'honza/vim-snippets'  " Snippets to feed ultisnips
Plug         'tpope/vim-speeddating' " Increment/Decrement dates, times (C-A/C-X)
Plug         'tpope/vim-surround'
Plug      'janko-m/vim-test'
Plug          'kana/vim-textobj-user'
Plug      'nelstrom/vim-textobj-rubyblock'
Plug  'tmux-plugins/vim-tmux'            " Syntax highlighing for tmux
Plug         'roxma/vim-tmux-clipboard'
Plug  'tmux-plugins/vim-tmux-focus-events' " restore FocusGained and FocusLost
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

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Undo file changes / modifications / backup
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" :earlier 10m
" Go back in time and restore the buffer as it was 10 minutes before 
if has('persistent_undo')
  set undofile       " Make undo persistent across vim sessions (ie. vim restart)
  set undodir^=~/.vim/undo//
  set undolevels=5000
endif

" Recursively search for files into subfolders + provide tab completion
set path+=**

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


set tags^=./tags,.git/tags,tags;

"set statusline=%#warningmsg#%{SyntasticStatuslineFlag()}%*\ %t\ %l,%v
set laststatus=2 " Always show status line

" Automatically write before running commands
" set autowrite

" auto-reload a file when changed outside of vim
" set autoread

"~~~~~~~~~~~~~~~~~~~~~~~
" Search
"~~~~~~~~~~~~~~~~~~~~~~~
set hlsearch    " Highlight all matches after entering a search pattern
set incsearch   " incremetal search
set ignorecase  " Case insensitive search
set smartcase   " Override ignorecase if pattern contains uppercase
set wrapscan    " Search wrap around
set scrolloff=4 " Show at least 4 lines around the cursor (when scrolling)
set sidescroll=10 " Scroll horizontally 10 characteres at a time
" Display search hitory using either of these 2 options
"  q/  
" /<Control>F

" ~~~~~~~~~~~~~~~~~~~
" QuickFix List
" ~~~~~~~~~~~~~~~~~~~


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
" List the possibilities (list), fill in the longest prefix (longest), show the
" full possibilty (full)
" :help wildmode
set wildmode=list:longest,list:full
set wildmenu   " Autocomplete command-line

" <Shift><Tab> pops up autocompletion
inoremap <S-Tab> <c-n>

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
set cindent

" Indent inside <li> and <p> tags
let g:html_indent_tags = 'li\|p'

"~~~~~~~~~~~~~~~~~~~~~~~
" Comments
"~~~~~~~~~~~~~~~~~~~~~~~
set formatoptions+=1  " don't break comment line after a one letter word

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

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Highlight the current line of the active buffer
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
autocmd VimEnter,WinEnter,BufWinEnter,FocusGained,CmdwinEnter * setlocal cursorline
autocmd WinLeave,FocusLost,CmdwinLeave                        * setlocal nocursorline

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
"  Mouse
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set mouse=a
" Workaround for this issue: http://stackoverflow.com/questions/7000960/vim-mouse-problem
set ttymouse=sgr

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"  Colors, terminal
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

" Map <Leader> key to space
let mapleader = "\<Space>"

" Switch between the last two files <=> :e #<CR>
nnoremap <leader><leader> <c-^>

nnoremap <Leader>C :e CHANGELOG.md<CR>

nnoremap <Leader>ct :call ToggleCalendar()<CR> " require calendar-vim

" Copy the entire buffer to the system clipboard
nnoremap <leader>co mmggVG"*y`m

" Change the working directory to the one of the current file
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Regenerate the file .git/tags (assumes the current dir is a git repository)
nnoremap <Leader>ct :!./.git/hooks/ctags<CR><CR>

" Dash integration (dash.vim required)
nnoremap <Leader>d <Plug>DashSearch

" Format the current buffer as JSON
nnoremap <Leader>fj :%!python -m json.tool

" Easymotion prefix key
map <Leader>e <Plug>(easymotion-prefix)

" Toggle the display of cyclomatic complexity next to each Ruby method
nnoremap <Leader>f :call ToggleFlog()<CR>

" Edit the Gemfile
nnoremap <Leader>G :e Gemfile<CR>

" find/search/grep the word under the cursor
nnoremap <Leader>g :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>

nnoremap <Leader>gg :GundoToggle<CR>

" Toggle highlighting of search pattern matches
noremap <silent> <Leader>h  :silent :set hlsearch! hlsearch?<CR>

" Ident current file, keeping current position
nnoremap <Leader>i mmgg=G`m

" Open a tmux pane on the right, occupying 50% of the screen
" and start ruby irb
nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<CR>

" List errors
nnoremap <Leader>L :ll<CR>

" Rename curent file  (vim-eunuch required)
nnoremap <Leader>m :Move <C-r>%

nnoremap <leader>nn :NERDTreeTabsToggle<CR>

" Show the current file in NERDTree
nnoremap <leader>nj :NERDTreeFind<CR>

" Toggle line numbers (relative | absolute | relative+absolute none)
" (http://vim.wikia.com/wiki/Display_line_numbers)
nnoremap <silent> <Leader>n :exec &number==&relativenumber? "set number!" : ":set relativenumber!"<CR>

" Open a file/folder in the current directory
nnoremap <Leader>o :e <C-R>=expand("%:p:h") . "/" <CR>

" Paste system clipboard at cursor position
noremap <Leader>p :set paste<CR>o<ESC>"*]p:set nopaste<CR>

" Open a tmux pane on the right, occupying 50% of the screen
" and start pry
nnoremap <leader>pry :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'pry'}<CR>


nnoremap <Leader>R :e config/routes.rb<CR>

" Substitue globally
nnoremap  <Leader>sg  :%s//g<LEFT><LEFT>

" Substitute globally the previously searched pattern
nnoremap <expr> <Leader>sG  ':%s/' . @/ . '//g<LEFT><LEFT>'

" Reload ~/.vimrc
nnoremap <Leader>so :source $MYVIMRC<CR>

" Open rails structure.sql
nnoremap <Leader>st :view db/structure.sql<CR>

nnoremap <Leader>tt  :TagbarToggle<CR>
nnoremap <Leader>tl  :TlistToggle<CR>

" Pre-populate  a split command with the current directory
nnoremap <Leader>v :vnew <C-r>=escape(expand("%:p:h"), '').'/'<CR>

" Edit ~/.vimrc in a split window
nnoremap <Leader>vr :split $MYVIMRC<CR>

" Edit ~/.vimrc in a new tab
nnoremap <Leader>vt :tabedit $MYVIMRC<CR>

" Execute the current line as a Vim script
noremap <Leader>x :exec getline(".")<cr>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <Leader>- :wincmd _<CR>:wincmd \|<CR>

nnoremap <leader>= :wincmd =<CR>


nnoremap <Leader>Q :cc<CR>
nnoremap <Leader>j :cnext<CR>
nnoremap <Leader>k :cprevious<CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"  Keyboard Binding / Mapping
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Force Saving Files that Require Root Permission: http://vimbits.com/bits/45
cnoremap w!! %!sudo tee > /dev/null %

" Replace %% with the directory of the current file (in command mode)
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" save the current file in insert and normal mode
noremap  <C-s>  :w<CR>

" <C-o> run a normal mode command wihout leaving insert mode
"   h: ins-special-special
inoremap <C-s> <C-o>:w<CR>

" Scroll faster (3 lines at a time)
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Use TAB and SHIFT TAB to cycle through the windows
" nnoremap <TAB>   <C-w>w  " disabled as it conflicts with the jumplist
nnoremap <S-TAB> <C-w>W

" Disable arrow keys
nnoremap <LEFT>  <NOP>
nnoremap <RIGHT> <NOP>
nnoremap <UP>    <NOP>
nnoremap <DOWN>  <NOP>

inoremap <LEFT>  <NOP>
inoremap <RIGHT> <NOP>
inoremap <UP>    <NOP>
inoremap <DOWN>  <NOP>

" <J><K>  to send <Esc> (in insert mode)
inoremap jk <Esc>

" Search using Perl regular expression instead of the vim variant
nnoremap /    /\v

nnoremap <F6> :GundoToggle<CR>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <F9> :NERDTreeTabsToggle<CR>

"~~~~~~~~~~~~~~~~~
" Plugin vim-rspec
" Run RSpec Tests
"~~~~~~~~~~~~~~~~~
" let g:rspec_command = "!rspec --drb {spec}"
let g:rspec_command = "VtrSendCommandToRunner! rspec {spec}"

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
autocmd! BufRead,BufNewFile *.json set filetype=json

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
" Open a FactoryGirl factory:
"   :Rfactory [name]
"~~~~~~~~~~~~~~~~~~~~~
let g:rails_projections = {
      \ "test/factories/*.rb": {
      \   "command":   "factory",
      \   "affinity":  "collection",
      \   "alternate": "app/models/%i.rb",
      \   "related":   "db/schema.rb#%s",
      \   "test":      "test/models/%i_test.rb",
      \   "template":  "FactoryGirl.define do\n  factory :%i do\n  end\nend",
      \   "keywords":  "factory sequence"
      \ },
      \ "spec/factories/*.rb": {
      \   "command":   "factory",
      \   "affinity":  "collection",
      \   "alternate": "app/models/%i.rb",
      \   "related":   "db/schema.rb#%s",
      \   "test":      "spec/models/%i_test.rb",
      \   "template":  "FactoryGirl.define do\n  factory :%i do\n  end\nend",
      \   "keywords":  "factory sequence"
      \ }
      \}

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
" Plugin ctrlp
"~~~~~~~~~~~~~~~~~~~~~
" Ignore VCS repositories and binary files
" When using ag (Silver Searcher) back end use .agignore instead
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

"~~~~~~~~~~~~~~~~~~~~~
" Plugin VimWiki
"~~~~~~~~~~~~~~~~~~~~~
" Generate the HTML and the TOC when saving a wiki page
let g:vimwiki_list = [ {'path': '~/vimwiki/', 'auto_export': 1, 'auto_toc': 1} ]

" Number HTML headings starting from level 1
let g:vimwiki_html_header_numbering=1

"~~~~~~~~~~~~~~~~~~~~~
" Plugin calendar-vim
"~~~~~~~~~~~~~~~~~~~~~
" Monday is the first day of the week
let g:calendar_monday = 1

function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction

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

" Disable Quickfix list 
let g:syntastic_auto_loc_list = 0

"~~~~~~~~~~~~~~~~~~~~~
" Plugin NERDTree
"~~~~~~~~~~~~~~~~~~~~~
" Do not display these files
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

"~~~~~~~~~~~~~~~~~~~~~
" Plugin vim-bookmarks
"~~~~~~~~~~~~~~~~~~~~~
" unbind the keys to avoid keybinding conflicts with Nerdtree
let g:bookmark_no_default_key_mappings = 1
function! BookmarkMapKeys()
    nmap mm :BookmarkToggle<CR>
    nmap mi :BookmarkAnnotate<CR>
    nmap mn :BookmarkNext<CR>
    nmap mp :BookmarkPrev<CR>
    nmap ma :BookmarkShowAll<CR>
    nmap mc :BookmarkClear<CR>
    nmap mx :BookmarkClearAll<CR>
    nmap mkk :BookmarkMoveUp
    nmap mjj :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
    unmap mm
    unmap mi
    unmap mn
    unmap mp
    unmap ma
    unmap mc
    unmap mx
    unmap mkk
    unmap mjj
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()

"~~~~~~~~~~~~~~~~~~~~~
" Plugin Taglist
"~~~~~~~~~~~~~~~~~~~~~
" Give the focus to the taglist window when it is opened
let Tlist_GainFocus_On_ToggleOpen = 1

" Show only the tags for the current file
let Tlist_Show_One_File = 1

" Open taglist in a window on the right side
let Tlist_Use_Right_Window = 1

" Automatically update taglist to include newly edited files
let Tlist_Auto_Update = 1

" Close tag folds for inactive buffers
let Tlist_File_Fold_Auto_Close = 1

"~~~~~~~~~~~~~~~~~~~~~
" Plugin bufexplorer
"~~~~~~~~~~~~~~~~~~~~~
let g:bufExplorerShowRelativePath=1

"~~~~~~~~~~~~~~~~~~~~~
" Plugin bufferGator
"~~~~~~~~~~~~~~~~~~~~~
let g:buffergator_vsplit_size=80
let g:buffergator_show_full_directory_path=0

"~~~~~~~~~~~~~~~~~~~~~
" Plugin vim-session
"~~~~~~~~~~~~~~~~~~~~~
 " SessionSave / SessionRestore  instead of  SaveSession / RestoreSession
let g:session_command_aliases = 1
let g:session_autosave = 'no'
let g:session_autoload = 'yes'
" vim --servername my_session_name

"~~~~~~~~~~~~~~~~~~~~~
" Plugin mtth/scratch
"~~~~~~~~~~~~~~~~~~~~~
let g:scratch_persistence_file = '~/tmp/vim.scratch.txt'

"~~~~~~~~~~~~~~~~~~~~~
" Plugin vim-test
"~~~~~~~~~~~~~~~~~~~~~

" Use tmux-runner to run tests
let test#strategy = "vtr"

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
