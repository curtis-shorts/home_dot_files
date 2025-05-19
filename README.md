This repo is set up to make my dot files easily transferable to any machine.

Command to set up this repo in your home directory:
```
git init
git remote add origin https://github.com/curtis-shorts/home_dot_files
git fetch
git checkout -b main
git reset --mixed origin/main
git checkout origin/main -- .gitignore
git checkout -f
```

