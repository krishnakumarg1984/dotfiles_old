" vim:ft=vim:norl:
call plug#begin('~/.local/share/nvim/plugged')
if has('win32')
    source ~\dotfiles\vim_stuff\common_xvim_plug_calls
else
    source ~/dotfiles/vim_stuff/common_xvim_plug_calls
endif
Plug 'nhooyr/neoman.vim'
" Plug 'vifm/neovim-vifm'
" Plug 'c0r73x/neotags.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'poppyschmo/deoplete-latex',{'for':'tex'}
" Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'donRaphaco/neotex',{'for':'tex'}
" Plug 'cloudhead/neovim-fuzzy'
" Plug 'cazador481/fakeclip.neovim'
" Plug 'zchee/deoplete-jedi',{'for':'python'}
call plug#end()

if has('win32')
    source ~\dotfiles\vim_stuff\common_xvim_settings
    source ~\dotfiles\vim_stuff\common_xvim_plugin_mappings
else
    source ~/dotfiles/vim_stuff/common_xvim_settings
    source ~/dotfiles/vim_stuff/common_xvim_plugin_mappings
endif

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
" Use true color feature
"let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
set undofile

:au BufEnter * if &buftype == 'terminal' | :startinsert | endif
highlight TermCursor ctermfg=red guifg=red

if has('nvim')
    " start terminal in vertical split
    nnoremap <leader>t :vs<CR>:te<CR>A
    " " exit from terminal mode using ESC key
    if empty($TMUX)
        tnoremap <C-s> <C-\><C-n>
    endif
    tnoremap <A-k><A-j> <C-\><C-n>
    tnoremap <C-q> <C-\><C-n>
    tnoremap <ESC> <C-\><C-n>
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
endif

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

let g:UltiSnipsSnippetDirectories = ["~/.local/share/nvim/plugged/vim-snippets/UltiSnips/", "~/.local/share/nvim/plugged/wmgraphviz.vim/snippets/"]
call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
let g:deoplete#sources = ['ultisnips', 'file', 'buffer']
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:deoplete#sources#syntax#min_keyword_length = 2

set completeopt=longest,menuone,preview
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" set guicursor=n-v-c:block-nCursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
" hi Cursor guifg=black guibg=green gui=reverse
set guicursor=v:block-nCursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,n-c:block-Cursor/nCursor-blinkwait300-blinkon200

" let g:WMGraphviz_dot2texoptions = '-tmath --preproc'
" let g:WMGraphviz_dot2texoptions = '-tmath --autosize --graphstyle=">=stealth"'
let g:WMGraphviz_dot2texoptions = '-ftikz -tmath --tikzedgelabels --preproc --autosize --graphstyle=">=stealth"'
" let g:WMGraphviz_dot2texoptions = '-tmath'
"
let g:vimtex_compiler_progname='nvr'
set inccommand=nosplit

" Define a group for autocommands
augroup vimrc
    autocmd!
augroup END

if exists(':terminal')
    tnoremap <expr> <C-\><C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

    autocmd vimrc TermOpen * nnoremap <buffer> I I<C-a>
    autocmd vimrc TermOpen * nnoremap <buffer> A A<C-e>
    autocmd vimrc TermOpen * nnoremap <buffer> C i<C-k>
    autocmd vimrc TermOpen * nnoremap <buffer> D i<C-k><C-\><C-n>
    autocmd vimrc TermOpen * nnoremap <buffer> cc i<C-e><C-u>
    autocmd vimrc TermOpen * nnoremap <buffer> dd i<C-e><C-u><C-\><C-n>
endif

" https://github.com/neovim/neovim/pull/2076#issuecomment-76998265
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l
vnoremap <a-h> <c-\><c-n><c-w>h
vnoremap <a-j> <c-\><c-n><c-w>j
vnoremap <a-k> <c-\><c-n><c-w>k
vnoremap <a-l> <c-\><c-n><c-w>l
inoremap <a-h> <c-\><c-n><c-w>h
inoremap <a-j> <c-\><c-n><c-w>j
inoremap <a-k> <c-\><c-n><c-w>k
inoremap <a-l> <c-\><c-n><c-w>l
cnoremap <a-h> <c-\><c-n><c-w>h
cnoremap <a-j> <c-\><c-n><c-w>j
cnoremap <a-k> <c-\><c-n><c-w>k
cnoremap <a-l> <c-\><c-n><c-w>l
if has('nvim')
    :tnoremap <A-h> <C-\><C-N><C-w>h
    :tnoremap <A-j> <C-\><C-N><C-w>j
    :tnoremap <A-k> <C-\><C-N><C-w>k
    :tnoremap <A-l> <C-\><C-N><C-w>l
    :inoremap <A-h> <C-\><C-N><C-w>h
    :inoremap <A-j> <C-\><C-N><C-w>j
    :inoremap <A-k> <C-\><C-N><C-w>k
    :inoremap <A-l> <C-\><C-N><C-w>l
    :nnoremap <A-h> <C-w>h
    :nnoremap <A-j> <C-w>j
    :nnoremap <A-k> <C-w>k
    :nnoremap <A-l> <C-w>l
endif
