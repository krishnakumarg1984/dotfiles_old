" if exists(":Goyo")
" augroup LatexGoyo
"     autocmd!
"     autocmd BufReadPost,BufNewFile *.tex Goyo
" augroup END
" else
augroup LatexColumnSet
    autocmd!
    autocmd FileType tex setlocal columns=100 colorcolumn=94
augroup END
" endif

