command! PU PlugUpdate | PlugUpgrade


" For JavaScript files, use `eslint` (and only eslint)
let g:ale_linters = {
            \   'javascript': ['eslint'],
            \ }

" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" " some other plugin which sets quickfix errors, etc.
" " This can be useful if you are combining ALE with
" let g:ale_lint_on_filetype_changed = 1    " default
" Set this if you want to.
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_keep_list_window_open = 0
let g:ale_lint_on_enter = 1               " default
let g:ale_lint_on_save = 1                " default
let g:ale_lint_on_text_changed = 'never'
let g:ale_list_window_size = 4
let g:ale_open_list = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['Errors: %d', 'Warnings: %d', '']

let g:ale_linters = {
            \   'tex': ['chktex','lacheck','alex','vale'],
            \   'latex': ['alex','chktex','lacheck','proselint','redpen','vale','write-good'],
            \}


let g:grepper       = {}
let g:grepper.tools = ['git', 'rg', 'grep']

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


let g:better_whitespace_enabled=1
" let g:strip_whitespace_on_save=1

nnoremap <leader>s :ToggleWorkspace<CR>
" let g:workspace_autosave_always = 1

let g:indentguides_ignorelist = ['text']

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>ga <Plug>(EasyAlign)

nnoremap <leader>gu :GundoToggle<CR>
" nnoremap <leader>gu :UndotreeToggle<CR>


xnoremap iz :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zv[z<cr>
xnoremap az :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zV[z<cr>

let g:matchup_transmute_enabled=0
let g:matchup_matchparen_deferred = 1
let g:matchup_override_vimtex = 1
let g:matchup_matchparen_status_offscreen = 0


let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
runtime macros/sandwich/keymap/surround.vim
let g:columnmove_strict_wbege = 0

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

if has('timers')
    " Blink 2 times with 50ms interval
    noremap <expr> <plug>(slash-after) 'zz'.slash#blink(2, 50)
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


" if !executable('zeal') || exists('g:loaded_zeal') | finish | endif

" let g:loaded_zeal = 1

let g:rsi_no_meta = 1

let g:tq_online_backends_timeout = 0.4

let g:goyo_linenr = 1

autocmd! User GoyoEnter Limelight 0.8
autocmd! User GoyoLeave Limelight!

" nmap <Leader>L <Plug>(Limelight)
" xmap <Leader>L <Plug>(Limelight)

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

let g:qf_auto_open_quickfix = 0

