call plug#begin('~/.local/share/nvim/plugged')
source /home/kg314/dotfiles/vim_stuff/common_xvim_plug_calls
Plug 'vifm/neovim-vifm'
" Plug 'c0r73x/neotags.nvim'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'poppyschmo/deoplete-latex',{'for':'tex'}
" Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'donRaphaco/neotex',{'for':'tex'}
Plug 'cloudhead/neovim-fuzzy'
" Plug 'cazador481/fakeclip.neovim'
Plug 'ervandew/supertab'
" Plug 'zchee/deoplete-jedi',{'for':'python'}
call plug#end()

source ~/dotfiles/vim_stuff/common_xvim_settings
source ~/dotfiles/vim_stuff/common_xvim_plugin_mappings

" Use deoplete.
let g:deoplete#enable_at_startup = 1

set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
" Use true color feature
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
set undofile

:au BufEnter * if &buftype == 'terminal' | :startinsert | endif
highlight TermCursor ctermfg=red guifg=red
tnoremap <Leader><ESC> <C-\><C-n>