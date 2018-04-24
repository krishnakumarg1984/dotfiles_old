augroup ft_muttrc
    autocmd!

    au BufRead,BufNewFile *.muttrc set filetype=muttrc
    autocmd FileType muttrc setlocal foldmethod=marker
    autocmd Filetype muttrc setlocal foldmarker={{{,}}}
augroup END

augroup ft_latex
    autocmd!
    au BufRead,BufNewFile *.tex set filetype=tex
    autocmd FileType tex setlocal textwidth=80
    " autocmd FileType tex setlocal formatprg=par\ -jw80
    autocmd FileType tex vmap <A-q> !par -jw80<CR>
    autocmd FileType tex map <A-q> {v}!par -jw80<CR>
    autocmd FileType tex setlocal formatoptions-=t
    autocmd FileType tex setlocal spell
    autocmd FileType tex setlocal spelllang=en_gb
    " autocmd FileType tex setlocal formatoptions=at
    autocmd FileType tex setlocal keywordprg=texdoc
    autocmd FileType bib setlocal foldmethod=syntax
    " au BufReadPost,BufNewFile *.tex Limelight 0.7
augroup END

autocmd FileType dot setlocal commentstring=//\ %s
augroup ft_yaml_rss
    autocmd!

    autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd BufNewFile,BufRead *.rss setfiletype xml
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
    " autocmd FileType vim setlocal list!
    autocmd FileType help setlocal textwidth=80
    autocmd FileType help setlocal number
    autocmd FileType help setlocal relativenumber
    " Press Enter to follow a help tag
    autocmd FileType help nnoremap <buffer><CR> <c-]>
    " Press Backspace to go back to the location of the previous tag
    autocmd FileType help nnoremap <buffer><BS> <c-T>
    " Press q to exit the help
    autocmd FileType help nnoremap <buffer>q :q<CR>
    autocmd FileType help setlocal foldmethod=marker
    autocmd FileType help setlocal foldenable
    autocmd FileType help setlocal foldlevel=0
    autocmd FileType help setlocal foldlevelstart=0
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

    " autocmd FileType make setlocal foldmethod=marker
    " autocmd Filetype make setlocal foldmarker={{{,}}}
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
augroup END

augroup ft_mail
    autocmd!

    autocmd FileType mail setlocal spell
    autocmd FileType mail setlocal fo=aw
    autocmd FileType mail setlocal tw=72
    autocmd FileType mail setlocal pastetoggle=<f12>
    "autocmd FileType mail setlocal formatoptions=tcql
    autocmd FileType mail setlocal foldmethod=expr
    autocmd FileType mail setlocal foldexpr=strlen(substitute(substitute(getline(v:lnum),'\\s','',\"g\"),'[^>].*','',''))
    autocmd Filetype mail setlocal foldlevel=0
augroup END

function IsReply()
    colorscheme pencil
    if line('$') > 1
        :g/^>\s\=--\s\=$/,$ delete
        if executable('par')
            :%!par w72q
        elseif executable('fmt')
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
    autocmd! VimEnter /tmp/mutt* :call IsReply()
    au! BufRead,BufNewFile .followup,.article,.letter,/tmp/pico*,nn.*,snd.*,/tmp/mutt* :set ft=mail
    "   autocmd!
    "   set ft=mail
    "   set textwidth=72
    "   set comments+=n:\|  " `|` is a quote char
    "   set comments+=n:%   " '%' aas well.
    "   " * <F1> to re-format the current paragraph correctly
    "   " " * <F2> to format a line which is too long, and go to the next line
    "   " " * <F3> to merge the previous line with the current one, with a correct
    "   " "        formatting (sometimes useful associated with <F2>)
    "   " "
    "   " " These keys might be used both in command mode and edit mode.
    "   " "
    "   " " <F1> might be smarter to use with the Mail_Del_Empty_Quoted() function
    "   " " defined below
    "   "
    "   " nmap  <F1>    gqap
    "   " nmap  <F2>    gqqj
    "   " nmap  <F3>    kgqj
    "   " map!  <F1>    <ESC>gqapi
    "   " map!  <F2>    <ESC>gqqji
    "   " map!  <F3>    <ESC>kgqji

    "   "" ----------------------------------------------------------------------------
    "   ""   Suppressing quoted signature(s) if any when replying
    "   "" ----------------------------------------------------------------------------

    "   " Thanks to Luc Hermitte for the original function
    "   " (http://hermitte.free.fr/vim/ressources/vimfiles/ftplugin/mail/Mail_Sig_set_vim.html)
    "   " Thanks to Loďc Minier and Martin Treusch von Buttlar who pointed out an
    "   " issue with the user's own sig.

    "   function! Mail_Erase_Sig_old()
    "       let i = line('$')
    "       let j = i
    "       " search for the signature pattern (takes into account signature delimiters
    "       " from broken mailers that forget the space after the two dashes)
    "       while ((i > 0) && (getline(i) !~ '^> *-- \=$'))
    "           if (getline(i) =~ '^-- $')
    "               " this is my own sig. please don't delete it!
    "               let j = i - 1
    "           endif
    "           let i = i - 1
    "       endwhile

    "       " if found, then
    "       if (i != 0)
    "           " search for the last non empty (non sig) line
    "           while ((i > 0) && (getline(i - 1) =~ '^\(>\s*\)*$'))
    "               let i = i - 1
    "           endwhile
    "           " and delete those lines plus the signature
    "           exe ':'.i.','.j.'d'
    "       endif
    "   endfunction

    "   " this new version handles cases where there are several signatures
    "   " (sometimes added by mailing list software)
    "   function! Mail_Erase_Sig()
    "       " search for the signature pattern (takes into account signature delimiters
    "       " from broken mailers that forget the space after the two dashes)
    "       let i = 0
    "       while ((i <= line('$')) && (getline(i) !~ '^> *-- \=$'))
    "           let i = i + 1
    "       endwhile

    "       " if found, then
    "       if (i != line('$') + 1)
    "           " first, look for our own signature, to avoid deleting it
    "           let j = i
    "           while (j < line('$') && (getline(j + 1) !~ '^-- $'))
    "               let j = j + 1
    "           endwhile

    "           " second, search for the last non empty (non sig) line
    "           while ((i > 0) && (getline(i - 1) =~ '^\(>\s*\)*$'))
    "               let i = i - 1
    "           endwhile

    "           " third, delete those lines plus the signature
    "           exe ':'.i.','.j.'d'
    "       endif
    "   endfunction


    "   "" ----------------------------------------------------------------------------
    "   ""   Replacing empty quoted lines (e.g. "> $") with empty lines
    "   ""   (convenient to automatically reformat one paragraph)
    "   "" ----------------------------------------------------------------------------

    "   function! Mail_Del_Empty_Quoted()
    "       exe "normal :%s/^>[[:space:]\%\|\#>]\\+$//e\<CR>"
    "   endfunction



    "   "" ----------------------------------------------------------------------------
    "   ""   Moving the cursor at the begining of the mail
    "   "" ----------------------------------------------------------------------------

    "   function! Mail_Begining()
    "       exe "normal gg"
    "       if getline (line ('.')) =~ '^From: '
    "           " if we use edit_headers in Mutt, then go after the headers
    "           exe "normal /^$\<CR>"
    "       endif
    "   endfunction



    "   "" ----------------------------------------------------------------------------
    "   ""
    "   ""   Initializations
    "   ""
    "   "" ----------------------------------------------------------------------------

    "   call Mail_Erase_Sig()
    "   call Mail_Del_Empty_Quoted()
    "   call Mail_Begining()
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
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd BufRead,BufNewFile gitcommit setlocal textwidth=72
    autocmd FileType gitcommit 1 | startinsert
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
    autocmd BufEnter *.gitignore setlocal commentstring=#\ %s
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


if has("autocmd")
    let pandoc_pipeline  = "pandoc --from=html --to=html"
    autocmd FileType html let &l:formatprg=pandoc_pipeline
endif
