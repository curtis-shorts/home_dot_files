source ~/.bashrc

# For homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# For the "The default interactive shell is now zsh" shell warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# For Python environment control with pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
alias python='python3'
alias py='python3'
alias pip='pip3'

