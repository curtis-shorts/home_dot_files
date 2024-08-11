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
fi

##### Source .bashrc #####
if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi

##### NVIM CONFIG #####
if [[ ! -e ~/.local/bin/nvim ]]; then
    echo "Nvim is not installed at ~/.local/bin/nvim. Setup nvim and packer with the following commands:"
    echo "wget --directory-prefix ~/.local/bin -c https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage"
    echo "mv ~/.local/bin/nvim.appimage ~/.local/bin/nvim"
    echo "chmod 770 ~/.local/bin/nvim"
    echo "git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim"
    echo "In nvim run ':PackerSync'"
fi

export PATH="$PATH:/home/cushorts/.local/bin"

