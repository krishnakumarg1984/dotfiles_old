# User specific aliases and functions
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias md='mkdir'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'

## ls
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

# alias vimdiff='nvim -d'
# alias oldvim="\vim"
# alias vim="nvim"
# alias vi="nvim"

alias bc='bc -l'
alias mroe=more
alias more=less

# Find out what is taking so much space on your drives
alias diskspace="du -S | sort -n -r | less"

# Git related
# alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'

#For when you've spent too much time in DOS
# alias cls="clear"
alias dir="ls"
alias deltree="rm -r"
# alias rmdir="rm -r"
# alias rd="rm -r"
# alias rename="mv"
alias cd..="cd .."
alias chdir="pwd"
alias cmd="bash"
# alias edit="nano -m -u -c -W --tabsize=4 --fill=100 --autoindent"
# alias erase="rm"
# alias del="rm"
# alias delete="rm"
alias tracert="traceroute"

# alias cp='rsync -ae ssh'
# alias cp='rsync -vhae ssh --progress'
alias cpv='rsync -ah --info=progress2'
alias cpa='rsync -vhae ssh --progress --append'

alias gh='history|grep'
