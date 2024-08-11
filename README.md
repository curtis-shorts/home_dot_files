This repo is setup to make my dot files easily transferable to any machine
Setup with tutorial from https://coreyja.com/posts/dotfiles-git-in-home-dir/

Command to setup this repo in your home directory:
```
git init
git remote add origin https://github.com/curtis-shorts/home_dot_files
git fetch
git checkout -b main
git reset --mixed origin/main
git checkout origin/main -- .gitignore
git checkout -f
```

Commands to install nvim and the packer package manager:
```
wget --directory-prefix ~/.local/bin -c https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage
mv ~/.local/bin/nvim.appimage ~/.local/bin/nvim
chmod 770 ~/.local/bin/nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
