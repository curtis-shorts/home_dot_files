"~/.vimrc file for vim settings
set nocompatible                        "needs to be first as it effects other settings behaviours
"
"general behaviour
set noerrorbells visualbell t_vb =	    "get rid of error blinks and beeps
autocmd GUIEnter * set visualbell t_vb=	"get rid of error blinks and beeps
colorscheme koehler	        		    "check /usr/share/vim/vimfiles/colors
set lbr             					"wrap at end of line, don't cut off in the middle of a word
set smartindent				            "autoindent
set bs=2					            "aow backspace holds in inse mode
set showmatch       					"always on
set expandtab		            		"turns tabs into spaces
set tabstop=4					        "number of apasces for tabs in expandtab
set nobackup				                "keep backups of files (deafault is <filename>~)
set viminfo='20,\"50        			"read/write a .viminfo file with no more than 50 lines of registers
set history=50				            "how many lines of command line history to keep
set ruler				                "show the cursor position at a times (creates it as a block?)
set number                              "adds line numbers
set shiftwidth=0                        "sets the smaindent witdth in spaces, 0 makes it the same as tabstop
syntax on                               "
set hlsearch                            "
"
"switch syntax highlighting on when the teinal has colors -- switches highlighting on for the last used search paern
if &t_Co > 2 || has("gui_running")      "
    syntax on                           "
    set hlsearch                        "
endif                                   "
"
if has("autocmd")                       "
    autocmd BufNewFile,BufRead Makefile set noexpandtab "Makefiles ensure that we don't expand tabs since tabs are special          "
endif                                   "
"
"
"highlighting to add comments, simply highlight the lines of interest then click <token, ex ',#'> to comment with the token         "
"hashtag comments
map ,# :s/^/#/<CR> <Esc>:nohlsearch<CR>                         "double backslash comments
map ,/ :s/^/\/\//<CR> <Esc>:nohlsearch<CR>                      "clear out comments, // or # or " or % or ! or ;
map ,c :s/^\/\/\\|^[#"%!;]//<CR> <Esc>:nohlsearch <CR>          "
map ,h :nohlsearch <CR>                                         "clear highlighted search -- hit ,h to clear from the last search
