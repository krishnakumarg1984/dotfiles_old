# User specific aliases and functions
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias md='mkdir'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'

## ls
alias ls='ls -hF --color=auto'
alias sl='ls'
alias ll='ls -l'
alias la='ll -A'
alias lt='ll -rt'        # sort by date
alias lx='ll -BX'        # sort by extension
alias lz='ll -rS'        # sort by size
# alias lr='ls -R'       # recursive ls
# alias lrt='ls -lahrtg' # recursive ls
alias lm='ll | less'

## Safety features
alias cp='cp -iv'
alias mv='mv -iv'
# alias rm='rm -I'                    # 'rm -i' prompts for every file
# safer alternative w/ timeout, not stored in history
alias \rm=' timeout 3 rm -Iv --one-file-system'
alias del='trash-put -v'
alias rm='trash-put -v'
alias rd='rmdir'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cls=' echo -ne "\033c"'       # clear screen for real (it does not work in Terminology)

# alias _='sudo'

## Make Bash error tolerant
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias q='exit'
alias cd..='cd ..'
alias ..='cd ..'         # Go up one directory'
alias ...='cd ../..'     # Go up two directories'
alias ....='cd ../../..' # Go up three directories'
alias -- -='cd -'        # Go back'

alias h='history'
# alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

alias vimdiff='nvim -d'
alias oldvim="\vim"
alias vim="nvim"
alias vi="nvim"

alias bc='bc -l'
alias mroe=more
alias more=less


