# ~/.bashrc: executed by bash(1) for non-login shells.
# See /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for examples
# See bash(1) for more options

# For DRAC SSH tunneling
export DAILY_DRAC_PASSWORD="620849686"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# History Settings
HISTCONTROL=ignoreboth # Ignore leading spaces
shopt -s histappend # Append to the end of ~/.bash_history instead of overwriting
HISTSIZE=1000 # The size of a terminal's history buffer in # of commands
HISTFILESIZE=2000 # The size of the ~/.bash_history file in # of commands

# Show all options when tab autocomplete is ambiguous
set show-all-if-ambiguous on

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Set custom command prompt
if [ "$color_prompt" == "yes" ]; then
    if [[ -z "${SSH_CONNECTION}" ]]; then
        # Local prompt
        export PS1="\[\e[1;32m\][\T] \[\e[33m\]\u@\h: \[\e[32m\]\w\n\[\e[35m\](\!) \[\e[97m\]-> \[\e[0m\]"
    else
        # Remote prompt (SSH)
        export PS1="\[\e[35;1m\][\T] \[\e[36m\]\u@\h: \[\e[97m\]\w\n\[\e[34m\](\!) \[\e[97m\]-> \[\e[0m\]"
    fi
else
    # Default no-color prompt
    export PS1="\[[\T] \u@\h: \w\n(\!) --> "
fi

# Enable programmable completion features (you don't need to enable this, if it's already
# enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

