set nocompatible
call plug#begin()
source ~\dotfiles\vim_stuff\common_xvim_plug_calls
Plug 'maralla/completor.vim'

call plug#end()

source ~\dotfiles\vim_stuff\common_xvim_settings
source ~\dotfiles\vim_stuff\common_xvim_plugin_mappings

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

set guifont=DejaVu_Sans_Mono:h13 " firacode, deja vu, hack, source code pro, monaco, input

if has('win32')
    let vimDir = 'C:\Users\kg314\Desktop\vimfiles'
    " For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
    set guioptions-=t
else
    let vimDir = '$HOME/.vim'
    set thesaurus+=/home/kg314/mthesaur.txt
endif

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undo')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
    set undolevels=1000
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

let &t_8f="\e[38;2;%ld;%ld;%ldm"
let &t_8b="\e[48;2;%ld;%ld;%ldm"
" set t_Co=256

set backspace=indent,eol,start " Make backspace behave in a sane manner.
set history=1000               " store lots of :cmdline history (default is 20)
set ttimeout
set timeoutlen=1000 " The time in milliseconds that is waited for a key code or mapped key sequence to complete.
" Show @@@ in the last line if it is truncated.
set display=truncate

" For VTE compatible terminals (urxvt, st, xterm, gnome-terminal 3.x and others)
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it confusing.
set nrformats-=octal

set nobackup
set nowritebackup
set ttyfast

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

cnoremap <C-V> <C-R>+ 		" CTRL-V: Paste from clipboard
set pastetoggle=<F12>       " pastetoggle (sane indentation on pastes)

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
    set shell=/bin/bash
endif

" nmap <silent><leader><space> ;nohls<CR>
set autochdir
