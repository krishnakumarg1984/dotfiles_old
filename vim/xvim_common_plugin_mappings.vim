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

let g:gutentags_project_root = ['Makefile','.root']
set statusline+=%{gutentags#statusline()}

" coc.nvim setup. https://vi.stackexchange.com/questions/19461/integrating-autocomplete-and-snippets

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" When using coc-snippets
" inoremap <silent><expr> <TAB>
"             \ pumvisible() ? coc#_select_confirm() :
"             \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"             \ <SID>check_back_space() ? "\<TAB>" :
"             \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" Use `[gc` and `]gc` to navigate diagnostics
nmap <silent> [gc <Plug>(coc-diagnostic-prev)
nmap <silent> ]gc <Plug>(coc-diagnostic-next)

" Use enter to accept snippet expansion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" " https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

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

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr> " -A means auto preview, and --normal means open list on normal mode.

augroup augroup_name
    autocmd!
    autocmd FileType tex let b:coc_pairs = [["$", "$"]]
    autocmd FileType tex let b:coc_pairs_disabled = ['`']
augroup END
