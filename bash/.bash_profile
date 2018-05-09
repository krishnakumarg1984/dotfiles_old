#
# ~/.bash_profile
#

[[ -f ~/.extend.bash_profile ]] && . ~/.extend.bash_profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi
