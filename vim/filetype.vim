augroup CppJavaSettings
    autocmd!
    autocmd FileType c,cpp,java set matchpairs+==:;
augroup END

augroup SpellSettings
    autocmd!
    autocmd FileType c,cpp,markdown,mail,rst,text,yaml,toml,gitcommit setlocal spell spelllang=en_gb
augroup END

augroup LatexSettings
    autocmd!
    autocmd FileType tex setlocal spell
    " prevent Vim from automatically inserting line breaks in newly entered text.
    autocmd FileType tex setlocal textwidth=0 wrapmargin=0
augroup END

if exists(":Goyo")
    augroup LatexGoyo
        autocmd!
        autocmd BufReadPost,BufNewFile *.tex Goyo
    augroup END
else
    augroup LatexColumnSet
        autocmd FileType tex setlocal columns=100 colorcolumn=94
    augroup END
endif

augroup ft_vim_help
    autocmd!
    " Make vim resize on host window resize.  Great for increaseing/decreasing
    " font or when you disconnect from your external monitor.
    " autocmd FileType vim setlocal foldmethod=marker
    " autocmd FileType vim setlocal list!
    " autocmd FileType help setlocal textwidth=80
    " autocmd FileType help set number relativenumber
    " Press Enter to follow a help tag
    autocmd FileType help nnoremap <buffer><CR> <c-]>
    " Press Backspace to go back to the location of the previous tag
    autocmd FileType help nnoremap <buffer><BS> <c-T>
    " Press q to exit the help
    autocmd FileType help nnoremap <buffer>q :q<CR>
    autocmd FileType help setlocal foldmethod=marker
    autocmd FileType help setlocal foldenable
    " autocmd FileType help setlocal foldlevel=1
    autocmd FileType help setlocal foldlevelstart=0
    autocmd BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

augroup markdownformat
    autocmd!
    autocmd FileType markdown setlocal formatprg=par\ -w100
augroup END

if exists("+omnifunc")
    augroup omnifunc
        autocmd!
        " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType c setlocal omnifunc=ccomplete#Complete
        " autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        " autocmd FileType handlebars setlocal omnifunc=htmlcomplete#CompleteTags
        " autocmd FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
        " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        " autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
        " autocmd FileType python setlocal omnifunc=jedi#completions
        " autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
        " autocmd FileType sql setlocal omnifunc=sqlcomplete#CompleteTags
        " autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        " autocmd Filetype *
        "             \ if &omnifunc == "" |
        "             \ setlocal omnifunc=syntaxcomplete#Complete |
        "             \ endif
    augroup END
endif

augroup jsonfiles
    autocmd!
    " autocmd FileType json syntax match Comment +\/\/.\+$+
    autocmd FileType json setlocal commentstring=//\ %s
augroup END

" augroup ftdetection
"     autocmd!

"     " Makefiles
"     autocmd BufNewFile,BufRead
"                 \ Makefile
"                 \,makefile
"                 \ setfiletype make
" augroup END
