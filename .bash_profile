##### MAC CONFIG #####
if [[ `uname` == "Darwin" ]]; then
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

    _complete_ssh_hosts () {
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        # Extract hosts from config and known_hosts, ignoring wildcards
        comp_ssh_hosts=$(grep -i "^Host " ~/.ssh/config | awk '{print $2}' | grep -v '*')
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
    }
    complete -F _complete_ssh_hosts ssh

fi

##### Source .bashrc #####
if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi

