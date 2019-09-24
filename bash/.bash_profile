#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

conda activate

export PATH="$HOME/.cargo/bin:$PATH"
