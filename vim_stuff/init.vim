call plug#begin('~/.local/share/nvim/plugged')
source /home/kg314/dotfiles/vim_stuff/common_xvim_plug_calls
Plug 'nhooyr/neoman.vim'
" Plug 'vifm/neovim-vifm'
" Plug 'c0r73x/neotags.nvim'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'poppyschmo/deoplete-latex',{'for':'tex'}
" Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'donRaphaco/neotex',{'for':'tex'}
" Plug 'cloudhead/neovim-fuzzy'
" Plug 'cazador481/fakeclip.neovim'
" Plug 'ervandew/supertab'
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

if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = '\\(?:'
	\ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
	\ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
	\ . '|hyperref\s*\[[^]]*'
	\ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
	\ . '|(?:include(?:only)?|input)\s*\{[^}]*'
	\ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
	\ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
	\ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
	\ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
	\ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
	\ . '|\w*'
	\ .')'

call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
let g:deoplete#sources = ['ultisnips', 'file', 'buffer']
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:deoplete#sources#syntax#min_keyword_length = 2

set completeopt=longest,menuone,preview
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" set guicursor=n-v-c:block-nCursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
" hi Cursor guifg=black guibg=green gui=reverse
set guicursor=v:block-nCursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,n-c:block-Cursor/nCursor-blinkwait300-blinkon200

let g:plug_threads = 1