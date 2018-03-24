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

nnoremap <leader>gu :MundoToggle<CR>

