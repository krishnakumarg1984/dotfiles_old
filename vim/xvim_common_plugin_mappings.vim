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

let g:vimtex_compiler_progname = 'nvr'

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

" inoremap <expr><cr>    pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
" inoremap <expr><tab>   pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"


" Remap keys for gotos
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
let g:ale_sign_column_always = 1 " keep the sign gutter open at all times

let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'cpp': ['uncrustify'],
            \}

" if exists('*nvim_buf_set_virtual_text')
"   let g:ale_virtualtext_cursor = 1
"   let g:ale_echo_cursor = 0
" endif

" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_delay = 0

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'

let g:ale_statusline_format = ['Errors: %d', 'Warnings: %d', '']

let g:ale_linters = {
      \ 'cpp': ['ccls','clangcheck','clangtidy','cppcheck','gcc','cppcheck','cpplint','flawfinder'],
      \}

" nmap <silent> <leader>aa <Plug>(ale_lint)
nmap <silent> <leader>aj <Plug>(ale_next_wrap)
nmap <silent> <leader>ak <Plug>(ale_previous_wrap)

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++14"}

augroup CoscoMappings
    autocmd!
    autocmd FileType javascript,css,c,cpp nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
    autocmd FileType javascript,css,c,cpp imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)
augroup END

" augroup clangformatsettings
"     " map to <Leader>cf in C++ code
"     autocmd!
"     autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
"     autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
"     " if you install vim-operator-user
"     autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
"     " Toggle auto formatting:
"     nmap <Leader>C :ClangFormatAutoToggle<CR>
"     autocmd FileType c,cpp,objc ClangFormatAutoEnable
" augroup END

" vim-swap
nmap <leader><  <Plug>(swap-prev)
nmap <leader>>  <Plug>(swap-next)

let g:chromatica#libclang_path='/home/krishna/pkg/lib'

" augroup fswitchConfig
"     autocmd!
"     autocmd BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = '../inc'
" augroup end
