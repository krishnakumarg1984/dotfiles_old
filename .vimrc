set nocompatible
set guifont=DejaVu_Sans_Mono:h16 " firacode, deja vu, hack, source code pro, monaco, input		
call plug#begin()
   " visual pizzazz
     Plug 'flazz/vim-colorschemes'
     Plug 'vim-airline/vim-airline'
     Plug 'vim-airline/vim-airline-themes'
     Plug 'davidhalter/jedi-vim'
     Plug 'nvie/vim-flake8'
     " Plug 'python-mode/python-mode'
     Plug 'tpope/vim-abolish'
     " Plug 'kien/rainbow_parentheses.vim'
     Plug 'Yggdroot/indentLine'
     Plug 'simnalamburt/vim-mundo'
     Plug 'haya14busa/incsearch.vim' " Better incsearch than vim's default. Further mappings present later in this file
     Plug 'tpope/vim-surround'
     Plug 'tommcdo/vim-exchange'
     Plug 'yuttie/comfortable-motion.vim' "Physics-based scrolling there are also accelerated smooth scrolling plugins available.
     Plug 'mhinz/vim-startify'
     " Plug 'godlygeek/tabular'
     Plug 'junegunn/vim-easy-align'
     Plug 'tomtom/tcomment_vim'
     " Plug 'tpope/vim-commentary'
     Plug 'kshenoy/vim-signature'
     Plug 'machakann/vim-highlightedyank'
     Plug 'jiangmiao/auto-pairs'
     Plug 'wellle/targets.vim'
     Plug 'scrooloose/nerdtree'
     Plug 'tpope/vim-fugitive'
     " Plug 'ctrlpvim/ctrlp.vim'
     " Plug 'wincent/command-t'
     Plug 'wincent/command-t', {'do': 'cd ruby/command-t && ruby extconf.rb && make'}
     Plug 'majutsushi/tagbar'
     Plug 'airblade/vim-gitgutter'
     Plug 'ervandew/supertab'
     Plug 'tpope/vim-repeat'
     Plug 'AmaiSaeta/capture.vim' "capture ex-command outputs
     Plug 'Valloric/YouCompleteMe'
     Plug 'honza/vim-snippets'
     " Plug 'SirVer/ultisnips'
     Plug 'mileszs/ack.vim'
     Plug 'tpope/vim-eunuch'
     Plug 'ntpeters/vim-better-whitespace'
     " Plug 'sheerun/vim-polyglot'
     Plug 'gregsexton/gitv'
     Plug 'luochen1990/rainbow'
     Plug 'Ron89/thesaurus_query.vim'
     Plug 'reedes/vim-lexical'
     Plug 'reedes/vim-litecorrect'
     Plug 'reedes/vim-pencil'
     Plug 'dbmrq/vim-ditto'
     Plug 'junegunn/limelight.vim'
     Plug 'junegunn/goyo.vim'
     Plug 'kana/vim-textobj-user'
     Plug 'reedes/vim-textobj-quote'
     Plug 'reedes/vim-textobj-sentence'
     Plug 'reedes/vim-wheel'
     Plug 'reedes/vim-wordy'
     Plug 'chrisbra/csv.vim'
     Plug 'unblevable/quick-scope'
     " Plug 'rhysd/clever-f.vim'
     Plug 'nhooyr/neoman.vim'
     Plug 'coderifous/textobj-word-column.vim'
     "osyo-manga/vim-watchdogs
     Plug 'vim-utils/vim-troll-stopper'
     Plug 'vim-utils/vim-husk'
     Plug 'rhysd/vim-textobj-anyblock'
     Plug 'fisadev/vim-isort'
     Plug 'osyo-manga/vim-over'
     " "Shougo's plugins
     " Plug 'Shougo/vimproc.vim', {'do' : 'make'}
     " Plug 'Shougo/neosnippet.vim'
     " Plug 'Shougo/neocomplete.vim'
     " Plug 'Shougo/neoinclude'
call plug#end()

" set incsearch " Not reqd if incsearch plugin is installed

set keywordprg=:help
syntax on
filetype plugin indent on

colorscheme gruvbox
"colorscheme Tomorrow-Night  "(mango, vim-kolor,base16, molokai, wombat, mustang, railscasts, lucario, vim-atom-dark )

" let g:lightline = {
"       \ 'colorscheme': 'PaperColor',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component': {
"       \   'readonly': '%{&readonly?"":""}',
"       \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
"       \ },
"       \ 'component_visible_condition': {
"       \   'readonly': '(&filetype!="help"&& &readonly)',
"       \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
"       \ },
"       \ 'separator': { 'left': '', 'right': '' },
"       \ 'subseparator': { 'left': '', 'right': '' }
"       \ }

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

if has('persistent_undo')
    set undofile
    set undolevels=1000
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

set thesaurus+=/home/kg314/mthesaur.txt

"" open tags in new tab
"if has("cscope")
"    set csprg=/usr/bin/cscope
"    set csto=0
"    set cst
"    set nocsverb
"    " add any database in current directory
"    if filereadable("cscope.out")
"        cs add cscope.out
"        " else add database pointed to by environment
"    elseif $CSCOPE_DB != ""
"        cs add $CSCOPE_DB
"    endif
"endif

"map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
"map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>

"Use true color
let &t_8f="\e[38;2;%ld;%ld;%ldm"
let &t_8b="\e[48;2;%ld;%ld;%ldm"
set termguicolors
" set t_Co=256

set history=1000               " store lots of :cmdline history (default is 20)
set backspace=indent,eol,start " Make backspace behave in a sane manner.
set noshowmatch                " when on a [{(, highlight the matching )}]
" set showmatch                " when on a [{(, highlight the matching )}]
set cpoptions-=m               " ? Highlight when CursorMoved
set matchpairs+=<:>            " Highlight <>
set matchtime=1                " In 10ths of a second
set expandtab                  " Convert all TAB characters in the file to spaces

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
set ttimeout
set ttimeoutlen=0 "A non-negative number here will make the delay to be timeoutlen
set timeoutlen=1000 " The time in milliseconds that is waited for a key code or mapped key sequence to complete.

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

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus,autoselect,exclude:cons\\\\|linux
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed,autoselect,exclude:cons\\\\|linux
    endif
endif

set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set iskeyword-=!                    " '!' is an end of word designator

" set autochdir
set autowrite                       " Automatically write a file when leaving a modified buffer
set autoread                        " Autoread when a file is changed from outside

set viewoptions=cursor,folds,options,cursor,unix,slash " Better Unix / Windows compatibility

set fileformat=unix          " Default fileformat
set fileformats=unix,dos,mac

set virtualedit=block,insert                       " Enable virtualedit in visual block and insert modes

set hidden      " Allow changing buffer without saving it first

set infercase   " Ignore case on insert completion
set ignorecase  " Ignore case search for normal letters
set smartcase   " Do case-sensitive search if pattern contains upper case letters

" Default indent settings
set tabstop=4 shiftwidth=4
set softtabstop=4

set smarttab
set expandtab   " Expand tab to space

set shiftround  " Round indent by shiftwidth

set foldmethod=indent   " Fold by indent
set foldlevel=1         " Starting fold level
set foldnestmax=20      " Deepest fold is 20 levels
set foldlevelstart=99   " Open all folds by default
set nofoldenable        " Disable fold by default

" Turn off swapfile and backup
set noswapfile
set nobackup
set nowritebackup
set noundofile

set scrolloff=3               " Minimal number of screen lines to keep above and below the cursor
set sidescroll=3              " The minimal number of columns to scroll horizontally
set sidescrolloff=5           " The minimal number of screen columns to keep to the left and to the right of the cursor
set scrolljump=5                " How many lines to scroll at a time, make scrolling appears faster (i.e. when you move the cursor close to the vertical limits of display, how many more lines to reveal ?)

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
set complete=.,w,b,u,t,i,kspell ". till i is the default. . = current buffer. w  = any other windows, b = any other buffers opened, u = unopened buffers, t = tags, i = current and included files
"kspell = k means also look in the dictionary, kspell is the same, but only
"look up when spell-check is enabled

set ttyfast
set pumheight=15                " Set popup menu max height

set wildmenu
set wildmode=list:longest,full
" Ignore the following stuff when tab completing
set wildignore+=.hg,.git,.svn,*.o,*.obj,*.pyc,*.luac,*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.pdf,*.class,*.dmg,*.DS_Store,*.lnk,*.ini,*.dats

"Adjust window size of preview and help
set previewheight=8
set helpheight=12

set nostartofline               " The cursor is kept in the same column (if possible)

set splitbelow                  " Splitting a window will put the new window below the current one
set splitright                  " Splitting a window will put the new windowright the current one

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

cnoremap <C-V> <C-R>+ " CTRL-V: Paste from clipboard
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

set tabpagemax=15   " Maximum number of tab pages to be opened by the |-p| command line argument or the ":tab all" command. |tabpage|

set showmode                    " Display the current mode

highlight clear SignColumn      " SignColumn should match background,SignColumn column where |signs| are displayed

highlight Comment cterm=italic  " make comments in code to be italic

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd
endif

if has('statusline')
    set laststatus=2 "Always show a status line
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

"Custom function to enable to emphasize next search with a blinking cursor around the highlighted match
function! HLNext (blinktime)
    set invcursorline
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1500) . 'm'
    set invcursorline
endfunction

nnoremap <silent> n   n:call HLNext(0.3)<cr>
nnoremap <silent> N   N:call HLNext(0.3)<cr>

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
"
augroup collumnLimit
  autocmd!
  autocmd BufEnter,WinEnter,FileType scala,java
        \ highlight CollumnLimit ctermbg=DarkGrey guibg=DarkGrey
  let collumnLimit = 79 " feel free to customize
  let pattern =
        \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
  autocmd BufEnter,WinEnter,FileType scala,java
        \ let w:m1=matchadd('CollumnLimit', pattern, -1)
augroup END

set autoindent
set smartindent

set nojoinspaces

nnoremap : ;
nnoremap ; :
nnoremap Y y$
" Move across wrapped lines like regular lines
noremap 0 ^
" Go to the first non-blank character of a line
noremap ^ 0
" Just in case you need to go to the very beginning of a line

" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l

nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T  " open tags in new tab

inoremap <C-c> <Esc>

" function! Preserve(command)
"     " Preparation: save last search, and cursor position.
"     let _s=@/
"     let l = line(".")
"     let c = col(".")
"     " Do the business:
"     execute a:command
"     " Clean up: restore previous search history, and cursor position
"     let @/=_s
"     call cursor(l, c)
" endfunction

" A wrapper function to restore the cursor position, window position,
" and last search after running a command.
function! Preserve(command)
  " Save the last search
  let last_search=@/
  " Save the current cursor position
  let save_cursor = getpos(".")
  " Save the window position
  normal H
  let save_window = getpos(".")
  call setpos('.', save_cursor)

  " Do the business:
  execute a:command

  " Restore the last_search
  let @/=last_search
  " Restore the window position
  call setpos('.', save_window)
  normal zt
  " Restore the cursor position
  call setpos('.', save_cursor)
endfunction

nmap <silent><Leader>g :call Preserve("normal gg=G")<CR>

set guioptions-=m
set guioptions-=r
set guioptions-=T
set guicursor+=a:blinkon0

if has("autocmd")
    " Syntax of these languages is fussy over tabs Vs spaces
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
endif

" -----cursor shape control
" if has("autocmd")
"   au InsertEnter * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_BLOCK/TERMINAL_CURSOR_SHAPE_UNDERLINE/' ~/.config/xfce4/terminal/terminalrc"
"   au InsertLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_UNDERLINE/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
"   au VimLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_UNDERLINE/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
" endif

" For VTE compatible terminals (urxvt, st, xterm, gnome-terminal 3.x and others)
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

nnoremap g{ k{<Space>0
vnoremap g{ k{<Space>0
nnoremap g} j}<BS>0
vnoremap g} j}<BS>0

" " -------- vim-smooth-scrolling remaps ---------------------
" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" "---------- Ale linter config --------------------------------
" let g:ale_linters = {
"             \   'MATLAB'   : ['mlint'],
"             \   'Vim'      : ['vint'],
"             \   'Text'     : ['proselint'],
"             \   'Tex'      : ['proselint'],
"             \   'Python'   : ['pylint'],
"             \   'Markdown' : ['proselint'],
"             \   'HTML'     : ['HTMLlint'],
"             \}

"-------------clever-f plugin options ---------------------------
"g:clever_f_ignore_case = 1

" indent-guides plugin configs ------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" indent line plugin config -------
let g:indentLine_setColors = 0  "highlight conceal colour with colorscheme
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1

"----- incsearch.vim plugin ----------------------------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" :h g:incsearch#auto_nohlsearch
set hlsearch
nmap <silent><leader><space> ;nohls<CR>
"Clear highlighted search
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"-------- mundo plugin -----------------------------------------------
nnoremap <F2> :MundoToggle<CR>

"-------------nerdtree plugin settings -------------------------------
nnoremap <F3> :NERDTreeToggle<CR>
" close if the only window is the nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"-------------ctrl-p plugin settings -------------------------------
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

"-------------Tagbar plugin settings -------------------------------
nmap <F8> :TagbarToggle<CR>

" " ------------ Ultisnips settings -------------------------------
" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" " ------------ Ack.vim settings -------------------------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" highlight ExtraWhitespace ctermbg=Blue
let g:rainbow_active = 1
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

let g:tq_online_backends_timeout = 0.6
let g:tq_mthesaur_file="~\mthesaur.txt"

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds

nmap <leader>di <Plug>ToggleDitto      " Turn it on and off

nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches

nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

augroup textobj_quote
  autocmd!
  autocmd FileType markdown call textobj#quote#init()
  autocmd FileType textile call textobj#quote#init()
  autocmd FileType text call textobj#quote#init({'educate': 1})
  " autocmd FileType text call textobj#quote#init({'educate': 0})
augroup END

let g:textobj#quote#educate = 1       " 0=disable, 1=enable (def)
let g:textobj#quote#matchit = 1       " 0=disable, 1=enable (def)

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

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" nnoremap <silent> K :Vnman<CR>

let g:vim_isort_map = ''
