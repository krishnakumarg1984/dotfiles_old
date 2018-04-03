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
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
let g:ale_statusline_format = ['Errors: %d', 'Warnings: %d', '']


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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nnoremap <leader>gu :GundoToggle<CR>
" nnoremap <leader>gu :UndotreeToggle<CR>

let g:palenight_terminal_italics=1
let g:airline_theme='onedark'

xnoremap iz :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zv[z<cr>
xnoremap az :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zV[z<cr>

let g:matchup_transmute_enabled = 1
let g:matchup_matchparen_deferred = 1
let g:matchup_override_vimtex = 1
let g:matchup_matchparen_status_offscreen = 0


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
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
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


let g:deoplete#omni#input_patterns.tex = '\\(?:'
            \ . '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*'
            \ . '{[^}]*|(text|block)cquote\*?(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
            \ . '|(for|hy)\w*cquote\*?{[^}]*}(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
            \ . '|\w*ref(?:\s*\{[^}]*'
            \ . '|range\s*\{[^,}]*(?:}{)?)'
            \ . '|hyperref\s*\[[^]]*'
            \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
            \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
            \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
            \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
            \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
            \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
            \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
            \ . '|begin(\s*\[[^]]*\])?\s*\{[^}]*'
            \ . '|end(\s*\[[^]]*\])?\s*\{[^}]*'
            \ . '|\w*'
            \ . ')'

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


if has('timers')
    " Blink 2 times with 50ms interval
    noremap <expr> <plug>(slash-after) 'zz'.slash#blink(2, 50)
endif

" vim-airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline_left_sep          = '▶'
    let g:airline_left_alt_sep      = '»'
    let g:airline_right_sep         = '◀'
    let g:airline_right_alt_sep     = '«'
    let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
    let g:airline#extensions#readonly#symbol   = '⊘'
    let g:airline#extensions#linecolumn#prefix = '¶'
    let g:airline#extensions#paste#symbol      = 'ρ'
    let g:airline_symbols.linenr    = '␊'
    let g:airline_symbols.branch    = '⎇'
    let g:airline_symbols.paste     = 'ρ'
    let g:airline_symbols.paste     = 'Þ'
    let g:airline_symbols.paste     = '∥'
    let g:airline_symbols.whitespace = 'Ξ'
else
    let g:airline#extensions#tabline#left_sep = '暭'
    let g:airline#extensions#tabline#left_alt_sep = '噍'

    " powerline symbols
    let g:airline_left_sep = '暭'
    let g:airline_left_alt_sep = '噍'
    let g:airline_right_sep = '噏'
    let g:airline_right_alt_sep = '磱'
    let g:airline_symbols.branch = '䳭'
    let g:airline_symbols.readonly = '琗'
    let g:airline_symbols.linenr = '启'
endif

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_generate_on_new = 0
let g:gutentags_file_list_command = {
            \ 'markers': {
            \   '.git': 'git ls-files',
            \   '.hg': 'hg files',
            \ },
            \}


let g:tex_stylish = 1
let g:tex_conceal = ''
let g:tex_flavor = 'latex'
let g:tex_isk='48-57,a-z,A-Z,192-255,:'

let g:vimtex_complete_close_braces = 1
" let g:vimtex_complete_img_use_tail = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_format_enabled = 1
" let g:vimtex_imaps_leader = '\|'
let g:vimtex_index_split_pos = 'full'
let g:vimtex_quickfix_method='pplatex'
let g:vimtex_quickfix_open_on_warning = 1
let g:vimtex_toc_fold = 1
let g:vimtex_toc_hotkeys = {'enabled' : 1}
let g:vimtex_view_automatic = 0
let g:vimtex_view_forward_search_on_start = 0
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_use_temp_files=1

augroup vimtex
    autocmd!
    autocmd BufWritePost *.tex call vimtex#labels#refresh()
    autocmd BufWritePost *.tex call vimtex#toc#refresh()
augroup END
" autocmd BufReadPre *.tex let b:vimtex_main = 'thesis.tex'
autocmd! User VimtexEventInitPost Limelight 0.4
autocmd! User VimtexEventQuit Limelight!

augroup vimtex_event_1
    au!
    au User VimtexEventQuit     call vimtex#compiler#clean(0)
    au User VimtexEventInitPost call vimtex#compiler#compile()
augroup END

" Close viewers on quit
function! CloseViewers()
    if executable('xdotool') && exists('b:vimtex')
                \ && exists('b:vimtex.viewer') && b:vimtex.viewer.xwin_id > 0
        call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
    endif
endfunction

augroup vimtex_event_2
    au!
    au User VimtexEventQuit call CloseViewers()
augroup END

if has('nvim')
	let g:vimtex_compiler_progname = 'nvr'
endif

let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : '',
            \ 'options' : [
            \   '-pdf',
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \   '-shell-escape',
            \   '-bibtex',
            \ ],
            \}

let g:vimtex_delim_toggle_mod_list = [
            \ ['\left', '\right'],
            \ ['\mleft', '\mright'],
            \ ['\bigl', '\bigr'],
            \ ['\Bigl', '\Bigr'],
            \ ['\biggl', '\biggr'],
            \ ['\Biggl', '\Biggr'],
            \]

let g:vimtex_doc_handlers = ['MyHandler']
function! MyHandler(context)
    call vimtex#doc#make_selection(a:context)
    if !empty(a:context.selected)
        execute '!texdoc' a:context.selected '&'
    endif
    return 1
endfunction


if !executable('zeal') || exists('g:loaded_zeal') | finish | endif

let g:loaded_zeal = 1

let s:dict = {
            \ 'make' : 'make',
            \ 'markdown' : 'markdown',
            \ 'perl' : 'perl',
            \ 'python' : 'python',
            \ 'tex' : 'latex',
            \ 'sh' : 'bash',
            \ 'zsh' : 'bash',
            \}

" augroup zeal
"     autocmd!
"     for [s:ft, s:kwrd] in items(s:dict)
"         execute 'autocmd! FileType' s:ft
"                     \ 'nnoremap <silent><buffer> <leader>zz'
"                     \ ':silent !zeal ' . s:kwrd . ':<cword> 2>&1 >/dev/null &<cr>'
"     endfor
" augroup END

let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0, 'latex' : 0, 'text' : 0, 'pandoc' : 0,
            \ }

let g:grammarous#use_vim_spelllang = 1

let g:rsi_no_meta = 1

let g:tq_online_backends_timeout = 0.4

" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!
"
" nmap <Leader>L <Plug>(Limelight)
" xmap <Leader>L <Plug>(Limelight)

" Use autocmds to check your text automatically and keep the highlighting
" " up to date (easier):
au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off

" If you don't want the autocmds, you can also use an operator to check
" specific parts of your text:
" vmap <leader>d <Plug>Ditto         " Call Ditto on visual selection
" nmap <leader>d <Plug>Ditto         " Call Ditto on operator movement

nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches
au CursorHold,CursorHoldI * DittoUpdate

augroup textobj_sentence
  autocmd!
  autocmd FileType markdown call textobj#sentence#init()
  autocmd FileType textile call textobj#sentence#init()
  autocmd FileType tex call textobj#sentence#init()
  autocmd FileType latex call textobj#sentence#init()
  autocmd FileType text call textobj#sentence#init()
augroup END

augroup textobj_quote
  autocmd!
  autocmd FileType markdown call textobj#quote#init()
  autocmd FileType textile call textobj#quote#init()
  autocmd FileType text call textobj#quote#init({'educate': 0})
  autocmd FileType latex call textobj#quote#init({'educate': 0})
  autocmd FileType tex call textobj#quote#init({'educate': 0})
augroup END

augroup litecorrect
  autocmd!
  autocmd FileType markdown,mkd call litecorrect#init()
  autocmd FileType textile call litecorrect#init()
  autocmd FileType text call litecorrect#init()
  autocmd FileType tex call litecorrect#init()
  autocmd FileType latex call litecorrect#init()
augroup END

let g:airline#extensions#ale#enabled = 1
" Write this in your vimrc file
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
" Set this if you want to.
" " This can be useful if you are combining ALE with
" " some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 0
let g:ale_list_window_size = 4

