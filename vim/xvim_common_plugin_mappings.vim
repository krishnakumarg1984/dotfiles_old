command! PU PlugUpdate | PlugUpgrade

let g:gruvbox_bold=1
let g:gruvbox_italic=1
let g:gruvbox_undercurl=1
let g:gruvbox_underline=1

function! StatusLine(current, width)
    let l:s = ''

    if a:current
        let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
    else
        let l:s .= '%#CrystallineInactive#'
    endif
    let l:s .= ' %f%h%w%m%r '
    if a:current
        let l:s .= crystalline#right_sep('', 'Fill') . ' %{fugitive#head()}'
    endif

    let l:s .= '%='
    if a:current
        let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
        let l:s .= crystalline#left_mode_sep('')
    endif
    if a:width > 80
        let l:s .= ' %{&ft}[%{&enc}][%{&ff}] %l/%L %c%V %P '
    else
        let l:s .= ' '
    endif

    return l:s
endfunction

" function! TabLine()
"     let l:vimlabel = has('nvim') ?  ' NVIM ' : ' VIM '
"     return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
" endfunction
" let g:crystalline_tabline_fn = 'TabLine'

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'gruvbox'

set showtabline=1
set guioptions-=e

" Set this option to exclude regexp patterns for filetypes or filepaths
let g:editorconfig_blacklist = {
            \ 'filetype': ['git.*', 'fugitive'],
            \ 'pattern': ['\.un~$']}

let g:signify_vcs_list = [ 'git']

let g:matchup_override_vimtex = 1
let g:matchup_matchparen_deferred = 1

nmap <localleader>vi <plug>(vimtex-info)
nmap <localleader>vt <plug>(vimtex-toc-open)
nmap <localleader>vc <plug>(vimtex-cmd-create)|

if has('nvim')
    let g:vimtex_compiler_progname = 'nvr'
endif

function! Callback(msg)
    let l:m = matchlist(a:msg, '\vRun number (\d+) of rule ''(.*)''')
    if !empty(l:m)
        echomsg l:m[2] . ' (' . l:m[1] . ')'
    endif
endfunction

let g:vimtex_compiler_latexmk = {
    \ 'hooks' : [function('Callback')],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-shell-escape',
    \ ],
    \}

let g:vimtex_parser_bib_backend='bibparse'
if has('win32') || has('win64') " Check for windows platform
    let g:vimtex_view_general_viewer = 'SumatraPDF'
    let g:vimtex_view_general_options
                \ = '-reuse-instance -forward-search @tex @line @pdf'
                \ . ' -inverse-search "gvim --servername ' . v:servername
                \ . ' --remote-send \"^<C-\^>^<C-n^>'
                \ . ':drop \%f^<CR^>:\%l^<CR^>:normal\! zzzv^<CR^>'
                \ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
                \ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
                \ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'
else
    let g:vimtex_view_method='zathura'
    let g:vimtex_view_use_temp_files=1
endif

let g:vimtex_delim_list = {'mods' : {}}
let g:vimtex_delim_list.mods.name = [
            \ ['\left', '\right'],
            \ ['\mleft', '\mright'],
            \ ['\bigl', '\bigr'],
            \ ['\Bigl', '\Bigr'],
            \ ['\biggl', '\biggr'],
            \ ['\Biggl', '\Biggr'],
            \ ['\big', '\big'],
            \ ['\Big', '\Big'],
            \ ['\bigg', '\bigg'],
            \ ['\Bigg', '\Bigg'],
            \]
let g:vimtex_env_change_autofill=1
let g:vimtex_fold_enabled=1
let g:vimtex_view_forward_search_on_start=0

let g:vimtex_doc_handlers = ['MyHandler']
function! MyHandler(context)
    call vimtex#doc#make_selection(a:context)
    if !empty(a:context.selected)
        execute '!texdoc' a:context.selected '&'
    endif
    return 1
endfunction

" if has('pplatex')
    let g:vimtex_quickfix_method='pplatex'
" endif
let g:vimtex_quickfix_open_on_warning=0
let g:vimtex_quickfix_autoclose_after_keystrokes=3
let g:vimtex_view_automatic=0

nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

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

let g:gutentags_project_root = ['GNUmakefile','makefile','Makefile','.root']

let g:CoolTotalMatches = 1

let g:coc_global_extensions = [
            \ 'coc-vimtex',
            \ 'coc-dictionary',
            \ 'coc-tag',
            \ 'coc-word',
            \ 'coc-snippets',
            \ 'coc-python',
            \ 'coc-json',
            \ 'coc-yaml',
            \]


inoremap <expr><cr>    pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
inoremap <expr><tab>   pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"


" Remap keys for gotos
imap <silent> <c-u>      <plug>(coc-snippets-expand)
nmap <silent> <leader>ld <plug>(coc-definition)
nmap <silent> <leader>lt <plug>(coc-type-definition)
nmap <silent> <leader>li <plug>(coc-implementation)
nmap <silent> <leader>lf <plug>(coc-references)
nmap <leader>lr <plug>(coc-rename)

nmap <silent> <leader>lp <plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <plug>(coc-diagnostic-next)

" Use K to show documentation in preview window
" nnoremap <silent><leader> k :call <sid>show_documentation()<cr>
nnoremap <leader> k :call <sid>show_documentation()<cr>
function! s:show_documentation()
    if &filetype ==# 'vim'
        execute 'help ' . expand('<cword>')
    elseif &filetype ==# 'tex'
        VimtexDocPackage
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
if exists('*CocActionAsync')
  augroup coc_settings
    autocmd!
    autocmd CursorHold * silent call CocActionAsync('highlight')
  augroup END
endif

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>

" let g:ale_set_signs = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_sign_column_always = 1 " keep the sign gutter open at all times

" if exists('*nvim_buf_set_virtual_text')
"   let g:ale_virtualtext_cursor = 1
"   let g:ale_echo_cursor = 0
" endif

" let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_delay = 0

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'

let g:ale_statusline_format = ['Errors: %d', 'Warnings: %d', '']

      " \ 'cpp': ['ccls','clangcheck','clangtidy','cppcheck','gcc','cppcheck','flawfinder'],
let g:ale_linters = {
      \ 'cpp': ['ccls','clangcheck','clangtidy','cppcheck','gcc','cppcheck','flawfinder'],
      \ 'bash': ['shellcheck'],
      \ 'tex': ['lacheck','chktex','proselint'],
      \}

let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'cpp': ['uncrustify'],
            \}


" nmap <silent> <leader>aa <Plug>(ale_lint)
nmap <silent> <leader>aj <Plug>(ale_next_wrap)
nmap <silent> <leader>ak <Plug>(ale_previous_wrap)

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" let g:clang_format#style_options = {
"             \ "AccessModifierOffset" : -4,
"             \ "AllowShortIfStatementsOnASingleLine" : "true",
"             \ "AlwaysBreakTemplateDeclarations" : "true",
"             \ "Standard" : "C++14"}

augroup CoscoMappings
    autocmd!
    autocmd FileType javascript,css,c,cpp nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
    autocmd FileType javascript,css,c,cpp imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)
augroup END

" augroup clangformatsettings
"     " map to <Leader>cf in C++ code
"     autocmd!
"     " autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
"     " autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
"     " if you install vim-operator-user
"     " autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
"     " Toggle auto formatting:
"     " nmap <Leader>C :ClangFormatAutoToggle<CR>
"     autocmd FileType c,cpp,objc ClangFormatAutoEnable
"     autocmd FileType c,cpp,objc set equalprg='clang-format'
"     autocmd FileType c,cpp,objc set formatprg='clang-format'
"     autocmd FileType c,cpp,objc set iskeyword-=<
"     autocmd FileType c,cpp,objc set iskeyword-=>
" augroup END

" vim-swap
nmap <leader><  <Plug>(swap-prev)
nmap <leader>>  <Plug>(swap-next)

let g:chromatica#libclang_path='/home/krishna/pkg/lib'

" augroup fswitchConfig
"     autocmd!
"     autocmd BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = '../inc'
" augroup end

let g:targets_argOpening = '[({[]'
let g:targets_argClosing = '[]})]'
let g:targets_separators = ', . ; : + - = ~ _ * # / | \ &'
let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB rr ll rb al rB Al bb aa bB Aa BB AA'

let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_frontmatter = 1

function! s:VisualMode()
    let l:keys = "1v\<Esc>"
    silent! let l:keys = visualrepeat#reapply#VisualMode(0)
    return l:keys
endfunction
nnoremap <silent> <Plug>(MyPluginVisual)
\ :<C-u>execute 'normal!' <SID>VisualMode()<Bar>
\call MyPlugin#Operator('visual', "\<lt>Plug>(MyPluginVisual)")<CR>

