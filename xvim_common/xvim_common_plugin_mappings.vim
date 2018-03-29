command! PU PlugUpdate | PlugUpgrade
nnoremap <C-p> :<C-u>FZF<CR>


" For JavaScript files, use `eslint` (and only eslint)
let g:ale_linters = {
            \   'javascript': ['eslint'],
            \ }

" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1                " default
let g:ale_lint_on_enter = 1               " default
" let g:ale_lint_on_filetype_changed = 1    " default
let g:ale_sign_column_always = 1

let g:grepper       = {}
let g:grepper.tools = ['grep', 'git', 'rg']

" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>

" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

function! SetupCommandAlias(input, output)
    exec 'cabbrev <expr> '.a:input
                \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
                \ .'? ("'.a:output.'") : ("'.a:input.'"))'
endfunction
call SetupCommandAlias("grep", "GrepperGrep")

" Open Grepper-prompt for a particular Grep-alike tool
nnoremap <Leader>g :Grepper -tool git<CR>
nnoremap <Leader>G :Grepper -tool rg<CR>

let g:polyglot_disabled = ['latex']

autocmd FileType javascript,css,matlab,octave,c,cpp nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
autocmd FileType javascript,css,matlab,octave,c,cpp imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)

let g:cosco_ignore_comment_lines = 1     " Default : 0
let g:cosco_filetype_whitelist = ['php', 'javascript']
let g:cosco_filetype_blacklist = ['vim', 'bash']
let g:auto_comma_or_semicolon = 1     " Default : 0

let g:better_whitespace_enabled=1
" let g:strip_whitespace_on_save=1

nnoremap <leader>s :ToggleWorkspace<CR>
" let g:workspace_autosave_always = 1

let g:indentguides_ignorelist = ['text']

let g:diminactive_use_syntax = 1
let g:diminactive_enable_focus = 1
let g:diminactive_filetype_whitelist = ['dirvish']
let g:diminactive_filetype_blacklist = ['startify']
let g:diminactive_buftype_blacklist = ['nofile', 'nowrite', 'acwrite', 'quickfix', 'help']

let g:vimtex_compiler_progname = 'nvr'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" nnoremap <leader>gu :MundoToggle<CR>
nnoremap <leader>gu :UndotreeToggle<CR>

let g:palenight_terminal_italics=1
let g:airline_theme='onedark'

xnoremap iz :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zv[z<cr>
xnoremap az :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zV[z<cr>

let g:matchup_transmute_enabled = 1
let g:matchup_matchparen_deferred = 1
let g:matchup_override_vimtex = 1


function! s:fzf_statusline()
    " Override statusline as you like
    highlight fzf1 ctermfg=161 ctermbg=251
    highlight fzf2 ctermfg=23 ctermbg=251
    highlight fzf3 ctermfg=237 ctermbg=251
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
            \ call fzf#vim#grep(
            \   'git grep --line-number '.shellescape(<q-args>), 0,
            \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
            \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
            \ call fzf#vim#ag(<q-args>,
            \                 <bang>0 ? fzf#vim#with_preview('up:60%')
            \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
            \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'),
            \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'


" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }


let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
runtime macros/sandwich/keymap/surround.vim
let g:columnmove_strict_wbege = 0

  " Configure deoplete so that it uses tabs
  inoremap <silent><expr><Tab> pumvisible() ? "\<C-n>"
        \ : (<SID>is_whitespace() ? "\<Tab>" : deoplete#mappings#manual_complete())
  inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"


  " Configure deoplete to work with LaTeX
  " if !exists('g:deoplete#omni#input_patterns')
  "     let g:deoplete#omni#input_patterns = {}
  " endif
  " let g:deoplete#omni#input_patterns.tex = '\\(?:'
  "       \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
  "       \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
  "       \ . '|hyperref\s*\[[^]]*'
  "       \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
  "       \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
  "       \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
  "       \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
  "       \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
  "       \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
  "       \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
  "       \ . '|\w*'
  "       \ .')'

autocmd InsertEnter * call deoplete#enable()

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" deoplete + neosnippet + autopairs changes
let g:AutoPairsMapCR=0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_smart_case = 1
imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"
