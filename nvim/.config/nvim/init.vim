if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        augroup vimplug
            autocmd!
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        augroup END
endif

call plug#begin('~/.local/share/nvim/plugged')
    source ~/xvim_common_vimplug_calls.vim
    source ~/nvimplug_calls.vim
call plug#end()

set undodir=~/.local/share/nvim/undo
if empty(glob(&undodir))
    :call mkdir(&undodir,'&p')
endif

source ~/xvim_common_settings.vim
source ~/xvim_common_plugin_mappings.vim
source ~/dotfiles/xvim_common/minivimrc
" set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-v><Esc> <Esc>
    augroup FZFNvim
        autocmd!
        autocmd TermOpen */*fzf* tnoremap <buffer><c-k> <UP>
        autocmd TermOpen */*fzf* tnoremap <buffer><c-j> <DOWN>
    augroup END
endif

" in the absence of a neovim specific colorscheme
"if has('nvim')
"  highlight! link TermCursor Cursor
" highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
"endif

if has('nvim')
    tnoremap <M-h> <c-\><c-n><c-w>h
    tnoremap <M-j> <c-\><c-n><c-w>j
    tnoremap <M-k> <c-\><c-n><c-w>k
    tnoremap <M-l> <c-\><c-n><c-w>l
endif


if has('nvim') && executable('nvr')
    let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif
let g:python_host_prog='/usr/bin/python2'

if exists('&inccommand')
    set inccommand=split
endif

