# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

complete -cf sudo

if [[ -e $HOME/.bash_conda ]]; then
    . $HOME/.bash_conda
fi

if [[ -e $HOME/.bash_aliases ]]; then
    . $HOME/.bash_aliases
fi

# # export MANPAGER="nvim -c 'set ft=man' -"
# export MANPAGER='nvim +Man!'
# export SUDO_EDITOR='/home/krishna/bin/nvim'
# export EDITOR="/home/krishna/bin/nvim"
# export VISUAL='/home/krishna/bin/nvim'
# export BROWSER='firefox'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=100000 # keep only 100kb of text

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make 'less' more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"

    alias diff='diff --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias ls='ls -hF --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PDFVIEWER_texdoc='zathura'
export PDFVIEWER='zathura'

# # Setting for the new UTF-8 terminal support
export LC_CTYPE="en_GB.UTF-8"
export LC_COLLATE="C"
export LC_TIME="C"
export LC_NUMERIC="C"
export LC_MONETARY="C"
export LC_MESSAGES="en_GB.UTF-8"
export LC_ALL=""


# Don't check mail when opening terminal.
unset MAILCHECK

# GoLang
export GOROOT=$HOME/.go

export SH=/bin/bash

# Nodejs
NODEVERSION=v10.16.0
DISTRO=linux-x64

# PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git' # If you want the command to follow symbolic links, and don't want it to exclude hidden files, use the following command:"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# ALT-C preview The following example uses tree command to show the entries of the directory.
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash

# make fzf history search unique
__fzf_history__() (
    local line
    shopt -u nocaseglob nocasematch
    line=$(
        HISTTIMEFORMAT= history | sort -r -k 2 | uniq -f 1 | sort -n |
            FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS --tac --sync -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS +m" $(__fzfcmd) |
            command grep '^ *[0-9]'
        ) &&
        if [[ $- =~ H ]]; then
            sed 's/^ *\([0-9]*\)\** .*/!\1/' <<< "$line"
        else
            sed 's/^ *\([0-9]*\)\** *//' <<< "$line"
        fi
)

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/perl5/bin${PATH:+:${PATH}}";
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
export PATH="$PATH:$GOROOT/bin"
export PATH="$HOME/pkg/sbin:$HOME/pkg/bin:$PATH"
export PATH="$HOME/node-$NODEVERSION-$DISTRO/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:$HOME/ctags/bin"
export PATH="$PATH:$HOME/remake/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/go/bin"

export MANPATH="$HOME/pkg/man:$MANPATH"
export MANPATH="$MANPATH:$HOME/man"

export PATH="$HOME/texlive/2019/bin/x86_64-linux:$PATH"
export MANPATH="$HOME/texlive/2019/texmf-dist/doc/man:$MANPATH"
export INFOPATH="$HOME/texlive/2019/texmf-dist/doc/info:$INFOPATH"


# added by travis gem
[ -f /home/krishna/.travis/travis.sh ] && source /home/krishna/.travis/travis.sh

export DEAL_II_DIR=$HOME/deal.ii-candi/deal.II-master/

# Add color in manpages for less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

how_in() {
    where="$1"; shift
    IFS=+ curl "https://cht.sh/$where/$*"
}

# export PS1="\u@\h:\W\\$ \[$(tput sgr0)\]"
# export PS1="\u@\h:\w\n\v \\$ \[$(tput sgr0)\]"
export PS1="\u@\h:\w\n\\$ \[$(tput sgr0)\]"
