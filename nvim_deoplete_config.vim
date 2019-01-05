" Configure deoplete to work with LaTeX
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

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
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#auto_complete_delay = 40
" let g:deoplete#auto_refresh_delay = 40
" call deoplete#custom#set('buffer', 'rank', 9999)
" call deoplete#custom#set('_', 'sorters', ['sorter_word'])
" call deoplete#custom#set('neosnippet', 'rank', 9999)

call deoplete#custom#option({
            \ 'auto_complete_delay': 40,
            \ 'auto_refresh_delay': 40,
            \ 'smart_case': v:true,
            \ 'auto_complete_start_length': 1,
            \ })


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


" let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.local/share/nvim/plugged/neosnippet-snippets/neosnippets,~/.local/share/nvim/plugged/vim-snippets/snippets'

let g:neosnippet#enable_completed_snippet = 1
autocmd CompleteDone * call neosnippet#complete_done()

autocmd InsertLeave * NeoSnippetClearMarkers

let g:deoplete#sources#biblatex#bibfile = '~/Documents/phd_thesis/9_backmatter/thesis_refs.bib'
