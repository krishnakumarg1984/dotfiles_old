augroup ft_muttrc
    autocmd!

    au BufRead,BufNewFile *.muttrc set filetype=muttrc
    autocmd FileType muttrc setlocal foldmethod=marker
    autocmd Filetype muttrc setlocal foldmarker={{{,}}}
augroup END

augroup ft_gitconfig
    autocmd!

    autocmd Filetype gitconfig setlocal noexpandtab
    autocmd FileType gitconfig setlocal foldmethod=marker
    autocmd Filetype gitconfig setlocal foldmarker={{{,}}}
augroup END

augroup ft_bash_profile
    autocmd!

    au BufNewFile,BufRead .bash_profile setlocal foldmethod=marker
    au BufNewFile,BufRead .bash_profile setlocal foldmarker={{{,}}}
augroup END

augroup ft_vim
    autocmd!

    " Make vim resize on host window resize.  Great for increaseing/decreasing
    " font or when you disconnect from your external monitor.
    autocmd VimResized * wincmd =
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType help setlocal textwidth=80
    autocmd FileType help setlocal number
    " Press Enter to follow a help tag
    autocmd FileType help nnoremap <buffer><CR> <c-]>
    " Press Backspace to go back to the location of the previous tag
    autocmd FileType help nnoremap <buffer><BS> <c-T>
    " Press q to exit the help
    autocmd FileType help nnoremap <buffer>q :q<CR>
    autocmd BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" autocmd FileType tex,text,markdown,mail setlocal spell

augroup ft_markdown
    autocmd!

    autocmd BufNewFile,BufRead *.m*down setlocal filetype=markdown foldlevel=1
    autocmd FileType markdown setlocal textwidth=0
    autocmd FileType markdown setlocal spell

    set formatoptions+=t
augroup END


augroup ft_make
    autocmd!

    autocmd Filetype make setlocal noexpandtab
    autocmd FileType make setlocal foldmethod=marker
    autocmd Filetype make setlocal foldmarker={{{,}}}
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
augroup END

augroup ft_mail
    autocmd!

    autocmd FileType mail setlocal spell
    autocmd FileType mail setlocal fo=aw
    autocmd FileType mail setlocal tw=72
augroup END

function IsReply()
    colorscheme pencil
    if line('$') > 1
        :g/^>\s\=--\s\=$/,$ delete
        if executable("par")
            :%!par\ -w72q
        elseif executable("fmt")
            :%!fmt -w72
        endif
        :%s/^.\+\ze\n\(>*$\)\@!/\0 /e
        :%s/^>*\zs\s\+$//e
        :1
        :put! =\"\n\n\"
        :1
    endif
endfunction

augroup mail_filetype
    autocmd!
    autocmd! VimEnter /tmp/mutt* :call IsReply()
augroup END

augroup ft_html
    autocmd!

    autocmd Filetype html setlocal foldmethod=indent
    let pandoc_pipeline  = "pandoc --from=html --to=markdown"
    let pandoc_pipeline .= " | pandoc --from=markdown --to=html"
    autocmd FileType html setlocal formatexpr=FormatprgLocal(pandoc_pipeline)
augroup END

augroup ft_gitcommit
    autocmd!

    autocmd FileType gitcommit setlocal spell
    autocmd FileType gitcommit setlocal textwidth=70
    autocmd BufRead,BufNewFile gitcommit setlocal textwidth=70
    " au FileType gitcommit 1 | startinsert
augroup END

augroup ft_crontab
    autocmd!

    autocmd filetype crontab setlocal nobackup nowritebackup
augroup END

augroup ft_conf
    autocmd!

    au BufNewFile,BufRead *.conf set filetype=conf
    autocmd FileType conf setlocal foldmethod=marker
    autocmd Filetype conf setlocal foldmarker={{{,}}}
augroup END

augroup ft_sh
    autocmd!

    " Lets me fold functions in bash
    autocmd FileType sh setlocal foldmethod=marker
    autocmd Filetype sh setlocal foldmarker={,}
augroup END

augroup MscFileTypeSettings
    autocmd!
    " Use the java docs for keyword help
    "nnoremap <Leader>ls :w <BAR> !lessc % > ../css/%:t:r.css<CR><space>
    autocmd FileType less setlocal makeprg=lessc\ %\ >\ ../css/%:t:r.css

    " When editing plain text I don't need to see the ends of lines.
    autocmd FileType txt setlocal wrap linebreak nolist textwidth=0 wrapmargin=0
    autocmd BufEnter *.js setlocal foldmethod=indent
augroup END

if exists("+omnifunc")

    augroup omnifunc
        autocmd!

        autocmd FileType python set omnifunc=pythoncomplete#Complete
        " autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
        autocmd FileType handlebars set omnifunc=htmlcomplete#CompleteTags
        autocmd FileType xhtml set omnifunc=htmlcomplete#CompleteTags
        autocmd FileType css set omnifunc=csscomplete#CompleteCSS
        autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
        autocmd FileType php set omnifunc=phpcomplete#CompletePHP
        autocmd FileType c set omnifunc=ccomplete#Complete


        autocmd Filetype *
                    \ if &omnifunc == "" |
                    \ setlocal omnifunc=syntaxcomplete#Complete |
                    \ endif

    augroup END

endif

augroup filetypes
    autocmd!

    " support for cmake files
    autocmd BufNewFile,BufRead CMakeLists.txt set filetype=cmake

    " support for json syntax highlighting
    autocmd BufRead,BufNewFile *.json set filetype=json

    " support for stylus syntax highlighting
    autocmd BufRead,BufNewFile *.styl set filetype=stylus

    " vim-vue workaround for randomly stopping syntax highlighting
    autocmd FileType vue syntax sync fromstart

augroup END

if executable('ant')
    augroup JavaMakeSettings
        autocmd!
        autocmd FileType java setlocal makeprg=ant\ -find\ 'build.xml'
        autocmd FileType java compiler ant
        autocmd FileType java setlocal shellpipe=2>&1\ \|\ tee
    augroup END
endif


augroup PandocSettings
    autocmd!
    autocmd FileType pandoc  if ! isdirectory('.PandocOutput') |
                \ exec "!mkdir .PandocOutput" |
                \ endif

    autocmd FileType pandoc exec "setlocal makeprg=" . s:pandocCmd .
                \ "\\ --highlight-style=pygments\\ -s\\ --output=\\\"" .
                \ expand('%:h') . expand('/') . ".PandocOutput" . expand('/') .
                \ expand('%:r') . ".html\\\"\\ %"

    autocmd FileType pandoc command! -nargs=0 -buffer ViewPandoc call ViewPandoc()
    autocmd FileType pandoc command! -nargs=0 -buffer PandocMakePDF call PandocMakePDF()

    " Turn spellcheck off because we are going to be using words that aren't in the dictionary
    autocmd FileType pandoc setlocal nospell
    " Use 4 spaces per tab since thats the magic number for pandoc
    autocmd FileType pandoc setlocal shiftwidth=4
    " Don't add '*' or '#' after newline
    autocmd FileType pandoc setlocal formatoptions-=r
    autocmd FileType pandoc setlocal formatoptions-=o
augroup END

autocmd FileType matlab setlocal commentstring=%\ %s
