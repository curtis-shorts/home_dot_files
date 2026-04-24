# ~/.config/fish/conf.d/aliases.fish

# Settings
alias s='source ~/.config/fish/config.fish'

if command -q nvim
    alias aliases='nvim ~/.config/fish/conf.d/aliases.fish'
    alias fishrc='nvim ~/.config/fish/config.fish'
    alias vimrc='nvim ~/.vimrc'
else
    alias aliases='vim ~/.config/fish/conf.d/aliases.fish'
    alias fishrc='vim ~/.config/fish/config.fish'
    alias vimrc='vim ~/.vimrc'
end

# Tools
alias v='vim'
alias nv='nvim'

# Auto-coloring
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ls shortcuts
alias lt='ls -ltrh'
alias la='ls -ltrhA'

# Lazy shorthands
alias h='history | nl'
alias c='clear'
alias j='jobs'
alias tf='tail -c +1 -f'

# Directory stack
alias pu='pushd .'
alias po='popd'
alias d='dirs -v'
alias dc='dirs -c'

# Disk space
alias dff='df -h'
alias duu='du -hs ./*'

# Tmux
alias t='tmux'
alias ts='tmux ls'
alias ta='tmux new-session -A -s'

# SLURM
alias wsq='watch -n 1 sq'

# DRAC (local only)
if test -z "$SSH_CONNECTION"
    alias dssh='/Users/cushorts/workspace/drac_login.export $DAILY_DRAC_PASSWORD ssh'
    alias dscp='/Users/cushorts/workspace/drac_login.export $DAILY_DRAC_PASSWORD scp'
end

# Tenstorrent
if test -d /opt/tt
    alias tt='cd /opt/tt/tt-metal; source python_env/bin/activate.fish'
    alias inf='cd /opt/tt/tt-inference-server'
end


