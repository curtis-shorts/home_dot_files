This repo is setup to make my dot files easily transferable to any machine.

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

Commands to install nvim:
```
wget --directory-prefix ~/.local/bin -c https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.appimage
mv ~/.local/bin/nvim-linux-x86_64.appimage ~/.local/bin/nvim
chmod 770 ~/.local/bin/nvim
```
