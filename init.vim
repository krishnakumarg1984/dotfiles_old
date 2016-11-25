set nocompatible
set esckeys

filetype on
filetype plugin indent on

call plug#begin()
    Plug 'flazz/vim-colorschemes'
    Plug 'daeyun/vim-matlab'
call plug#end()

colorscheme gruvbox


if has('persistent_undo')
    set undofile
    set undolevels=1000
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif


let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
" Use true color feature
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
set termguicolors

set history=1000               " store lots of :cmdline history
set incsearch                  " search as characters are entered
set backspace=indent,eol,start " Make backspace behave in a sane manner.


set showmatch                  " when on a [{(, highlight the matching )}]
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
tnoremap <Esc> <C-\><C-n>

" Don't try to highlight lines longer than 1000 characters
set synmaxcol=1000

" Make ESC respond faster
set ttimeout
set ttimeoutlen=50

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


set autochdir
set autowrite                       " Automatically write a file when leaving a modified buffer
set autoread

set history=1000                    " Store a ton of history (default is 20)
set spell                           " Spell checking on

set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility


set fileformat=unix          " Default fileformat
set fileformats=unix,dos,mac

" Enable virtualedit in visual block mode
set virtualedit=all

set hidden

set infercase   " Ignore case on insert completion
set ignorecase  " Ignore case search for normal letters
set smartcase   " Do case-sensitive search if pattern contains upper case letters

" Default indent settings
set tabstop=4 shiftwidth=4
set softtabstop=4
set smarttab

set smartindent
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
set sidescroll=3                " The minimal number of columns to scroll horizontally
set sidescrolloff=5            " The minimal number of screen columns to keep to the left and to the right of the cursor

if has('conceal')
    set listchars+=conceal:^
    set conceallevel=2 concealcursor=i
endif

hi link HelpBar Normal
hi link HelpStar Normal

" Wrap conditions
set whichwrap+=h,l,<,>,[,],b,s,~
set nowrap

if has('linebreak')
	set linebreak                   " Wrap lines at convenient point
	let &showbreak='↪ '
	set breakat=\ \ ;:,!?
	if exists('+breakindent')
		set breakindent
	endif
endif

set cmdheight=2                 " Height of command-line (easy-readable)


" Completion settings
set completeopt=menuone
set complete=.,w,t

set ttyfast
set pumheight=20                " Set popup menu max height

set wildmode=list:longest,full
" Ingore the following stuff when tab completing
set wildignore+=.hg,.git,.svn,*.o,*.obj,*.pyc,*.luac,*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.pdf,*.class,*.dmg,*.DS_Store,*.lnk,*.ini,*.dat


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


set linespace=0                 " No extra spaces between rows<Paste>

set numberwidth=5

set magic

set noerrorbells
set t_vb=

set winminheight=0              " Windows can be 0 line high

set wildmenu

set scrolljump=5

set report=0
set updatecount=0

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

set nojoinspaces

nnoremap : ;
nnoremap ; :
nnoremap Y y$
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


nmap <leader><space> ;nohls<CR>
