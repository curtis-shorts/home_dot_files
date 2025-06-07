This repo exists to make my environment easily transferable to any machine.

# Install Dot Files
Commands to set up this repo in your home directory:
```
git init
git remote add origin https://github.com/curtis-shorts/home_dot_files
git fetch
git checkout -b main
git reset --mixed origin/main
git checkout origin/main -- .gitignore
git checkout -f
```

# Install NVIM
Commands to install nvim:
```
wget --directory-prefix ~/.local/bin -c https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-x86_64.appimage
mv ~/.local/bin/nvim-linux-x86_64.appimage ~/.local/bin/nvim
mv ~/.local/bin/nvim.appimage ~/.local/bin/nvim
chmod 770 ~/.local/bin/nvim
```

## GLIBC Version Issues
For systems with GLIBC version issues (e.g. DRAC), download nvim from the experimental release repo instead:
```
wget --directory-prefix ~/.local/bin -c https://github.com/neovim/neovim-releases/releases/download/v0.11.2/nvim-linux-x86_64.appimage
```
Then add the following version dependencies in the ~/.config/nvim/lua/plugins/lsp.lua file:
```
{'neovim/nvim-lspconfig', version = "0.1.7"},
{'williamboman/mason.nvim', version = "1.8.3"},
{'williamboman/mason-lspconfig.nvim', version = "1.24.0"},
```
And install the treesitter CLI globally:
```
npm install -g tree-sitter-cli
```
Or locally:
```
npm install -g tree-sitter-cli --prefix ~/.local
```
Note that this will still result in errors related to tree-sitter highlighting in Latex

