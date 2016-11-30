" Date last modified : Tue 29 Nov 20:28:14 GMT 2016
set nocompatible
set esckeys

silent function! WINDOWS()
    return  (has('win32') || has('win64'))
endfunction

if WINDOWS()
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    set guifont=Consolas:h14:cANSI
endif

"let g:python_host_prog='/opt/intel/intelpython27/bin/python'
call plug#begin()
     Plug 'flazz/vim-colorschemes'
     Plug 'vim-airline/vim-airline'
     Plug 'vim-airline/vim-airline-themes'
     "Plug 'daeyun/vim-matlab' "works only in neovim
     Plug 'szw/vim-g' "Googling in vim
     Plug 'tpope/vim-surround'
     Plug 'tommcdo/vim-exchange'
    "Plug 'numkil/ag.nvim' "works only in nvim
    "Plug 'Chiel92/vim-autoformat'           "enable as and when required
     Plug 'terryma/vim-smooth-scroll'
    "Plug 'mhinz/vim-grepper'
    "Plug 'w0rp/ale'
     Plug 'rhysd/clever-f.vim'
     Plug 'terryma/vim-expand-region'
    "Plug 'jez/vim-superman'    "for unix-like systems only
     Plug 'mhinz/vim-startify'
     Plug 'godlygeek/tabular'
     Plug 'nathanaelkane/vim-indent-guides'
    "Plug 'Yggdroot/indentLine'
    "Plug 'bkad/CamelCaseMotion'
     Plug 'sjl/gundo.vim'
     Plug 'Raimondi/delimitMate'
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "Plug 'luochen1990/rainbow'
     Plug 'tpope/vim-commentary'
     Plug 'sickill/vim-pasta'
     Plug 'bling/vim-bufferline'
     Plug 'ervandew/supertab'
     Plug 'tpope/vim-fugitive'
     Plug 'junegunn/gv.vim'
     Plug 'airblade/vim-gitgutter'
    "Plug 'jlanzarotta/bufexplorer.vim'
     Plug 'dhruvasagar/vim-table-mode'
     Plug 'tpope/vim-repeat'
     Plug 'tpope/vim-speeddating'
     Plug 'junegunn/vim-peekaboo'
     Plug 'junegunn/vim-slash'
     Plug 'junegunn/vim-emoji'
     Plug 'beloglazov/vim-online-thesaurus'
     Plug 'junegunn/vim-lengthmatters'
     Plug 'kshenoy/vim-signature'
     Plug 'machakann/vim-highlightedyank'
    "vim-easy-align
    "auto-pairs
    "roman/golden-ratio
    "fontzoom
    "http://vimawesome.com/plugin/vim-devicons
    "limelight.vim
    "junegunn/vim-fnr
    "yank ring/stack
    "Ultisnips
    "vim-sensible on a remote box
    "Awesome terminal fonts
call plug#end()


" camelCase attemptUnited manchesterUnited
filetype on
filetype plugin indent on

"colorscheme gruvbox
colorscheme Tomorrow-Night  "(mango, vim-kolor,base16, molokai, wombat, mustang, railscasts, lucario, vim-atom-dark )
let g:airline_theme='base16'
" let g:airline_theme='papercolor'

set path+=**                     "Find will start working (under the current directory)
set suffixesadd=.py,.m,.mat      "Find will work harder

if has('persistent_undo')
    set undofile
    set undolevels=1000
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif


"let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1 "only nvim
" Use true color feature
"let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
set termguicolors
set t_Co=256

set history=1000               " store lots of :cmdline history
set incsearch                  " search as characters are entered
set backspace=indent,eol,start " Make backspace behave in a sane manner.

set noshowmatch                  " when on a [{(, highlight the matching )}]
set cpoptions-=m    " Highlight when CursorMoved
set matchpairs+=<:> " Highlight <>
set matchtime=1
set hlsearch                   " highlight search matches

set expandtab                  " Convert all TAB characters in the file to spaces
if has('mouse') | set mouse=a | endif"+
set mousehide

set number                     " Visible line numbering
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

set cursorline                 " highlight current line

syntax on

" Exit terminal mode
"tnoremap <Esc> <C-\><C-n>

" Don't try to highlight lines longer than 1000 characters
set synmaxcol=300   "Boost performance in rendering long lines

" Make ESC respond faster
"set ttimeout
"set ttimeoutlen=50

" Lower the delay of escaping out of other modes
" keycode times out fast, mapping times out in a bit more time
set timeout timeoutlen=1000 ttimeout ttimeoutlen=1

set visualbell               " Use visual bell instead of beeping
set nomodeline               " Don't parse modelines because of vim modeline vulnerability

set encoding=utf-8           " Default encoding for saving and reading file
scriptencoding utf-8

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set iskeyword-=!                    " '!' is an end of word designator

set autochdir
set autowrite                       " Automatically write a file when leaving a modified buffer
set autoread                        " Autoread when a file is changed from outside

set history=1000                    " Store a ton of history (default is 20)
set spell                           " Spell checking on

set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility

set fileformat=unix          " Default fileformat
set fileformats=unix,dos,mac

" Enable virtualedit in visual block mode
set virtualedit=all

set hidden      " Allow changing buffer without saving it first

set infercase   " Ignore case on insert completion
set ignorecase  " Ignore case search for normal letters
set smartcase   " Do case-sensitive search if pattern contains upper case letters

" Default indent settings
set tabstop=4 shiftwidth=4
set softtabstop=4
set smarttab

set shiftround  " Round indent by shiftwidth
set expandtab   " Expand tab to space

set foldmethod=indent   " Fold by indent
set foldlevel=1         " Starting fold level
set foldnestmax=20      " Deepest fold is 20 levels
set foldlevelstart=99   " Open all folds by default
set nofoldenable        " Disable fold by default

set foldmethod=indent   " Fold by indent
set foldlevel=1         " Starting fold level
set foldnestmax=20      " Deepest fold is 20 levels
set foldlevelstart=99   " Open all folds by default
set nofoldenable        " Disable fold by default


" Turn off swapfile and backup
set noswapfile
set nobackup
set nowritebackup


set scrolloff=3               " Minimal number of screen lines to keep above and below the cursor
set sidescroll=3              " The minimal number of columns to scroll horizontally
set sidescrolloff=5           " The minimal number of screen columns to keep to the left and to the right of the cursor

if has('conceal')
    set listchars+=conceal:^
    set conceallevel=1 concealcursor=i
endif

hi link HelpBar Normal
hi link HelpStar Normal

" Wrap conditions
set whichwrap+=h,l,<,>,[,],b,s,~
set nowrap

set textwidth=100
if has('linebreak')
    set linebreak                   " Wrap lines at convenient point
    let &showbreak='↪ '
    set breakat=\ \ ;:,!?
    if exists('+breakindent')
        set breakindent
    endif
endif

set cmdheight=2                 " Height of command-line (easy-readable)


" Completion settings in insert mode
set completeopt=longest,menuone
set complete=.,w,b,u,t,i,kspell ". till i is the default. . = current buffer. w  = any other windows, b = any other buffers opened, u = unopened buffers, t = tags, i = current and included files
"kspell = k means also look in the dictionary, kspell is the same, but only
"look up when spell-check is enabled

set ttyfast
set pumheight=20                " Set popup menu max height

set wildmode=list:longest,full
" Ignore the following stuff when tab completing
set wildignore+=.hg,.git,.svn,*.o,*.obj,*.pyc,*.luac,*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.pdf,*.class,*.dmg,*.DS_Store,*.lnk,*.ini,*.dats


"Adjust window size of preview and help
set previewheight=8
set helpheight=12

set nostartofline               " The cursor is kept in the same column (ifpossible)

set splitbelow                  " Splitting a window will put the new window below the current one
set splitright                  " Splitting a window will put the new windowright the current one

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif
"

" CTRL-V: Paste from clipboard
cnoremap <C-V> <C-R>+
"
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

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

set tabpagemax=15

set showmode                    " Display the current mode


highlight clear SignColumn      " SignColumn should match background

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd
endif

if has('statusline')
    set laststatus=2
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

set noerrorbells
set vb
set t_vb=

set winminheight=0              " Windows can be 0 line high

set wildmenu

set scrolljump=5                " How many lines to scroll at a time, make scrolling appears faster

set report=0
set updatecount=0
set updatetime=250             "Use a low updatetime. This is used by Cursorhold

function! HLNext (blinktime)
    set invcursorline
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    set invcursorline
endfunction

nnoremap <silent> n   n:call HLNext(0.3)<cr>
nnoremap <silent> N   N:call HLNext(0.3)<cr>

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set autoindent
set smartindent
autocmd FileType c,cpp :set cindent

set nojoinspaces
nnoremap : ;
nnoremap ; :
nnoremap Y y$
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nmap <leader><space> ;nohls<CR>

inoremap <C-c> <Esc>

" listchar=trail is not as flexible, use the below to highlight trailing whitespace
func! ShowTrailingWS()
    highlight ExtraWhitespace ctermbg=yellow guibg=yellow
    match ExtraWhitespace /\s\+$/
endfunc
nnoremap <F6> :call ShowTrailingWS()<CR>

"Remove all trailing whitespace by pressing F7
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
nnoremap <F7> :call DeleteTrailingWS()<CR>

set guioptions-=m
set guioptions-=r
set guioptions-=T
set guicursor+=a:blinkon0

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
"
" " Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

if has("autocmd")
    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" nnoremap <silent> <Plug>TransposeCharacters xp
"             \:call repeat#set("\<Plug>TransposeCharacters")<CR>
" nmap cp <Plug>TransposeCharacters

" -------- vim-smooth-scrolling remaps ---------------------
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"---------- ale linter config --------------------------------
let g:ale_linters = {
\   'MATLAB'   : ['mlint'],
\   'Vim'      : ['vint'],
\   'Text'     : ['proselint'],
\   'Tex'      : ['proselint'],
\   'Python'   : ['pylint'],
\   'Markdown' : ['proselint'],
\   'HTML'     : ['HTMLlint'],
\}

"-------------clever-f plugin options ---------------------------
"g:clever_f_ignore_case = 1
"

" indent-guides plugin configs ------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" indent line plugin config -------
let g:indentLine_setColors = 0  "highlight conceal colour with colorscheme
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1

" ------camelcase motion plugin ----------------------------------
"call camelcasemotion#CreateMotionMappings('<leader>')

" ----- gundotoggle hotkey ---------------------------------------
nnoremap <F3> :GundoToggle<CR>

" -------deoplete settings
let g:deoplete#enable_at_startup = 1

" -----Rainbow parantheses ----------------------------------------
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"-------highlted  yank setting only for vim , not required in neovim"
map y <Plug>(highlightedyank)
let g:highlightedyank_highlight_duration = 400
