command! PU PlugUpdate | PlugUpgrade


" For JavaScript files, use `eslint` (and only eslint)
let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'tex': ['chktex, lacheck'],
            \ }

" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" " " some other plugin which sets quickfix errors, etc.
" " " This can be useful if you are combining ALE with
" " let g:ale_lint_on_filetype_changed = 1    " default
" " Set this if you want to.
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_keep_list_window_open = 0
" let g:ale_lint_on_enter = 1               " default
" let g:ale_lint_on_save = 1                " default
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_list_window_size = 4
" let g:ale_open_list = 0
" let g:ale_set_loclist = 1
" let g:ale_set_quickfix = 0
" let g:ale_sign_column_always = 1
" let g:ale_statusline_format = ['Errors: %d', 'Warnings: %d', '']

" let g:ale_linters = {
"             \   'tex': ['chktex','lacheck','alex','vale'],
"             \   'latex': ['alex','chktex','lacheck','proselint','redpen','vale','write-good'],
"             \}


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


" whether to highlight trailing whitespace with the default red color (I find it distracting so I turn it off)
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
" strip white line at the end of the file
let g:strip_whitelines_at_eof=1
" disable whitespace operator
let g:better_whitespace_operator=''

nnoremap <leader>s :ToggleWorkspace<CR>
" let g:workspace_autosave_always = 1

let g:indentguides_ignorelist = ['text']

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>ga <Plug>(EasyAlign)

nnoremap <leader>gu :GundoToggle<CR>
" nnoremap <leader>gu :UndotreeToggle<CR>

let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1
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

let g:qf_auto_open_quickfix = 0

let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}


let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = {
      \ 'sections' : {'parse_levels': 1},
      \}
let g:vimtex_format_enabled = 1
let g:vimtex_view_automatic = 0
let g:vimtex_view_forward_search_on_start = 0
let g:vimtex_toc_config = {
      \ 'split_pos' : 'full',
      \ 'mode' : 2,
      \ 'fold_enable' : 1,
      \ 'hotkeys_enabled' : 1,
      \ 'hotkeys_leader' : '',
      \ 'refresh_always' : 0,
      \ 'split_width' : 50,
      \}

augroup vimtextoc
    autocmd!
    autocmd BufWritePost *.tex call vimtex#toc#refresh()
augroup END

let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_autoclose_after_keystrokes = 2
let g:vimtex_complete_img_use_tail = 1
let g:vimtex_complete_bib = {
      \ 'simple' : 1,
      \ 'menu_fmt' : '@year, @author_short, @title',
      \}

let g:vimtex_env_change_autofill = 1
let g:vimtex_doc_handlers = ['MyHandler']
function! MyHandler(context)
    call vimtex#doc#make_selection(a:context)
    if !empty(a:context.selected)
        execute '!texdoc' a:context.selected '&'
    endif
    return 1
endfunction

if has('win32') || has('win64')
    let g:vimtex_view_general_viewer = 'SumatraPDF'
    let g:vimtex_view_general_options
                \ = '-reuse-instance -forward-search @tex @line @pdf'
                \ . ' -inverse-search "nvim-qt --servername ' . v:servername
                \ . ' --remote-send \"^<C-\^>^<C-n^>'
                \ . ':drop \%f^<CR^>:\%l^<CR^>:normal\! zzzv^<CR^>'
                \ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
                \ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
                \ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'
else
    let g:vimtex_view_method = 'zathura'
endif

if has('nvim') && exists('g:GuiLoaded')
  let g:vimtex_compiler_progname = 'nvr'
endif


let g:deoplete#enable_at_startup = 0
" start deoplete when we go to insert mode
augroup deoplete_start
    autocmd!
    autocmd InsertEnter * call deoplete#enable()
augroup END

try
  call deoplete#custom#option('smart_case', v:true)
  call deoplete#custom#option('ignore_sources', {
        \ '_': ['around'],
        \ 'dagbok': ['syntax'],
        \})

  call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])
  call deoplete#custom#source('ultisnips', 'rank', 1000)

  call deoplete#custom#option({
              \ 'auto_complete_delay': 40,
              \ 'auto_refresh_delay': 40,
              \ 'smart_case': v:true,
              \ 'auto_complete_start_length': 1,
              \ })


  call deoplete#custom#var('omni', 'input_patterns', {
              \ 'tex': g:vimtex#re#deoplete
              \})
  call deoplete#custom#source('tabnine', 'rank', 50)
catch
endtry


" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

imap <expr><TAB>
            \ pumvisible() ? "\<C-n>" :
            \ neosnippet#expandable_or_jumpable() ?
            \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

xmap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Expand the completed snippet trigger by <CR>.
imap <expr><CR>
            \ (pumvisible() && neosnippet#expandable()) ?
            \ "\<Plug>(neosnippet_expand)" : "\<CR>"


imap <expr><S-TAB>
            \ pumvisible() ? "\<C-p>" :
            \ neosnippet#expandable_or_jumpable() ?
            \    "\<Plug>(neosnippet_expand_or_jump)" : "\<S-TAB>"

let g:neosnippet#enable_completed_snippet = 1
autocmd CompleteDone * call neosnippet#complete_done()
autocmd InsertLeave * NeoSnippetClearMarkers

let g:CoolTotalMatches = 1

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
let g:gruvbox_italic=1
let g:gruvbox_italicize_strings=1
let g:gruvbox_sign_column='bg0'

" function! Noscrollbar(...)
"     let w:airline_section_z = '%{noscrollbar#statusline()}'
" endfunction
" call airline#add_statusline_func('Noscrollbar')

"""""""""""""""""""""""""plasticboy/vim-markdown settings"""""""""""""""""""

" disable header folding
let g:vim_markdown_folding_disabled = 1

" whether to use conceal feature in markdown
let g:vim_markdown_conceal = 1

" disable math tex conceal and syntax highlight
let g:tex_conceal = ''
let g:vim_markdown_math = 0

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" let the TOC window autofit so that it doesn't take too much space
let g:vim_markdown_toc_autofit = 1

map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)

let g:gutentags_project_root = ['Makefile','.root']

" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" " generate datebases in my cache directory, prevent gtags files polluting my project
" let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

let g:editorconfig_blacklist = {
    \ 'filetype': ['git.*', 'fugitive'],
    \ 'pattern': ['\.un~$']}

augroup vimcommentary
    autocmd!
    autocmd FileType lua setlocal commentstring=--\ %s
    autocmd FileType pico8 setlocal commentstring=--\ %s
augroup END

" Smart pairs are disabled by default:
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1




