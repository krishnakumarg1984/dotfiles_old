#
# ~/.bash_profile
#

[[ -f ~/.extend.bash_profile ]] && . ~/.extend.bash_profile
[[ -f ~/.bashrc ]] && . ~/.bashrc


if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi
