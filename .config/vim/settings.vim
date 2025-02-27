" Vim configuration settings

" General
set nocompatible        " Stops vim looking for other rc files (effects settings so needs to be first)
syntax on               " Allows for syntax highlighting
set noerrorbells visualbell t_vb=	    " Remove error bells/beeps for command errors
autocmd GUIEnter * set visualbell t_vb=	" Remove error bells/beeps for command errors

" Tab spacing
set tabstop=4           " The number of spaces a tab counts for
set softtabstop=4       " The number of spaces a tab counts for with editing operations
set shiftwidth=4        " The number of spaces used for auto-indent (>> <<)
set expandtab           " The number of spaces used for inserting tabs
set smartindent         " Automatically indent on a newline

" GUI navigation and line layout
set nu                  " Print the line number in the left margin
set relativenumber      " Show the line number relative to the line with the cursor 
set colorcolumn+=80     " Set a column number to be colored (inidcates code refactoring required)
set wrap                " Sets if the line wraps around when it hits the right margin
"set whichwrap+="<,>"    " When you pass EoL it takes you to the start of the next line (arrow keys only)
set scrolloff=15        " The minimum number of lines to keep above and bellow the cursor when scrolling
set ruler               " Shows the position of the cursor in the bottom right margin
set showmatch       	" Briefly jump to the matching bracket when you make a bracket

" GUI presentation
colorscheme catppuccin_mocha    " Set the color scheme (options in /usr/share/vim/vimfiles/colors)
"set signcolumn         " The column where signs are displayed (used by debuggers, for denoting build errors etc.)
"set isfname+="@-@")    " Fixes issues with the displaying of file names (???)
set termguicolors       " Enables colors in the terminal GUI (???)

" Data recovery
set noswapfile          " Use a swap file to buffer modified files (.swp)
set nobackup            " Use a backup file to keep the most recent version of a file (.bak)
set undofile            " Use a seperate file to track the undo history (.un)
set undodir=$HOME/.vim/undodir_vim   " The directory to put undo files in
set updatetime=50       " If no activity occurs for this many ms then the swap file is written to disk 
set viminfo='20,\"50    " Read/write a .viminfo file with no more than 50 lines of registers
set history=50		    " How many lines of command line history to keep

" Searching
set hlsearch            " Highlight searchs, toggle on/off with hls/nohl 
set incsearch           " Dynamically show what matches the search as you type it 


