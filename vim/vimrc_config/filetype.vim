" Override system filetype.vim if sufficiently new
if exists('g:did_load_filetypes') || v:version < 700
  finish
endif
let g:did_load_filetypes = 1

" If we don't have +autocmd or are 'compatible', do nothing, and don't try
" again later
if !has('autocmd') || &compatible
  finish
endif

" Helper function to run the 'filetypedetect' group on a file with its
" extension stripped off
function! s:StripRepeat()

  " Check we have the fnameescape() function
  if !exists('*fnameescape')
    return
  endif

  " Expand the match result
  let l:fn = expand('<afile>')

  " Strip leading and trailing #hashes#
  if l:fn =~# '^#\+.*#\+$'
    let l:fn = substitute(l:fn, '^#\+\(.\+\)#\+$', '\1', '')

  " Strip trailing tilde~
  elseif l:fn =~# '\~$'
    let l:fn = substitute(l:fn, '\~$', '', '')

  " Strip generic .extension
  else
    let l:fn = expand('<afile>:r')
  endif

  " Re-run the group if there's anything left
  if strlen(l:fn)
    execute 'doautocmd filetypedetect BufRead ' . fnameescape(l:fn)
  endif

endfunction

" Helper function to run the 'filetypedetect' group on a file in a temporary
" sudoedit(8) directory, modifying it with an attempt to reverse the temporary
" filename change
function! s:SudoRepeat()

  " Check we have the fnameescape() function
  if !exists('*fnameescape')
    return
  endif

  " Expand the match result
  let l:fn = expand('<afile>')

  " myfileXXQGS16A.conf: strip eight chars before final period
  if l:fn =~# '/[^./]\+\w\{8}\.[^./]\+$'
    let l:fr = expand('<afile>:r')
    let l:fe = expand('<afile>:e')
    let l:fn = strpart(l:fr, -8, strlen(l:fr)) . '.' . l:fe

  " myfile.XXQGS16A: strip extension
  elseif l:fn =~# '/[^./]\+\.\w\{8}$'
    let l:fn = expand('<afile>:r')

  " Unrecognised pattern; return, don't repeat
  else
    return
  endif

  " Re-run the group if there's anything left
  if strlen(l:fn)
    execute 'doautocmd filetypedetect BufRead ' . fnameescape(l:fn)
  endif

endfunction

" Check whether the first line was changed and looks like a shebang, and if
" so, re-run filetype detection
function! s:CheckShebang()
  if line('''[') == 1 && getline(1) =~# '^#!'
    doautocmd filetypedetect BufRead
  endif
endfunction

" Use our own filetype detection rules
augroup filetypedetect
  autocmd!

  " Unwrap hashes, tildes, generic extensions, and Debian packaging working
  " extensions (if we can do so safely), and repeat the filetype detection to
  " see if there's a match beneath them
  autocmd BufNewFile,BufRead
        \ #?*#
        \,?*~
        \,?*.{bak,example,in,new,old,orig,sample,test}
        \,?*.dpkg-{bak,dist,new,old}
        \ call s:StripRepeat()

  " Stuff Tom cares about enough and edits often enough to type based on
  " filename patterns follows.

  " Apache config
  autocmd BufNewFile,BufRead
        \ .htaccess
        \,*/apache*/?*.conf
        \ setfiletype apache
  " Assembly language files
  autocmd BufNewFile,BufRead
        \ ?*.s
        \ setfiletype asm
  " AWK files
  autocmd BufNewFile,BufRead
        \ ?*.awk
        \ setfiletype awk
  " BIND zone file
  autocmd BufNewFile,BufRead
        \ */bind/db.?*
        \,*/namedb/db.?*
        \,named.root
        \ setfiletype bindzone
  " C files
  autocmd BufNewFile,BufRead
        \ ?*.c
        \,?*.h
        \ setfiletype c
  " C++ files
  autocmd BufNewFile,BufRead
        \ ?*.cpp
        \,?*.cxx
        \,?*.c++
        \,?*.hh
        \ setfiletype cpp
  " crontab(5) files
  autocmd BufNewFile,BufRead
        \ crontab
        \,crontab.*
        \,cron.d/*
        \ setfiletype crontab
  " CSS files
  autocmd BufNewFile,BufRead
        \ ?*.css
        \ setfiletype css
  " CSV files
  autocmd BufNewFile,BufRead
        \ ?*.csv
        \ setfiletype csv
  " Diff and patch files
  autocmd BufNewFile,BufRead
        \ ?*.diff
        \,?*.patch
        \,?*.rej
        \ setfiletype diff
  " INI files
  autocmd BufNewFile,BufRead
        \ ?*.ini
        \ setfiletype dosini
  " DOT graphs
  autocmd BufNewFile,BufRead
        \ ?*.dot
        \ setfiletype dot
  " Forth
  autocmd BufNewFile,BufRead
        \ ?*.fs,?*.ft
        \ setfiletype forth
  " fstab(5) files
  autocmd BufNewFile,BufRead
        \ fstab
        \ setfiletype fstab
  " GDB init files
  autocmd BufNewFile,BufRead
        \ .gdbinit
        \ setfiletype gdb
  " Git commit messages
  autocmd BufNewFile,BufRead
        \ COMMIT_EDITMSG
        \,MERGE_MSG
        \,TAG_EDITMSG
        \ setfiletype gitcommit
  " Git config files
  autocmd BufNewFile,BufRead
        \ *.git/config
        \,.gitconfig
        \,.gitmodules
        \,gitconfig
        \ setfiletype gitconfig
  " Git rebase manifests
  autocmd BufNewFile,BufRead
        \ git-rebase-todo
        \ setfiletype gitrebase
  " GnuPG configuration files
  autocmd BufNewFile,BufRead
        \ *gnupg/options
        \,*gnupg/gpg.conf
        \ setfiletype gpg
  " UNIX group file
  autocmd BufNewFile,BufRead
        \ /etc/group
        \,/etc/group-
        \,/etc/group.edit
        \,/etc/gshadow
        \,/etc/gshadow-
        \,/etc/gshadow.edit
        \ setfiletype group
  " GTK settings files
  autocmd BufNewFile,BufRead
        \ .gktrc*,
        \,gktrc*
        \ setfiletype gtkrc
  " Vim help files
  autocmd BufNewFile,BufRead
        \ ~/.vim/doc/?*.txt
        \,*/vim-*/doc/?*.txt
        \,*/*.vim/doc/?*.txt
        \,$VIMRUNTIME/doc/?*.txt
        \ setfiletype help
  " HTML files
  autocmd BufNewFile,BufRead
        \ ?*.html
        \,?*.htm
        \ setfiletype html
  " hosts(5) file
  autocmd BufNewFile,BufRead
        \ /etc/hosts
        \ setfiletype hostconf
  " inittab(5) files
  autocmd BufNewFile,BufRead
        \ inittab
        \ setfiletype inittab
  " Java files
  autocmd BufNewFile,BufRead
        \ ?*.java
        \,?*.jav
        \ setfiletype java
  " JSON files
  autocmd BufNewFile,BufRead
        \ ?*.js
        \ setfiletype javascript
  " JSON files
  autocmd BufNewFile,BufRead
        \ ?*.json
        \ setfiletype json
  " Lex files
  autocmd BufNewFile,BufRead
        \ ?*.l
        \,?*.lex
        \ setfiletype lex
  " Lua files
  autocmd BufNewFile,BufRead
        \ ?*.lua
        \ setfiletype lua
  " m4 files
  autocmd BufNewFile,BufRead
        \ ?*.m4
        \ setfiletype m4
  " Mail messages
  autocmd BufNewFile,BufRead
        \ ?*.msg
        \,mutt-*-[0-9]\+-[0-9]\+-[0-9]\+
        \ setfiletype mail
  " Mail messages
  autocmd BufNewFile,BufRead
        \ aliases
        \ setfiletype mailaliases
  " Makefiles
  autocmd BufNewFile,BufRead
        \ Makefile
        \,makefile
        \ setfiletype make
  " Markdown files
  autocmd BufNewFile,BufRead
        \ ?*.markdown
        \,?*.md
        \ setfiletype markdown
  " Mutt configuration files
  autocmd BufNewFile,BufRead
        \ Muttrc
        \,*/.muttrc.d/*.rc
        \,.muttrc
        \,/etc/Muttrc.d/*
        \ setfiletype muttrc
  " BIND configuration file
  autocmd BufNewFile,BufRead
        \ named.conf
        \,rndc.conf
        \,rndc.key
        \ setfiletype named
  " Nano configuration file
  autocmd BufNewFile,BufRead
        \ *.nanorc
        \,*/etc/nanorc
        \ setfiletype nanorc
  " netrc file
  autocmd BufNewFile,BufRead
        \ .netrc
        \,netrc
        \ setfiletype netrc
  " roff files
  autocmd BufNewFile,BufRead
        \ ?*.roff
        \,?*.[1-9]
        \,*/man[1-9]*/?*.[1-9]*
        \ setfiletype nroff
  " UNIX password and shadow files
  autocmd BufNewFile,BufRead
        \ /etc/passwd
        \,/etc/passwd-
        \,/etc/passwd.edit
        \,/etc/shadow
        \,/etc/shadow-
        \,/etc/shadow.edit
        \ setfiletype passwd
  " pass(1) password files
  autocmd BufNewFile,BufRead
        \ /dev/shm/pass.?*/?*.txt
        \,$TMPDIR/pass.?*/?*.txt
        \,/tmp/pass.?*/?*.txt
        \ setfiletype password
  " Perl 5 files
  autocmd BufNewFile,BufRead
        \ ?*.pl
        \,?*.pm
        \,*/t/?*.t
        \,*/xt/?*.t
        \,Makefile.PL
        \ setfiletype perl
  " Perl 6 files
  autocmd BufNewFile,BufRead
        \ ?*.p6
        \,?*.pl6
        \,?*.pm6
        \ setfiletype perl6
  " PHP files
  autocmd BufNewFile,BufRead
        \ ?*.php
        \ setfiletype php
  " Perl 5 POD files
  autocmd BufNewFile,BufRead
        \ ?*.pod
        \ setfiletype pod
  " Perl 6 POD files
  autocmd BufNewFile,BufRead
        \ ?*.pod6
        \ setfiletype pod6
  " Python files
  autocmd BufNewFile,BufRead
        \ ?*.py
        \ setfiletype python
  " Readline configuration file
  autocmd BufNewFile,BufRead
        \ .inputrc
        \,inputrc
        \ setfiletype readline
  " Remind files
  autocmd BufNewFile,BufRead
        \ .reminders
        \,?*.rem
        \,?*.remind
        \ setfiletype remind
  " resolv.conf files
  autocmd BufNewFile,BufRead
        \ resolv.conf
        \ setfiletype resolv
  " robots.txt files
  autocmd BufNewFile,BufRead
        \ robots.txt
        \ setfiletype robots
  " Ruby
  autocmd BufNewFile,BufRead
        \ ?*.rb
        \ setfiletype ruby
  " sed files
  autocmd BufNewFile,BufRead
        \ ?*.sed
        \ setfiletype sed
  " Services files
  autocmd BufNewFile,BufRead
        \ /etc/services
        \ setfiletype services
  " Bash shell
  autocmd BufNewFile,BufRead
        \ ?*.bash
        \,.bash_aliases
        \,.bash_completion
        \,.bash_logout
        \,.bash_profile
        \,.bashrc
        \,bash-fc.?*
        \,bash_aliases
        \,bash_completion
        \,bash_logout
        \,bash_profile
        \,bashrc
        \ let b:is_bash = 1
        \|setfiletype sh
  " Korn shell
  autocmd BufNewFile,BufRead
        \ ?*.ksh
        \,.kshrc
        \,kshrc
        \ let b:is_kornshell = 1
        \|setfiletype sh
  " POSIX/Bourne shell
  autocmd BufNewFile,BufRead
        \ ?*.sh
        \,$ENV
        \,.profile
        \,.shinit
        \,.shrc
        \,.xinitrc
        \,/etc/default/*
        \,configure
        \,profile
        \,shinit
        \,shrc
        \,xinitrc
        \ let b:is_posix = 1
        \|setfiletype sh
  " SQL
  autocmd BufNewFile,BufRead
        \ ?*.sql
        \ setfiletype sql
  " OpenSSH configuration
  autocmd BufNewFile,BufRead
        \ ssh_config,*/.ssh/config
        \ setfiletype sshconfig
  " sudoers(5)
  autocmd BufNewFile,BufRead
        \ sudoers
        \,sudoers.tmp
        \ setfiletype sshdconfig
  " OpenSSH server configuration
  autocmd BufNewFile,BufRead
        \ sshd_config
        \ setfiletype sudoers
  " Subversion commit
  autocmd BufNewFile,BufRead
        \ svn-commit*.tmp
        \ setfiletype svn
  " Systemd unit files
  autocmd BufNewFile,BufRead
        \ */systemd/*.*
        \ setfiletype systemd
  " TCL
  autocmd BufNewFile,BufRead
        \ ?*.tcl
        \ setfiletype tcl
  " Terminfo
  autocmd BufNewFile,BufRead
        \ ?*.ti
        \ setf terminfo
  " Tidy config
  autocmd BufNewFile,BufRead
        \ .tidyrc
        \,tidyrc
        \ setfiletype tidy
  " tmux configuration files
  autocmd BufNewFile,BufRead
        \ .tmux.conf
        \,tmux.conf
        \ setfiletype tmux
  " Tab-separated (TSV) files
  autocmd BufNewFile,BufRead
        \ ?*.tsv
        \ setfiletype tsv
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
  autocmd BufNewFile,BufRead
        \ .wgetrc
        \,wgetrc
        \ setfiletype wget
  " Add automatic commands to find Xresources subfiles
  autocmd BufNewFile,BufRead
        \ .Xresources
        \,*/.Xresources.d/*
        \,Xresources
        \,*/Xresources.d/*
        \ setfiletype xdefaults
  " XHTML files
  autocmd BufNewFile,BufRead
        \ ?*.xhtml
        \,?*.xht
        \ setfiletype xhtml
  " XML files
  autocmd BufNewFile,BufRead
        \ ?*.xml
        \ setfiletype xml
  " Perl XS
  autocmd BufNewFile,BufRead
        \ ?*.xs
        \ setfiletype xs
  " Yacc files
  autocmd BufNewFile,BufRead
        \ ?*.y
        \,?*.yy
        \ setfiletype yacc
  " YAML files
  autocmd BufNewFile,BufRead
        \ ?*.yaml
        \ setfiletype yaml
  " Z shell files
  autocmd BufNewFile,BufRead
        \ ?*.zsh
        \,.zprofile
        \,.zshrc
        \,zprofile
        \,zshrc
        \ setfiletype zsh

  " Load any extra rules in ftdetect directories
  runtime! ftdetect/*.vim

  " Clumsy attempt at typing files in `sudo -e` if a filename hasn't already
  " been found
  autocmd BufNewFile,BufRead
        \ /var/tmp/?*????????.*
        \,/var/tmp/?*.????????
        \ if !did_filetype()
        \|  call s:SudoRepeat()
        \|endif

  " Generic text, config, and log files, if no type assigned yet
  autocmd BufNewFile,BufRead
        \ ?*.text
        \,?*.txt
        \,INSTALL
        \,README
        \,/etc/issue
        \,/etc/motd
        \ setfiletype text
  autocmd BufNewFile,BufRead
        \ ?*.cfg
        \,?*.conf
        \,?*.config
        \,/etc/*
        \ setfiletype config
  autocmd BufNewFile,BufRead
        \ */log/*
        \,?*.log
        \ setfiletype messages

  " If we still don't have a filetype, run the scripts.vim file that performs
  " cleverer checks including looking at actual file contents--but only my
  " custom one; don't load the system one at all.
  autocmd BufNewFile,BufRead,StdinReadPost
        \ *
        \ if !did_filetype()
        \|  runtime shebang_detection.vim
        \|endif

  " On leaving insert mode, check whether the first line was changed and looks
  " like a shebang format, and if so, re-run filetype detection
  autocmd InsertLeave * call s:CheckShebang()

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

if executable('ant')
    augroup JavaMakeSettings
        autocmd!
        autocmd FileType java setlocal makeprg=ant\ -find\ 'build.xml'
        autocmd FileType java compiler ant
        autocmd FileType java setlocal shellpipe=2>&1\ \|\ tee
    augroup END
endif
 

augroup filetypes_other
    autocmd!

    " support for cmake files
    autocmd BufNewFile,BufRead CMakeLists.txt set filetype=cmake

    " support for stylus syntax highlighting
    autocmd BufRead,BufNewFile *.styl set filetype=stylus

    " vim-vue workaround for randomly stopping syntax highlighting
    autocmd FileType vue syntax sync fromstart

augroup END
 
augroup MscFileTypeSettings
    autocmd!
    " Use the java docs for keyword help
    autocmd FileType less setlocal makeprg=lessc\ %\ >\ ../css/%:t:r.css

    " When editing plain text I don't need to see the ends of lines.
    " autocmd FileType txt setlocal wrap linebreak nolist textwidth=0 wrapmargin=0
    autocmd BufEnter *.js setlocal foldmethod=indent
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
augroup END

" augroup ft_html
"     autocmd!
" 
"     autocmd Filetype html setlocal foldmethod=indent
"     let pandoc_pipeline  = "pandoc --from=html --to=markdown"
"     let pandoc_pipeline .= " | pandoc --from=markdown --to=html"
"     autocmd FileType html setlocal formatexpr=FormatprgLocal(pandoc_pipeline)
" augroup END
 
augroup ft_vim
    autocmd!

    " Make vim resize on host window resize.  Great for increaseing/decreasing
    " font or when you disconnect from your external monitor.
    autocmd VimResized * wincmd =
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

autocmd FileType dot setlocal commentstring=//\ %s
augroup ft_yaml_rss
    autocmd!

    autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd BufNewFile,BufRead *.rss setfiletype xml
augroup END

augroup ft_latex
    autocmd!
    au BufRead,BufNewFile *.tex,*.tikz set filetype=tex
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

