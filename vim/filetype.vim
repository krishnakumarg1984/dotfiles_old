" Use our own filetype detection rules
augroup filetypedetect
    autocmd!

    " autocmd BufNewFile,BufRead
    "             \ .htaccess
    "             \,*/apache*/?*.conf
    "             \ setfiletype apache

    " Assembly language files
    " autocmd BufNewFile,BufRead
    "             \ ?*.s
    "             \ setfiletype asm

    " AWK files
    " autocmd BufNewFile,BufRead
    "             \ ?*.awk
    "             \ setfiletype awk

    " " BIND zone file
    " autocmd BufNewFile,BufRead
    "             \ */bind/db.?*
    "             \,*/namedb/db.?*
    "             \,named.root
    "             \ setfiletype bindzone

    " C files
    " autocmd BufNewFile,BufRead
    "             \ ?*.c
    "             \,?*.h
    "             \ setfiletype c

    " C++ files
    " autocmd BufNewFile,BufRead
    "             \ ?*.cpp
    "             \,?*.cxx
    "             \,?*.c++
    "             \,?*.hh
    "             \ setfiletype cpp

    " crontab(5) files
    " autocmd BufNewFile,BufRead
    "             \ crontab
    "             \,crontab.*
    "             \,cron.d/*
    "             \ setfiletype crontab

    " " CSS files
    " autocmd BufNewFile,BufRead
    "             \ ?*.css
    "             \ setfiletype css

    " CSV files
    " autocmd BufNewFile,BufRead
    "             \ ?*.csv
    "             \ setfiletype csv

    " Diff and patch files
    " autocmd BufNewFile,BufRead
    "             \ ?*.diff
    "             \,?*.patch
    "             \,?*.rej
    "             \ setfiletype diff

    " " INI files
    " autocmd BufNewFile,BufRead
    "             \ ?*.ini
                " \ setfiletype dosini

    " DOT graphs
    " autocmd BufNewFile,BufRead
    "             \ ?*.dot
    "             \ setfiletype dot

    " Forth
    " autocmd BufNewFile,BufRead
    "             \ ?*.fs,?*.ft
    "             \ setfiletype forth

    " fstab(5) files
    " autocmd BufNewFile,BufRead
    "             \ fstab
    "             \ setfiletype fstab

    " GDB init files
    " autocmd BufNewFile,BufRead
    "             \ .gdbinit
    "             \ setfiletype gdb

    " Git commit messages
    " autocmd BufNewFile,BufRead
    "             \ COMMIT_EDITMSG
    "             \,MERGE_MSG
    "             \,TAG_EDITMSG
    "             \ setfiletype gitcommit

    " Git config files
    " autocmd BufNewFile,BufRead
    "             \ *.git/config
    "             \,.gitconfig
    "             \,.gitmodules
    "             \,gitconfig
    "             \ setfiletype gitconfig

    " Git rebase manifests
    " autocmd BufNewFile,BufRead
    "             \ git-rebase-todo
    "             \ setfiletype gitrebase

    " GnuPG configuration files
    " autocmd BufNewFile,BufRead
    "             \ *gnupg/options
    "             \,*gnupg/gpg.conf
    "             \ setfiletype gpg

    " UNIX group file
    " autocmd BufNewFile,BufRead
    "             \ /etc/group
    "             \,/etc/group-
    "             \,/etc/group.edit
    "             \,/etc/gshadow
    "             \,/etc/gshadow-
    "             \,/etc/gshadow.edit
    "             \ setfiletype group

    " GTK settings files
    " autocmd BufNewFile,BufRead
    "             \ .gktrc*,
    "             \,gktrc*
    "             \ setfiletype gtkrc

    " Vim help files
    autocmd BufNewFile,BufRead
                \ ~/.vim/doc/?*.txt
                \,*/vim-*/doc/?*.txt
                \,*/*.vim/doc/?*.txt
                \,$VIMRUNTIME/doc/?*.txt
                \ setfiletype help

    " HTML files
    " autocmd BufNewFile,BufRead
    "             \ ?*.html
    "             \,?*.htm
    "             \ setfiletype html

    " hosts(5) file
    " autocmd BufNewFile,BufRead
    "             \ /etc/hosts
    "             \ setfiletype hostconf

    " inittab(5) files
    " autocmd BufNewFile,BufRead
    "             \ inittab
    "             \ setfiletype inittab

    " Java files
    " autocmd BufNewFile,BufRead
    "             \ ?*.java
    "             \,?*.jav
    "             \ setfiletype java

    " Javascript files
    " autocmd BufNewFile,BufRead
    "             \ ?*.js
    "             \ setfiletype javascript

    " JSON files
    " autocmd BufNewFile,BufRead
    "             \ ?*.json
    "             \ setfiletype json

    " Lex files
    " autocmd BufNewFile,BufRead
    "             \ ?*.l
    "             \,?*.lex
    "             \ setfiletype lex

    " Lua files
    " autocmd BufNewFile,BufRead
    "             \ ?*.lua
    "             \ setfiletype lua

    " m4 files
    " autocmd BufNewFile,BufRead
    "             \ ?*.m4
    "             \ setfiletype m4

    " Mail messages
    " autocmd BufNewFile,BufRead
    "             \ ?*.msg
    "             \,mutt-*-[0-9]\+-[0-9]\+-[0-9]\+
    "             \ setfiletype mail

    " Mail aliases
    " autocmd BufNewFile,BufRead
    "             \ aliases
    "             \ setfiletype mailaliases

    " Makefiles
    " autocmd BufNewFile,BufRead
    "             \ Makefile
    "             \,makefile
    "             \ setfiletype make

    " Markdown files
    autocmd BufNewFile,BufRead
                \ ?*.markdown
                \,?*.md
                \ setfiletype markdown shiftwidth=4 softtabstop=4 spell set omnifunc=htmlcomplete#CompleteTags

    " Mutt configuration files
    " autocmd BufNewFile,BufRead
    "             \ Muttrc
    "             \,*/.muttrc.d/*.rc
    "             \,.muttrc
    "             \,/etc/Muttrc.d/*
    "             \ setfiletype muttrc

    " BIND configuration file
    " autocmd BufNewFile,BufRead
    "             \ named.conf
    "             \,rndc.conf
    "             \,rndc.key
    "             \ setfiletype named

    " Nano configuration file
    " autocmd BufNewFile,BufRead
    "             \ *.nanorc
    "             \,*/etc/nanorc
    "             \ setfiletype nanorc

    " netrc file
    " autocmd BufNewFile,BufRead
    "             \ .netrc
    "             \,netrc
    "             \ setfiletype netrc

    " roff files
    " autocmd BufNewFile,BufRead
    "             \ ?*.roff
    "             \,?*.[1-9]
    "             \,*/man[1-9]*/?*.[1-9]*
    "             \ setfiletype nroff

    " UNIX password and shadow files
    " autocmd BufNewFile,BufRead
    "             \ /etc/passwd
    "             \,/etc/passwd-
    "             \,/etc/passwd.edit
    "             \,/etc/shadow
    "             \,/etc/shadow-
    "             \,/etc/shadow.edit
    "             \ setfiletype passwd
    " pass(1) password files
    " autocmd BufNewFile,BufRead
    "             \ /dev/shm/pass.?*/?*.txt
    "             \,$TMPDIR/pass.?*/?*.txt
    "             \,/tmp/pass.?*/?*.txt
    "             \ setfiletype password
    " Perl 5 files
    " autocmd BufNewFile,BufRead
    "             \ ?*.pl
    "             \,?*.pm
    "             \,*/t/?*.t
    "             \,*/xt/?*.t
    "             \,Makefile.PL
    "             \ setfiletype perl
    " Perl 6 files
    " autocmd BufNewFile,BufRead
    "             \ ?*.p6
    "             \,?*.pl6
    "             \,?*.pm6
    "             \ setfiletype perl6
    " PHP files
    " autocmd BufNewFile,BufRead
    "             \ ?*.php
    "             \ setfiletype php
    " Perl 5 POD files
    " autocmd BufNewFile,BufRead
    "             \ ?*.pod
    "             \ setfiletype pod
    " Perl 6 POD files
    " autocmd BufNewFile,BufRead
    "             \ ?*.pod6
    "             \ setfiletype pod6
    " Python files
    " autocmd BufNewFile,BufRead
    "             \ ?*.py
    "             \ setfiletype python
    " Readline configuration file
    " autocmd BufNewFile,BufRead
    "             \ .inputrc
    "             \,inputrc
    "             \ setfiletype readline
    " Remind files
    " autocmd BufNewFile,BufRead
    "             \ .reminders
    "             \,?*.rem
    "             \,?*.remind
    "             \ setfiletype remind
    " resolv.conf files
    " autocmd BufNewFile,BufRead
    "             \ resolv.conf
    "             \ setfiletype resolv
    " robots.txt files
    " autocmd BufNewFile,BufRead
    "             \ robots.txt
    "             \ setfiletype robots
    " Ruby
    " autocmd BufNewFile,BufRead
    "             \ ?*.rb
    "             \ setfiletype ruby
    " sed files
    " autocmd BufNewFile,BufRead
    "             \ ?*.sed
    "             \ setfiletype sed
    " Services files
    " autocmd BufNewFile,BufRead
    "             \ /etc/services
    "             \ setfiletype services
    " Bash shell
    " autocmd BufNewFile,BufRead
    "             \ ?*.bash
    "             \,.bash_aliases
    "             \,.bash_completion
    "             \,.bash_logout
    "             \,.bash_profile
    "             \,.bashrc
    "             \,bash-fc.?*
    "             \,bash_aliases
    "             \,bash_completion
    "             \,bash_logout
    "             \,bash_profile
    "             \,bashrc
    "             \ let b:is_bash = 1
    "             \|setfiletype sh
    " Korn shell
    " autocmd BufNewFile,BufRead
    "             \ ?*.ksh
    "             \,.kshrc
    "             \,kshrc
    "             \ let b:is_kornshell = 1
    "             \|setfiletype sh
    " POSIX/Bourne shell
    " autocmd BufNewFile,BufRead
    "             \ ?*.sh
    "             \,$ENV
    "             \,.profile
    "             \,.shinit
    "             \,.shrc
    "             \,.xinitrc
    "             \,/etc/default/*
    "             \,configure
    "             \,profile
    "             \,shinit
    "             \,shrc
    "             \,xinitrc
    "             \ let b:is_posix = 1
    "             \|setfiletype sh
    " SQL
    " autocmd BufNewFile,BufRead
    "             \ ?*.sql
    "             \ setfiletype sql
    " OpenSSH configuration
    " autocmd BufNewFile,BufRead
    "             \ ssh_config,*/.ssh/config
    "             \ setfiletype sshconfig
    " sudoers(5)
    " autocmd BufNewFile,BufRead
    "             \ sudoers
    "             \,sudoers.tmp
    "             \ setfiletype sshdconfig
    " OpenSSH server configuration
    " autocmd BufNewFile,BufRead
    "             \ sshd_config
    "             \ setfiletype sudoers
    " Subversion commit
    " autocmd BufNewFile,BufRead
    "             \ svn-commit*.tmp
    "             \ setfiletype svn
    " Systemd unit files
    " autocmd BufNewFile,BufRead
    "             \ */systemd/*.*
    "             \ setfiletype systemd
    " TCL
    " autocmd BufNewFile,BufRead
    "             \ ?*.tcl
    "             \ setfiletype tcl
    " Terminfo
    " autocmd BufNewFile,BufRead
    "             \ ?*.ti
    "             \ setf terminfo
    " Tidy config
    " autocmd BufNewFile,BufRead
    "             \ .tidyrc
    "             \,tidyrc
    "             \ setfiletype tidy
    " tmux configuration files
    " autocmd BufNewFile,BufRead
    "             \ .tmux.conf
    "             \,tmux.conf
    "             \ setfiletype tmux
    " Tab-separated (TSV) files
    " autocmd BufNewFile,BufRead
    "             \ ?*.tsv
    "             \ setfiletype tsv

    " VimL files
    autocmd BufNewFile,BufRead
                \ ?*.vim
                \,*.exrc
                \,*.gvimrc
                \,*.vimrc
                \,_exrc
                \,_gvimrc
                \,_vimrc
                \,exrc
                \,gvimrc
                \,vimrc
                \ setfiletype vim

    " .viminfo files
    autocmd BufNewFile,BufRead
                \ .viminfo
                \ setfiletype viminfo

    " .wgetrc files
    " autocmd BufNewFile,BufRead
    "             \ .wgetrc
    "             \,wgetrc
    "             \ setfiletype wget
    " Add automatic commands to find Xresources subfiles
    " autocmd BufNewFile,BufRead
    "             \ .Xresources
    "             \,*/.Xresources.d/*
    "             \,Xresources
    "             \,*/Xresources.d/*
    "             \ setfiletype xdefaults
    " XHTML files
    " autocmd BufNewFile,BufRead
    "             \ ?*.xhtml
    "             \,?*.xht
                " \ setfiletype xhtml
    " XML files
    " autocmd BufNewFile,BufRead
    "             \ ?*.xml
    "             \ setfiletype xml
    " Perl XS
    " autocmd BufNewFile,BufRead
    "             \ ?*.xs
    "             \ setfiletype xs
    " Yacc files
    " autocmd BufNewFile,BufRead
    "             \ ?*.y
    "             \,?*.yy
    "             \ setfiletype yacc
    " YAML files
    " autocmd BufNewFile,BufRead
    "             \ ?*.yaml,?*.yml
    "             \ setfiletype yaml
    " Z shell files
    " autocmd BufNewFile,BufRead
    "             \ ?*.zsh
    "             \,.zprofile
    "             \,.zshrc
    "             \,zprofile
    "             \,zshrc
    "             \ setfiletype zsh

    " Generic text, config, and log files, if no type assigned yet
    " autocmd BufNewFile,BufRead
    "             \ ?*.text
    "             \,?*.txt
    "             \,INSTALL
    "             \,README
    "             \,/etc/issue
    "             \,/etc/motd
    "             \ setfiletype text
    " autocmd BufNewFile,BufRead
    "             \ ?*.cfg
    "             \,?*.conf
    "             \,?*.config
    "             \,/etc/*
    "             \ setfiletype config
    " autocmd BufNewFile,BufRead
    "             \ */log/*
    "             \,?*.log
    "             \ setfiletype messages

    " RVM .ruby-env
    " autocmd BufNewFile,BufReadPost *.ruby-env setlocal filetype=sh

    " JSON RC files
    " autocmd BufNewFile,BufReadPost .babelrc,.stylelintrc setlocal filetype=json

    " Conf files
    " autocmd BufNewFile,BufReadPost .dockerignore setlocal filetype=conf

    " autocmd BufRead,BufNewFile * setfiletype txt

    " autocmd BufRead,BufNewFile .eslintrc setfiletype json
    " autocmd BufRead,BufNewFile *.cocoascript setfiletype javascript
    " autocmd BufRead,BufNewFile *.sketchscript setfiletype javascript

augroup END

" function! PlainText()
"   setlocal comments=
" endfunction
"
" augroup plaintextbuffer
"   autocmd!
"   autocmd FileType txt call PlainText()
" augroup END

if exists("+omnifunc")

    augroup omnifunc
        autocmd!

        " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType c setlocal omnifunc=ccomplete#Complete
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        " autocmd FileType handlebars setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
        " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        " autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
        autocmd FileType python setlocal omnifunc=jedi#completions
        " autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
        " autocmd FileType sql setlocal omnifunc=sqlcomplete#CompleteTags
        " autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        autocmd Filetype *
                    \ if &omnifunc == "" |
                    \ setlocal omnifunc=syntaxcomplete#Complete |
                    \ endif

    augroup END

endif


" if has("autocmd")
"     let pandoc_pipeline  = "pandoc --from=html --to=html"
"     autocmd FileType html let &l:formatprg=pandoc_pipeline
" endif


augroup ft_matlab
    autocmd!
    au BufRead,BufNewFile *.m set filetype=matlab
    autocmd FileType matlab setlocal textwidth=80
    autocmd FileType matlab setlocal formatprg=fmt\ -w80
    autocmd FileType matlab setlocal formatoptions=croql
    autocmd FileType matlab setlocal commentstring=%\ %s
    autocmd FileType matlab set colorcolumn=81        " highlight column after 'textwidth'
augroup END

" if executable('ant')
"     augroup JavaMakeSettings
"         autocmd!
"         autocmd FileType java setlocal makeprg=ant\ -find\ 'build.xml'
"         autocmd FileType java compiler ant
"         autocmd FileType java setlocal shellpipe=2>&1\ \|\ tee
"     augroup END
" endif


" augroup filetypes_other
"     autocmd!

"     " support for cmake files
"     " autocmd BufNewFile,BufRead CMakeLists.txt set filetype=cmake

"     " support for stylus syntax highlighting
"     " autocmd BufRead,BufNewFile *.styl set filetype=stylus

"     " vim-vue workaround for randomly stopping syntax highlighting
"     " autocmd FileType vue syntax sync fromstart

" augroup END

augroup MscFileTypeSettings
    autocmd!
    " Use the java docs for keyword help
    " autocmd FileType less setlocal makeprg=lessc\ %\ >\ ../css/%:t:r.css

    " When editing plain text I don't need to see the ends of lines.
    " autocmd FileType txt setlocal wrap linebreak nolist textwidth=0 wrapmargin=0
    " autocmd BufEnter *.js setlocal foldmethod=indent
    autocmd BufEnter *.gitignore setlocal commentstring=#\ %s
augroup END

" augroup ft_conf
"     autocmd!
"
"     au BufNewFile,BufRead *.conf set filetype=conf
"     autocmd FileType conf setlocal foldmethod=marker
"     autocmd Filetype conf setlocal foldmarker={{{,}}}
" augroup END


augroup ft_gitcommit
    autocmd!

    autocmd BufEnter,BufRead,BufNewFile gitcommit setlocal textwidth=72
    autocmd FileType gitcommit setlocal spell
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType gitcommit setlocal colorcolumn=73
    autocmd FileType gitcommit match ErrorMsg /\%1l.\%>51v/ " warning if first line too long
augroup END

" augroup ft_html
"     autocmd!
"
"     autocmd Filetype html setlocal foldmethod=indent
"     let pandoc_pipeline  = "pandoc --from=html --to=markdown"
"     let pandoc_pipeline .= " | pandoc --from=markdown --to=html"
"     autocmd FileType html setlocal formatexpr=FormatprgLocal(pandoc_pipeline)
" augroup END

augroup ft_vim_help
    autocmd!

    " Make vim resize on host window resize.  Great for increaseing/decreasing
    " font or when you disconnect from your external monitor.
    autocmd FileType vim setlocal foldmethod=marker
    " autocmd FileType vim setlocal list!
    autocmd FileType help setlocal textwidth=80
    autocmd FileType help set number
    autocmd FileType help set relativenumber
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

augroup ft_dot
    autocmd!
    autocmd FileType dot setlocal commentstring=//\ %s
augroup END

augroup ft_yaml_rss
    autocmd!

    autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
    " autocmd BufNewFile,BufRead *.rss setfiletype xml
augroup END

augroup ft_latex
    autocmd!
    au BufRead,BufNewFile *.tex,*.tikz,*.cls,*.sty set filetype=tex
    au BufRead,BufNewFile latexmkrc set filetype=perl
    autocmd FileType tex setlocal textwidth=80
    autocmd FileType tex setlocal isfname-={,}
    " autocmd FileType tex setlocal formatprg=par\ -jw80
    autocmd FileType tex vmap <A-q> !par -jw80<CR>
    autocmd FileType tex map <A-q> my{v}!par -jw80<CR>`y
    autocmd FileType tex setlocal formatoptions-=t
    autocmd FileType tex setlocal spell
    autocmd FileType tex setlocal spelllang=en_gb
    " autocmd FileType tex setlocal formatoptions=at
    autocmd FileType tex setlocal keywordprg=texdoc
    autocmd FileType bib setlocal foldmethod=syntax
    autocmd FileType tex setlocal foldenable
    autocmd FileType tex setlocal foldlevel=1
    autocmd FileType tex setlocal foldlevelstart=1
    " autocmd FileType tex setlocal iskeyword-=:
    autocmd FileType tex set colorcolumn=+1        " highlight column after 'textwidth'
    " autocmd BufWritePost * !rsync --checksum .git/gitHeadInfo.gin .
    " autocmd BufReadPost,BufNewFile *.tex silent! execute "!rsync --checksum .git/gitHeadInfo.gin gitHeadLocal.gin  >/dev/null 2>&1" | redraw!
    " autocmd BufWritePre *.tex silent! execute "!rsync --checksum .git/gitHeadInfo.gin gitHeadLocal.gin  >/dev/null 2>&1" | redraw!
    " support for gitinfo2 package
    " au BufReadPost,BufNewFile *.tex Limelight 0.7
augroup END

" https://vimrcfu.com/snippet/168
" In CSS, hyphens are part of identifiers (keywords, properties, selectors...). By adding it to the iskeyword list, vim will consider identifiers as a whole word.
" augroup csshyphen
"     autocmd!
"     autocmd FileType css,scss setl iskeyword+=-
" augroup END

" React in Javascript files
" augroup JavascriptLibraries
"   autocmd!
"   autocmd BufReadPre *.js let b:javascript_lib_use_react=1
" augroup END
