set nocompatible

set guifont=DejaVu_Sans_Mono:h16 " firacode, deja vu, hack, source code pro, monaco, input 

call plug#begin()
     " visual pizzazz
     Plug 'flazz/vim-colorschemes'
     Plug 'vim-airline/vim-airline'
     Plug 'vim-airline/vim-airline-themes'

     " Python-specific
     Plug 'davidhalter/jedi-vim'
     Plug 'nvie/vim-flake8'

     Plug 'Yggdroot/indentLine'

     Plug 'haya14busa/incsearch.vim' " Better incsearch than vim's default. Further mappings present later in this file
     Plug 'tpope/vim-surround'
     Plug 'tommcdo/vim-exchange'
     Plug 'yuttie/comfortable-motion.vim' "Physics-based scrolling there are also accelerated smooth scrolling plugins available. 
     Plug 'mhinz/vim-startify'
     Plug 'godlygeek/tabular'
     Plug 'sjl/gundo.vim'
     Plug 'tpope/vim-commentary'
     Plug 'kshenoy/vim-signature'
     Plug 'machakann/vim-highlightedyank'
     Plug 'jiangmiao/auto-pairs'
     Plug 'wellle/targets.vim'
call plug#end()

"set incsearch                  " Not reqd if incsearch plugin is installed

filetype plugin indent on

colorscheme gruvbox
"colorscheme Tomorrow-Night  "(mango, vim-kolor,base16, molokai, wombat, mustang, railscasts, lucario, vim-atom-dark )
let g:airline_theme='base16'
" let g:airline_theme='papercolor'

set path+=**                     "Find will start working (under the current directory)
set suffixesadd=.py,.m,.mat      "Find will work harder for these filetypes

if has('persistent_undo')
    set undofile
    set undolevels=1000
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

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
set termguicolors
set t_Co=256

set history=1000               " store lots of :cmdline history
set backspace=indent,eol,start " Make backspace behave in a sane manner.

set noshowmatch                  " when on a [{(, highlight the matching )}]
set cpoptions-=m    " Highlight when CursorMoved
set matchpairs+=<:> " Highlight <>
set matchtime=1
" set hlsearch                   " highlight search matches, now controlled by the incsearch plugin

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
set scrollbind
set cursorbind

syntax on

" Exit terminal mode
"tnoremap <Esc> <C-\><C-n>

" Don't try to highlight lines longer than 1000 characters
set synmaxcol=300   "Boost performance in rendering long lines

" Make ESC respond faster
" Lower the delay of escaping out of other modes
" keycode times out fast, mapping times out in a bit more time
set ttimeout
set ttimeoutlen=0
set timeout
set timeoutlen=1000

set spelllang=en_gb
syntax spell toplevel


set visualbell               " Use visual bell instead of beeping
set nomodeline               " Don't parse modelines because of vim modeline vulnerability

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

set autochdir
set autowrite                       " Automatically write a file when leaving a modified buffer
set autoread                        " Autoread when a file is changed from outside

set history=1000                    " Store a ton of history (default is 20)
"set spell                           " Spell checking on
" Enable spellchecking for Markdown files and git commit messages

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
set noundofile

set scrolloff=3               " Minimal number of screen lines to keep above and below the cursor
set sidescroll=3              " The minimal number of columns to scroll horizontally
set sidescrolloff=5           " The minimal number of screen columns to keep to the left and to the right of the cursor

if has('conceal')
    set listchars+=conceal:^
    set conceallevel=1 concealcursor=i
endif
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" Shortcut to rapidly toggle `set list`
nnoremap <leader>l :set list!<CR>

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

set nostartofline               " The cursor is kept in the same column (if possible)

set splitbelow                  " Splitting a window will put the new window below the current one
set splitright                  " Splitting a window will put the new windowright the current one

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

" CTRL-V: Paste from clipboard
cnoremap <C-V> <C-R>+

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
highlight Comment cterm=italic  " make comments in code to be italic

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

set nojoinspaces

nnoremap : ;
nnoremap ; :
nnoremap Y y$
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T     

" " --------------------
" " Function: Open tag under cursor in new tab
" " Source:   http://stackoverflow.com/questions/563616/vimctags-tips-and-tricks
" "--------------------
" map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" "--------------------
" " Function: Remap keys to make it more similar to firefox tab functionality
" " Purpose:  Because I am familiar with firefox tab functionality
" "--------------------
" ;ap     <C-T>       :tabnew<CR>
" map     <C-N>       :!vim &<CR><CR>
" map     <C-W>       :confirm bdelete<CR>)"

nmap <leader><space> ;nohls<CR>

inoremap <C-c> <Esc>

" " listchar=trail is not as flexible, use the below to highlight trailing whitespace
" func! ShowTrailingWS()
"     highlight ExtraWhitespace ctermbg=yellow guibg=yellow
"     match ExtraWhitespace /\s\+$/
" endfunc
" nnoremap <F6> :call ShowTrailingWS()<CR>

function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction 

nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

"Remove all trailing whitespace by pressing F7
"nnoremap <F7> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

set guioptions-=m
set guioptions-=r
set guioptions-=T
set guicursor+=a:blinkon0

"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
if has("autocmd")
    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType c,cpp :set cindent
    autocmd FileType markdown setlocal spell
    autocmd FileType gitcommit setlocal spell
    autocmd FileType python nnoremap <buffer> <F9> :exec '!clear;python' shellescape(@%, 1)<cr>
    autocmd BufEnter * silent! normal! g`"
    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml
    " automatically rebalance windows on vim resize
    autocmd VimResized * :wincmd =
    au BufNewFile,BufRead *.py "(PEP8 indentation)
        \ set tabstop=4
        \ set softtabstop=4
        \ set shiftwidth=4
        \ set textwidth=79
        \ set expandtab
        \ set autoindent
        \ set fileformat=unix
    au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/ "We can have VIM flag that for us so that it’s easy to spot – and then remove.
    au BufAdd,BufNewFile * nested tab sball "To open each buffer in its own tabpage
endif

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"



" -------- vim-smooth-scrolling remaps ---------------------
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"---------- Ale linter config --------------------------------
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

" indent-guides plugin configs ------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" indent line plugin config -------
let g:indentLine_setColors = 0  "highlight conceal colour with colorscheme
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1

" ------camelcase motion plugin ----------------------------------
" call camelcasemotion#CreateMotionMappings('<leader>')

" ----- gundotoggle hotkey ---------------------------------------
nnoremap <F3> :GundoToggle<CR>

" -------deoplete settings
let g:deoplete#enable_at_startup = 1

" -----Rainbow parantheses ----------------------------------------
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"-------highlted  yank setting only for vim , not required in neovim"
"map y <Plug>(highlightedyank)
let g:highlightedyank_highlight_duration = 400

"----open-browser plugin -----------------------------
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)


"----- incsearch.vim plugin ----------------------------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

