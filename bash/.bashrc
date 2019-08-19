# .bashrc

[[ $- != *i* ]] && return

complete -cf sudo

if [[ -e $HOME/.bash_conda ]]; then
    source $HOME/.bash_conda
fi

if [[ -e $HOME/.bash_aliases ]]; then
    source $HOME/.bash_aliases
fi

# # export MANPAGER="nvim -c 'set ft=man' -"
# export MANPAGER='nvim +Man!'
# export SUDO_EDITOR='/usr/bin/nvim'
# export EDITOR="/usr/bin/nvim"
# export VISUAL='/usr/bin/nvim'

export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
export HISTSIZE=500 # keep only last 500 commands
export HISTFILESIZE=100000 # keep only 100kb of text

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

eval $(dircolors -b $HOME/.dircolors)

# Don't check mail when opening terminal.
unset MAILCHECK

# GoLang
export GOROOT=$HOME/.go

export SH=/bin/bash

# Nodejs
VERSION=v10.16.0
DISTRO=linux-x64

PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git' # If you want the command to follow symbolic links, and don't want it to exclude hidden files, use the following command:"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# ALT-C preview The following example uses tree command to show the entries of the directory.
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/texlive/2019/bin/x86_64-linux:$PATH"
export PATH="$HOME/perl5/bin${PATH:+:${PATH}}";
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
export PATH="$PATH:$GOROOT/bin"
export PATH="$HOME/pkg/sbin:$HOME/pkg/bin:$PATH"
export PATH="$HOME/node-$VERSION-$DISTRO/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:$HOME/ctags/bin"
export PATH="$PATH:$HOME/remake/bin"

export MANPATH="$HOME/texlive/2019/texmf-dist/doc/man:$MANPATH"
export MANPATH="$HOME/pkg/man:$MANPATH"
export MANPATH="$MANPATH:$HOME/man"

export INFOPATH="$HOME/texlive/2019/texmf-dist/doc/info:$INFOPATH"
