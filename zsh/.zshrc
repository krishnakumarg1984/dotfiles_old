autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# added by travis gem
[ -f /home/kg314/.travis/travis.sh ] && source /home/kg314/.travis/travis.sh
