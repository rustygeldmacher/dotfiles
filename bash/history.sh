# From https://metaredux.com/posts/2020/07/07/supercharge-your-bash-history.html

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# append and reload the history after each command
export PROMPT_COMMAND="history -a; history -n"

# ignore certain commands from the history
export HISTIGNORE="ls:ls -l:ll:cd:pwd:bg:fg:history"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=100000
