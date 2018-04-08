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

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='zork'

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

export FZF_DEFAULT_COMMAND='rg --files'

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  export PS1="» "
else
  export PS1="\$ "
fi

export MANPAGER="nvim -c 'set ft=man' -"

export PATH="/usr/local/texlive/2018/bin/x86_64-linux:$PATH"
export MANPATH="/usr/local/texlive/2018/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2018/texmf-dist/doc/info:$INFOPATH"
export PDFVIEWER_texdoc='zathura'
export PDFVIEWER='zathura'

export PATH="/usr/local/latexmk:$PATH"

glog ()
{
    git log --all --pretty='format:%d %Cgreen%h%Creset %an - %s' --graph
}

export FZF_DEFAULT_OPTS="--height 40% --preview='head -$LINES {}'"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


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
