"set guifont=DejaVu\ Sans\ Mono:h14:cANSI
set guifont=Consolas:h14:cANSI
silent function! OSX()
    return has('macunix')
endfunction
silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
    return  (has('win32') || has('win64'))
endfunction

set nocompatible        " Must be first line
filetype plugin indent on   " Automatically detect file types.

if !WINDOWS()
    set shell=/bin/sh
endif

if WINDOWS()
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

call plug#begin('~/.vim/plugged')
   Plug 'easymotion/vim-easymotion'
   Plug 'bling/vim-airline'
   Plug 'tpope/vim-sensible'
   Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
   Plug 'scrooloose/nerdtree'
   Plug 'scrooloose/nerdcommenter'
   "Plug 'godlygeek/tabular'
   Plug 'vim-airline/vim-airline-themes'
   "Plug 'jiangmiao/auto-pairs'
   ""Plug 'tyru/open-browser.vim'
   Plug 'junegunn/vim-peekaboo'
   Plug 'nathanaelkane/vim-indent-guides'
   Plug 'flazz/vim-colorschemes'
   "Plug 'gabrielelana/awesome-terminal-fonts'
   "Plug 'thinca/vim-fontzoom'
   "Plug 'wincent/terminus'
   "Plug 'wimproved.vim'
   "Plug 'https://github.com/JeroenMulkers/matvim'
    Plug 'jpalardy/vim-slime'
    Plug 'daeyun/vim-matlab'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'ervandew/supertab'
    Plug 'ervandew/supertab'
    Plug 'sickill/vim-pasta'
call plug#end()

autocmd vimenter * NERDTree

set runtimepath+=~/.vim/plugged/matvim/ftplugin/matlab/matvim.vim/
 " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" https://github.com/spf13/spf13-vim/issues/780
if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
    inoremap <silent> <C-[>OC <RIGHT>
endif

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

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

set nrformats=
hi CursorLineNr guifg=#050505

:au FocusLost * :wa
set t_Co=256


set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
nmap <leader><space> :nohls<CR>
:set conceallevel=0
hi link HelpBar Normal
hi link HelpStar Normal
syntax enable                   " Syntax highlighting
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set encoding=utf-8
scriptencoding utf-8

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

set autochdir
set autowrite                       " Automatically write a file when leaving a modified buffer

set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=all             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set modeline
set modelines=5
set go-=T
set selectmode+=mouse

set backup                  
if has('persistent_undo')
	set undofile                " So is persistent undo ...
	set undolevels=1000         " Maximum number of changes that can be undone
	set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

set tabpagemax=15               
set showmode                    " Display the current mode

set cursorline                  " Highlight current line

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
set backspace=indent,eol,start  " Backspace for dummies
set noantialias
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set numberwidth=5
set complete=.,w,t
set ttyfast
set showmatch                   " Show matching brackets/parenthesis
set lazyredraw
set magic
set noerrorbells
set visualbell
set t_vb=
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set cmdheight=2
set wildmode=list:longest,list:full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set sidescrolloff=3             "Keep atleast 5 liness left/right
set foldenable                  " Auto fold code
set foldlevelstart=10           " open most folds by default
set foldnestmax=10              "10 nested fold max
set foldmethod=indent           "fold based on indent level"
set list
set listchars=tab:>~,trail:•,extends:#,nbsp:_	" Highlight problematic whitespace
set nostartofline
set report=0
set updatecount=100

nnoremap <silent> n   n:call HLNext(0.3)<cr>
nnoremap <silent> N   N:call HLNext(0.3)<cr>

function! HLNext (blinktime)
  set invcursorline
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  set invcursorline
endfunction


highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
"colorscheme summerfruit256
colorscheme github
let g:airline_theme='papercolor'
"let g:airline_powerline_fonts = 1
autocmd FileType text setlocal textwidth=78
set nowrap                      " Do not wrap long lines
"set autoindent                  " Indent at the same level of the previous line
autocmd FileType c,cpp :set cindent
set smartindent
set autoread
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set smarttab
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set matchpairs+=<:>             " Match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

":abbreviate <leader>pycl ######################################################################
:abbreviate KG Krishnakumar Gopalakrishnan

nnoremap : ;
nnoremap ; :
nnoremap Y y$
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
packadd! matchit
set viminfo='1000,f1,<500
"func! DeleteTrailingWS()
"  exe "normal mz"
"  %s/\s\+$//ge
"  exe "normal `z"
"endfunc
"autocmd BufWrite *.py :call DeleteTrailingWS()
