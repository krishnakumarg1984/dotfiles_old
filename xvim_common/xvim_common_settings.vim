set noexrc
filetype plugin indent on
if !has('g:syntax_on')|syntax enable|endif

" set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
"set copyindent          " copy the previous indentation on autoindenting
set autoread                        " Autoread when a file is changed from outside
set belloff=all
set cmdheight=2                 " Height of command-line (easy-readable)
set complete=.,w,b,u,t,i,kspell ". till i is the default. . = current buffer. w  = any other windows, b = any other buffers opened, u = unopened buffers, t = tags, i = current and included files
set completeopt=longest,menuone,noselect,preview
set display+=lastline
set fileformat=unix          " Default fileformat
set fileformats=unix,dos,mac
set foldenable
set formatoptions+=j
set hidden
set history=100            "make history remember 100 :-commands and searches
set hlsearch
set ignorecase  " Ignore case search for normal letters
set incsearch
set infercase   " Ignore case on insert completion
set isfname-={,}
set keywordprg=:help
set linespace=0                 " No extra spaces between rows
set listchars=tab:▸\
set magic                       " Make regex a little easier to type
set nojoinspaces
set nolist
set number
set numberwidth=5               " Width of the line-no. column
set pumheight=15                " Set popup menu max height
set relativenumber
set report=0                    " Threshold for reporting number of lines changed.
set scrolljump=5       " How many lines to scroll at a time, make scrolling appears faster (i.e. when you move the cursor close to the vertical limits of display, how many more lines to reveal ?)
set scrolloff=3        " Minimal number of screen lines to keep above and below the cursor
set showbreak=…
set showmatch
set sidescroll=3       " The minimal number of columns to scroll horizontally
set sidescrolloff=5    " The minimal number of screen columns to keep to the left and to the right of the cursor
set smartcase   " Do case-sensitive search if pattern contains upper case letters
set suffixesadd=.py,.m,.mat,.gv,.tex      "Find will work harder for these filetypes
set synmaxcol=300   "Boost performance in rendering long lines
set tabpagemax=15      " Maximum number of tab pages to be opened by the |-p| command line argument or the ":tab all" command. |tabpage|
set timeout       " time out on mappings and keycodes (stronger of the two conditions)
set timeoutlen=500
set title
set titleold=
set ttimeoutlen=0 " A non-negative number here will make the delay to be timeoutlen
set undofile
set updatecount=0               " After typing this many characters the swap file will be written to disk.  When zero, no swap file will be created at all (see chapter on recovery |crash-recovery|).  "
set updatetime=250              " milliseconds elapsed before which swap file will be written to disk (250 ms is recommende by gitgutter plugin)
set viewoptions=cursor,folds,slash,unix
set winminheight=0              " Windows can be 0 line high
set clipboard+=unnamed,unnamedplus

set wildmenu
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildmode=list:longest,full
" Ignore the following stuff when tab completing
set wildignore+=.hg,.git,.svn,*.o,*.obj,*.pyc,*.luac,*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.pdf,*.class,*.dmg,*.DS_Store,*.lnk,*.ini,*.dats

set wildignore=.git,*.pyc,*.o,*.a,*.swp,*.dll,*.obj,*.bak,*.exe,*.jpg,*.gif,*.png

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Ignore build dir
set wildignore+=build/*,media/*

" Ignore node modules
set wildignore+=node_modules/*,bower_components/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*
set wildignore+=.hg,.git,.svn,*.o,*.obj,*.pyc,*.luac,*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.pdf,*.class,*.dmg,*.DS_Store,*.lnk,*.ini,*.dats

set wildignore+=types_*taghl,tags

"Adjust window size of preview and help
set previewheight=8
set helpheight=12
set ttyfast

set nostartofline               " The cursor is kept in the same column (if possible)
set backspace=indent,eol,start

set splitbelow                  " Splitting a window will put the new window below the current one
set splitright                  " Splitting a window will put the new windowright the current one

set showmode                    " Display the current mode

if has('linebreak')
    set linebreak               " Wrap lines at convenient point (only affects the on-screen display, not actual content in file)
    let &showbreak='↪ '
    set breakat=\ \ ;:,!?
    if exists('+breakindent')
        set breakindent
    endif
endif

set t_ZH=[3m
set t_ZR=[23m

highlight clear SignColumn      " SignColumn should match background,SignColumn column where |signs| are displayed
highlight Comment cterm=italic

hi link HelpBar Normal
hi link HelpStar Normal

if exists('&inccommand')
    set inccommand=split
endif

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd
endif


" Vim needs a more POSIX compatible shell than fish for certain functionality
" to work, such as :%!, compressed help pages and many third-party addons.  If
" you use fish as your login shell or launch Vim from fish, you need to set
" shell to something else in your ~/.vimrc.
" Seriously... god dammit Vim.
if &shell =~# 'fish$'
    set shell=/usr/bin/sh
endif

" Only show cursorline in the current window and in normal mode.
augroup cline
    autocmd!

    autocmd WinLeave,InsertEnter * set nocursorline
    autocmd WinEnter,InsertLeave * set cursorline
augroup END

colorscheme gruvbox
set background=dark

highlight OverLength ctermfg=0 ctermbg=3
match OverLength /\%121v/

nnoremap <leader>q gqip

if (has("termguicolors"))
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
    set termguicolors
endif

nnoremap : ;
nnoremap ; :
nnoremap Y y$

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Move across wrapped lines like regular lines
noremap 0 ^
" Go to the first non-blank character of a line
noremap ^ 0
" Just in case you need to go to the very beginning of a line

source ~/ft_settings.vim

" nmap <leader>l :set list!<CR>

augroup disabletempundo
  autocmd!
  autocmd BufWritePre /tmp/* setlocal noundofile
augroup END

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

let g:netrw_liststyle=3 " Use tree-mode as default view
let g:netrw_browse_split=4 " Open file in previous buffer
let g:netrw_preview=1 " preview window shown in a vertically split
let g:netrw_winsize=20
let g:netrw_sort_options = 'i'
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_keepdir=0
let g:netrw_list_hide='\.un\~$'
let g:netrw_banner       = 0
let g:netrw_keepdir      = 0

" Visual line repeat {{{2
xnoremap . :normal .<CR>
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
    echo '@'.getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

nnoremap & :&&<Enter>
xnoremap & :&&<Enter>


:map k gk
:map j gj
:map <Up> gk
:map <Down> gj

nnoremap <Space> za

" Use sane regexes
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v


command! -nargs=* Wrap set wrap linebreak nolist

cnoremap <c-n>  <down>
cnoremap <c-p> <up>

:noremap <Leader>f :filetype detect<CR>
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

if exists('$TMUX')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

augroup FileChangedAlert
    " Helps if you have to use another editor on the same file
    autocmd! FileChangedShell * echoerr "File has been changed outside of Vim."
augroup END

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
xnoremap > >gv
xnoremap < <gvoremap w!! w !sudo tee > /dev/null %

set lazyredraw
set shortmess+=atI

vnoremap y myy`y
vnoremap Y myY`y

augroup reload_vimrc
    autocmd!
    autocmd! BufWritePost $MYVIMRC,$MYGVIMRC nested source %
    au FocusLost * :wa
augroup END

