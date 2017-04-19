call plug#begin('~/.local/share/nvim/plugged')
     Plug 'flazz/vim-colorschemes'
     Plug 'vim-airline/vim-airline'
     Plug 'vim-airline/vim-airline-themes'
     Plug 'Yggdroot/indentLine', {'for': ['python','matlab','octave']}
     " Plug 'davidhalter/jedi-vim', {'for': 'python'}
     " Plug 'nvie/vim-flake8', {'for': 'python'}
     " Plug 'python-mode/python-mode'{'for':'python'}
     " Plug 'fisadev/vim-isort', {'for': 'python'}

     " Plug 'tpope/vim-abolish',{'for': ['text','tex']}
     Plug 'simnalamburt/vim-mundo'
     " Plug 'haya14busa/incsearch.vim' " Better incsearch than vim's default. Further mappings present later in this file
     " Plug 'haya14busa/incsearch-fuzzy.vim' "uses z/ , z?, zg/ for fuzzy search options
     Plug 'tpope/vim-surround'
     Plug 'tommcdo/vim-exchange'
     Plug 'kurkale6ka/vim-swap' "\x,\X to swap with right/left, \cx swaps comparison arguments, integrates with tpope's repeat. Multi-line selection and visual modes also possible
     " Plug 'machakann/vim-swap' "re-order delimited items
     Plug 'mhinz/vim-startify' "easy session management
     " Plug 'godlygeek/tabular'
     Plug 'junegunn/vim-easy-align' " gaip=, gaip2=, gaip*=, gaip**=, gaip<CR>=,gaip<CR><CR>=
     " Plug 'tomtom/tcomment_vim'
     Plug 'tpope/vim-commentary' "gcc, gc3j, gc}, gcip, gcu
     Plug 'kshenoy/vim-signature' "place, toggle and display marks. Navigate forward/backward by position/alphabetical order. Any arbitrary sign for marks is possible
     Plug 'machakann/vim-highlightedyank'
     Plug 'jiangmiao/auto-pairs' "quick jump to closed pair using }.  <M-p> : Toggle Autopairs,  <M-e> : Fast Wrap, <M-n> : Jump to next closed pair,<M-b> : BackInsert
     Plug 'wellle/targets.vim' "To change the text in the next pair of parentheses, use the cin) command,To delete the item in a comma separated list under the cursor, use da, last pair seems very useful, i(,i),ib,i{,i},i[,i],i<,i>,it, with count, same with 'a'. n and l options, quotes, even back-ticks
     Plug 'lambdalisue/gina.vim'
     Plug 'lambdalisue/vim-diffa'
     Plug 'chrisbra/vim-diff-enhanced'
     Plug 'rickhowe/diffchar.vim'
     Plug 'tpope/vim-fugitive'
     " Plug 'jreybert/vimagit'
     " Plug 'scrooloose/nerdtree'
     " Plug 'ctrlpvim/ctrlp.vim'
     " Plug 'wincent/command-t', {'do': 'cd ruby/command-t && ruby extconf.rb && make'}
     Plug 'majutsushi/tagbar', {'for': ['cpp', 'c', 'go', 'sh', 'javascript']}
     Plug 'airblade/vim-gitgutter'
     Plug 'ervandew/supertab'
     Plug 'tpope/vim-repeat'
     " Plug 'tpope/speeddating.vim'
     " Plug 'tyru/capture.vim' "capture ex-command outputs

     " Plug 'Valloric/YouCompleteMe'
     " Plug 'ajh17/VimCompletesMe'
     " Plug 'honza/vim-snippets'
     " Plug 'Shougo/neosnippet.vim'
     " Plug 'Shougo/neosnippet-snippets.vim'
     " Plug 'SirVer/ultisnips'
     " Plug 'mileszs/ack.vim'
     Plug 'mhinz/vim-grepper'
     Plug 'tpope/vim-eunuch'
     Plug 'ntpeters/vim-better-whitespace' " :ToggleWhitespace, :StripWhitespace
     " Plug 'sheerun/vim-polyglot'
     " Plug 'gregsexton/gitv'
     Plug 'junegunn/gv.vim'
     Plug 'junegunn/vim-peekaboo'
     Plug 'luochen1990/rainbow' "RainbowToggle command is provided
     " Plug 'junegunn/rainbow_parentheses.vim'
     Plug 'Ron89/thesaurus_query.vim',{'for': ['tex','text']} "\cs
     Plug 'reedes/vim-lexical',{'for': ['tex','text']}
     Plug 'reedes/vim-litecorrect',{'for': ['tex','text']}
     Plug 'reedes/vim-pencil',{'for': ['tex','text']}
     Plug 'dbmrq/vim-ditto',{'for': ['tex','text']}
     Plug 'junegunn/limelight.vim'
     Plug 'junegunn/goyo.vim' " :Goyo to toggle
     Plug 'kana/vim-textobj-user'
     " Plug 'reedes/vim-textobj-quote'
     Plug 'reedes/vim-textobj-sentence',{'for': ['tex','text']} " as, is, g), g(, ), (
     Plug 'reedes/vim-wheel' " a different scrolling experience
     Plug 'reedes/vim-wordy',{'for': ['tex','text']}
     Plug 'chrisbra/csv.vim',{'for': ['csv']}
     " Plug 'chrisbra/improvedft'
     Plug 'unblevable/quick-scope' " for f, F, t and T
     " Plug 'rhysd/clever-f.vim'
     Plug 'nhooyr/neoman.vim'
     Plug 'coderifous/textobj-word-column.vim'  " provides cic and vic mappings
     "osyo-manga/vim-watchdogs
     Plug 'vim-utils/vim-troll-stopper' " highlights invalid unicode characters
     Plug 'critiqjo/husk-x.vim' " for command line mode (readline bindings)
     " Plug 'vim-utils/vim-husk' " for command line mode (readline bindings)
     " Plug 'rhysd/vim-textobj-anyblock' " provides ib and ab objects
     Plug 'osyo-manga/vim-over' "substitute preview
     Plug 'lifepillar/vim-cheat40' "<leader>?
     " Plug 'timakro/vim-searchant'
     Plug 'tpope/vim-obsession'
     Plug 'dhruvasagar/vim-prosession'
     Plug 'google/vim-searchindex'
     Plug 'google/vim-maktaba'
     Plug 'google/vim-glaive'
     Plug 'google/vim-codefmt',{'for': ['c','cpp','python']}
     Plug 'google/vim-syncopate'
     " Plug 'lambdalisue/vim-foldround'
     " Plug 'lambdalisue/lista.nvim'
     Plug 'tmux-plugins/vim-tmux'
     Plug 'tmux-plugins/vim-tmux-focus-events'
     Plug 'tpope/vim-characterize' "In Vim, pressing ga on a character reveals its representation in decimal, octal, and hex. Characterize.vim modernizes this with a few additions
     Plug 'ludovicchabant/vim-gutentags' "Gutentags is a plugin that takes care of the much needed management of tags files in Vim. It will (re)generate tag files as you work while staying completely out of your way. It will even do its best to keep those tag files out of your way too. It has no dependencies and just works.
     Plug 'romainl/vim-qf' "short for vim-quickfix—is a growing collection of settings, commands and mappings put together to make working with the location list/window and the quickfix list/window smoother.

     Plug 'romainl/vim-qlist' "make the results of include-search and definition-search easier to navigate and more persistent by using the quickfix list instead of the default list-like interface.
     " Plug 'romainl/tinyMRU'
     Plug 'romainl/vim-cool' "Vim-cool disables search highlighting when you are done searching and re-enables it when you search again.
     " Plug 'justinmk/vim-sneak'
     " Plug 'tomtom/ttags_vim'
call plug#end()

nnoremap <F2> :MundoToggle<CR>
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"----- incsearch.vim plugin ----------------------------
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
" :h g:incsearch#auto_nohlsearch
"Clear highlighted search
" let g:incsearch#auto_nohlsearch = 1
" map n  <Plug>(incsearch-nohl-n)
" map N  <Plug>(incsearch-nohl-N)
" map *  <Plug>(incsearch-nohl-*)
" map #  <Plug>(incsearch-nohl-#)
" map g* <Plug>(incsearch-nohl-g*)
" map g# <Plug>(incsearch-nohl-g#)

" function! s:config_fuzzyall(...) abort
"   return extend(copy({
"   \   'converters': [
"   \     incsearch#config#fuzzy#converter(),
"   \     incsearch#config#fuzzyspell#converter()
"   \   ],
"   \ }), get(a:, 1, {}))
" endfunction

" noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
" noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
" noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))

let g:highlightedyank_highlight_duration = 400

" nmap <Leader>ff <Plug>(foldround-forward)
" nmap <Leader>fb <Plug>(foldround-backward)

nmap <F3> :TagbarToggle<CR>
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

let g:AutoPairsFlyMode = 1 "enables fly mode for auto-pairs

"Started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

let g:vim_isort_map = ''

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:tq_online_backends_timeout = 0.6

" au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds

nmap <leader>di <Plug>ToggleDitto      " Turn it on and off

nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches

augroup textobj_sentence
  autocmd!
  autocmd FileType markdown call textobj#sentence#init()
  autocmd FileType textile call textobj#sentence#init()
  autocmd FileType text call textobj#sentence#init()
augroup END

augroup litecorrect
    autocmd!
    autocmd FileType markdown,mkd call litecorrect#init()
    autocmd FileType textile call litecorrect#init()
    autocmd FileType text call litecorrect#init()
augroup END

nmap <silent><leader><space> ;nohls<CR>

set diffopt=filler
set keywordprg=:help

colorscheme gruvbox
let g:airline_theme='base16'
" let g:airline_theme='papercolor'

function! ToggleBG()
    let s:tbg = &background
    " Inversion
    if s:tbg == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction

noremap <leader>bg :call ToggleBG()<CR>
set background=dark

set path+=**                     "Find will start working (under the current directory)
set suffixesadd=.py,.m,.mat      "Find will work harder for these filetypes
set thesaurus+=~/dotfiles/mthesaur.txt

set noshowmatch                " when on a [{(, highlight the matching )}]
" set showmatch                " when on a [{(, highlight the matching )}]
set cpoptions-=m               " ? Highlight when CursorMoved
set matchpairs+=<:>            " Highlight <>
set matchtime=1                " In 10ths of a second

if has('mouse') | set mouse=a | endif"+
set mousehide

set number
" set relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
nnoremap <silent> <leader>n :call NumberToggle()<cr>

set cursorline " highlight current line
" set scrollbind " When this option is set, the current window scrolls as other scrollbind windows (windows that also have this option set) scroll.
" set cursorbind

" Don't try to highlight lines longer than 1000 characters
set synmaxcol=300   "Boost performance in rendering long lines

" Make ESC respond faster Lower the delay of escaping out of other modes " keycode times out fast, mapping times out in a bit more time
set timeout " time out on mappings and keycodes (stronger of the two conditions)
set ttimeoutlen=0 "A non-negative number here will make the delay to be timeoutlen

" Show @@@ in the last line if it is truncated.
" set display=truncate

set spelllang=en_gb,en_us
syntax spell toplevel
"set spell                           " Spell checking on
" Enable spellchecking for Markdown files and git commit messages

set visualbell               " Use visual bell instead of beeping
set t_vb=                    " But don't want any beep or flash
set noerrorbells

" set nomodeline               " Don't parse modelines because of vim modeline vulnerability

set encoding=utf-8           " Default encoding for saving and reading file
scriptencoding utfs8
set termencoding=utf-8

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus,autoselect
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set iskeyword-=!                    " '!' is an end of word designator

" set autochdir
set autowrite                       " Automatically write a file when leaving a modified buffer

set viewoptions=cursor,folds,options,cursor,unix,slash " Better Unix / Windows compatibility

set fileformat=unix          " Default fileformat
set fileformats=unix,dos,mac

set virtualedit=block,insert                       " Enable virtualedit in visual block and insert modes

set hidden      " Allow changing buffer without saving it first

set infercase   " Ignore case on insert completion
set ignorecase  " Ignore case search for normal letters
set smartcase   " Do case-sensitive search if pattern contains upper case letters

set smartindent

set tabstop=4 shiftwidth=4
set softtabstop=4
set expandtab   " Expand tab to space

set shiftround  " Round indent by shiftwidth

set foldmethod=indent   " Fold by indent
set foldlevel=1         " Starting fold level
set foldnestmax=20      " Deepest fold is 20 levels
set foldlevelstart=99   " Open all folds by default
set nofoldenable        " Disable fold by default

" Turn off swapfile and backup
set noswapfile
" set nobackup
" set nowritebackup
set backupext=.bak

set scrolloff=2               " Minimal number of screen lines to keep above and below the cursor
set sidescroll=2              " The minimal number of columns to scroll horizontally
set sidescrolloff=4           " The minimal number of screen columns to keep to the left and to the right of the cursor
set scrolljump=4              " How many lines to scroll at a time, make scrolling appears faster (i.e. when you move the cursor close to the vertical limits of display, how many more lines to reveal ?)

if has('conceal')
    set listchars+=conceal:^
    set conceallevel=1 concealcursor=i
endif
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
nnoremap <leader>a :set list!<CR>  " Shortcut to rapidly toggle set list
" set list

hi link HelpBar Normal
hi link HelpStar Normal

" Wrap conditions
set whichwrap+=h,l,<,>,[,],b,s,~
set nowrap
" set textwidth=100

if has('linebreak')
    set linebreak                   " Wrap lines at convenient point (only affects the on-screen display, not actual content in file)
    let &showbreak='↪ '
    set breakat=\ \ ;:,!?
    if exists('+breakindent')
        set breakindent
    endif
endif

set cmdheight=2                 " Height of command-line (easy-readable)

" Completion settings in insert mode
set completeopt=longest,menuone,noselect,preview
" set complete=.,w,b,u,t,i,kspell ". till i is the default. . = current buffer. w  = any other windows, b = any other buffers opened, u = unopened buffers, t = tags, i = current and included files
"kspell = k means also look in the dictionary, kspell is the same, but only
"look up when spell-check is enabled

set pumheight=15                " Set popup menu max height

set wildmode=list:longest,full
" Ignore the following stuff when tab completing
set wildignore+=.hg,.git,.svn,*.o,*.obj,*.pyc,*.luac,*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.pdf,*.class,*.dmg,*.DS_Store,*.lnk,*.ini,*.dats

"Adjust window size of preview and help
set previewheight=8
set helpheight=12

set nostartofline               " The cursor is kept in the same column (if possible)

set splitbelow                  " Splitting a window will put the new window below the current one
set splitright                  " Splitting a window will put the new windowright the current one

cnoremap <C-V> <C-R>+           " CTRL-V: Paste from clipboard
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

set showmode                    " Display the current mode

highlight clear SignColumn      " SignColumn should match background,SignColumn column where |signs| are displayed

highlight Comment cterm=italic
"make comments in code to be italic

if has('cmdline_info')
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
endif

if has('statusline')
    set statusline=%<%f\
    set statusline+=%w%h%m%r
    set statusline+=\ [%{&ff}/%Y]
    set statusline+=\ [%{getcwd()}]
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%
endif

set viminfo='1000,f1,<500

set linespace=0                 " No extra spaces between rows

set numberwidth=5               " Width of the line-no. column

set magic                       " Make regex a little easier to type

set winminheight=0              " Windows can be 0 line high

set report=0                    " Threshold for reporting number of lines changed.
set updatecount=0 "After typing this many characters the swap file will be written to disk.  When zero, no swap file will be created at all (see chapter on recovery |crash-recovery|).  "
set updatetime=250             " milliseconds elapsed before which swap file will be written to disk (250 ms is recommende by gitgutter plugin)
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
"
augroup collumnLimit
  autocmd!
  autocmd BufEnter,WinEnter,FileType scala,java,markdown,javascript,php
        \ highlight CollumnLimit ctermbg=DarkGrey guibg=DarkGrey guifg=VioletRed gui=bold
  let collumnLimit = 120 " feel free to customize
  let pattern =
        \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
  autocmd BufEnter,WinEnter,FileType scala,java,markdown,javascript,php
        \ let w:m1=matchadd('CollumnLimit', pattern, -1)
augroup END

set nojoinspaces

nnoremap : ;
nnoremap ; :
nnoremap Y y$
" Move across wrapped lines like regular lines
noremap 0 ^
" Go to the first non-blank character of a line
noremap ^ 0
" Just in case you need to go to the very beginning of a line

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T  " open tags in new tab

inoremap <C-c> <Esc>
set guioptions-=m
set guioptions-=r
set guioptions-=T
set guicursor+=a:blinkon0
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>
" nnoremap <NL> o<ESC>

"keeppatterns for avoiding over-write of registers

if has("autocmd")
    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd BufRead,BufNewFile *mutt-*              setfiletype mail
    autocmd BufRead,BufNewFile *mutt-*              setlocal fo+=aw
    autocmd FileType mail setlocal fo+=aw
    autocmd FileType help setlocal number
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType c,cpp :set cindent
    autocmd FileType markdown setlocal spell
    autocmd FileType gitcommit setlocal spell
    autocmd FileType python nnoremap <buffer> <F11> :exec '!clear;python' shellescape(@%, 1)<cr>  # execute python commands
    autocmd BufEnter * silent! normal! g`"
    autocmd BufNewFile,BufRead *.rss setfiletype xml     " Treat .rss files as XML
    autocmd VimResized * :wincmd =      " automatically rebalance windows on vim resize
    au BufNewFile,BufRead *.py "(PEP8 indentation)
        \ set tabstop=4
        \ set softtabstop=4
        \ set shiftwidth=4
        \ set textwidth=79
        \ set expandtab
        \ set autoindent
        \ set fileformat=unix
    " au BufAddr highlighted search,BufNewFile * nested tab sball "To open each buffer in its own tabpage
    autocmd FileType c,cpp,java,php,text,python autocmd BufWritePre <buffer> %s/\s\+$//e
    autocmd BufWritePre .*rc %s/\s\+$//e
    au BufNewFile,BufRead *.csv set nolist
endif

"  Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
  augroup END
endif " has("autocmd")

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

" -----cursor shape control
" if has("autocmd")
"   au InsertEnter * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_BLOCK/TERMINAL_CURSOR_SHAPE_UNDERLINE/' ~/.config/xfce4/terminal/terminalrc"
"   au InsertLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_UNDERLINE/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
"   au VimLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_UNDERLINE/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
" endif

" For VTE compatible terminals (urxvt, st, xterm, gnome-terminal 3.x and others)
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
" let &t_SI = "\<Esc>[6 q"
" let &t_SR = "\<Esc>[4 q"
" let &t_EI = "\<Esc>[2 q"

nnoremap g{ k{<Space>0
vnoremap g{ k{<Space>0
nnoremap g} j}<BS>0
vnoremap g} j}<BS>0

set iskeyword+=@-@
" behave mswin

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" " set formatoptions+=j " Delete comment character when joining commented lines
" if has('path_extra')
"   setglobal tags-=./tags tags-=./tags; tags^=./tags;
" endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/bin/bash
endif

set termguicolors
" Use true color feature
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
