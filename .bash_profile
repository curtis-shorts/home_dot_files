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
elif [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi

##### NVIM CONFIG #####
if [[ ! -e ~/.local/bin/nvim ]]; then
    echo "Installing nvim at ~/.local/bin/nvim"
    wget --directory-prefix ~/.local/bin -c https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage
    mv ~/.local/bin/nvim.appimage ~/.local/bin/nvim
    chmod 770 ~/.local/bin/nvim
fi

export PATH="$PATH:/home/cushorts/.local/bin"

