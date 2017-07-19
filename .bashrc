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

source ~/.local/share/nvim/plugged/neoman.vim/scripts/nman.zsh

export PATH="/home/kg314/.gem/ruby/2.4.0/bin:$PATH"

# added by Anaconda2 4.3.1 installer
export PATH="/home/kg314/anaconda2/bin:$PATH"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
# export FZF_DEFAULT_OPTS='
#   --color=bg+:#073642,bg:#002b36,spinner:#719e07,hl:#586e75
#   --color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#719e07
#   --color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07
# '
# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'
# There are also _fzf_path_completion and _fzf_dir_completion
complete -F _fzf_file_completion -o default -o bashdefault doge
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
source ~/git-completion.bash

export HISTCONTROL=ignoreboth:erasedups

export MANPAGER="nvim -c 'set ft=neoman' -"
export PATH="/usr/local/texlive/2012/bin/x86_64-linux:$PATH"
export INFOPATH="/usr/local/texlive/2012/texmf-dist/doc/info:$INFOPATH"
export MANPATH="/usr/local/texlive/2012/texmf-dist/doc/man:$MANPATH"
export PATH="/opt/latexmk_install:$PATH"

vim='vim --servername vim'

export TERM=xterm-color

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

## Setup for /bin/ls and /bin/grep to support color, the alias is in /etc/bashrc.
#if [ -f "/etc/dircolors" ] ; then
#        eval $(dircolors -b /etc/dircolors)
#
#        if [ -f "$HOME/.dircolors" ] ; then
#                eval $(dircolors -b $HOME/.dircolors)
#        fi
#fi
export TEXINPUTS=":/run/media/kg314/RscrchDrive_NTFS/Krishna_Research_Folder/Krishna\ Imperial\ Research/P2D_models/LIONSIMBA_Variants/paper_draft_layer_opt/do_NOT_edit_rsc_template_downloaded_original/packages/:"