#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

[ -r /home/kg314/.byobu/prompt ] && . /home/kg314/.byobu/prompt   #byobu-prompt#

complete -cf sudo

# export PATH="~/.local/bin:$PATH"
# added by Anaconda2 installer
export PATH="/home/kg314/anaconda2/bin:$PATH"
export BROWSER=/usr/bin/chromium
# added by Anaconda3 installer
export PATH="/home/kg314/anaconda3/bin:$PATH"
export PATH="/home/kg314/.gem/ruby/2.5.0/bin:$PATH"
# Path to the bash it configuration
export BASH_IT="/home/kg314/.bash_it"
export LATEXMKRCSYS="/home/kg314/.latexmkrc"

# Lock and Load a custom theme file
# location /.bash_it/themes/
# export BASH_IT_THEME='zork'
export BASH_IT_THEME='bakke'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
# export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
# export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
# export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source "$BASH_IT"/bash_it.sh

source ~/nvim-aliases.sh
source ~/alias-nvim-nvr.sh

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'

## ls
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
# alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'


## Safety features
alias cp='cp -i'
alias mv='mv -i'
# alias rm='rm -I'                    # 'rm -i' prompts for every file
# safer alternative w/ timeout, not stored in history
alias rm=' timeout 3 rm -Iv --one-file-system'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cls=' echo -ne "\033c"'       # clear screen for real (it does not work in Terminology)

## Make Bash error tolerant
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'

export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
# export LESS='-R '
export LESS='-R -c -M -I -j 10 -# 4'
# -C  Make full-screen reprints faster by not scrolling from the bottom.
# -M  Show more information from the last (status) line. You can customize the information shown with -PM, but I usually
# do not bother.
# -I  Ignore letter case (upper/lower) in searches.
# -j 10  Show search results in line 10 of the terminal, instead of the first line. This way you have 10 lines of
# context each time you press n (or N) to jump to the next (or previous) match.
# -# 4  Jump four characters to the right or left when pressing the Right or Left arrow key. The default is to jump
# half of the screen, which I usually find to be too much. Generally speaking, less seems to be (at least partially)
# optimized to the environment it was initially developed in, with slow modems and low-bandwidth internet connections,
# when it made sense to jump half a screen.


if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  export PS1="» "
else
  export PS1="\$ "
fi

export MANPAGER="nvim -c 'set ft=man' -"

# export PATH="/usr/local/texlive/2018/bin/x86_64-linux:$PATH"
# export MANPATH="/usr/local/texlive/2018/texmf-dist/doc/man:$MANPATH"
# export INFOPATH="/usr/local/texlive/2018/texmf-dist/doc/info:$INFOPATH"
export PDFVIEWER_texdoc='zathura'
export PDFVIEWER='zathura'

export PATH="/usr/local/latexmk:$PATH"

glog ()
{
    git log --all --pretty='format:%d %Cgreen%h%Creset %an - %s' --graph
}

# export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_COMMAND='fd --type file --color=always --follow --hidden --exclude .git'
export FZF_DEFAULT_OPTS="--ansi --height 50% --preview='head -$LINES {}'"
# export FZF_DEFAULT_OPTS="--ansi --height 50% --preview='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'"
# export FZF_DEFAULT_OPTS="--ansi"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

source /usr/share/fzf/completion.bash && source /usr/share/fzf/key-bindings.bash


# re-wrote the script above
bind '"\C-r": "\C-x1\e^\er"'
bind -x '"\C-x1": __fzf_history';

__fzf_history ()
{
__ehc $(history | fzf --tac --tiebreak=index | perl -ne 'm/^\s*([0-9]+)/ and print "!$1"')
}

__ehc()
{
if
        [[ -n $1 ]]
then
        bind '"\er": redraw-current-line'
        bind '"\e^": magic-space'
        READLINE_LINE=${READLINE_LINE:+${READLINE_LINE:0:READLINE_POINT}}${1}${READLINE_LINE:+${READLINE_LINE:READLINE_POINT}}
        READLINE_POINT=$(( READLINE_POINT + ${#1} ))
else
        bind '"\er":'
        bind '"\e^":'
fi
}


# export GIT_EDITOR='vim +startinsert!'


if [ "$TERM" = "linux" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" $HOME/.Xresources | awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
    clear
fi

export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

bind '"\eh": "\C-a\eb\ed\C-y\e#man \C-y\C-m\C-p\C-p\C-a\C-d\C-e"'

# source /usr/share/doc/pkgfile/command-not-found.bash
# source /usr/share/doc/find-the-command/ftc.bash

alias lipsum="wget -q -O- http://lipsum.com/feed/html | tidy -q -numeric -asxhtml --show-warnings no - | xmlstarlet sel -N xhtml='http://www.w3.org/1999/xhtml' -t --copy-of \"//xhtml:div[@id='lipsum']/*/text()\" -n -b - | xclip -selection clipboard"

alias mc='tmux split -h lf; lf'

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

# added by travis gem
[ -f /home/kg314/.travis/travis.sh ] && source /home/kg314/.travis/travis.sh
