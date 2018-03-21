if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs 
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
source ~/xvim_common_vimplug_calls
source ~/nvimplug_calls
call plug#end()

set undodir=~/.local/share/nvim/undo
if empty(glob(&undodir))
	:call mkdir(&undodir,'&p')
endif
set undofile

source ~/xvim_common_settings
source ~/xvim_common_plugin_mappings

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
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
