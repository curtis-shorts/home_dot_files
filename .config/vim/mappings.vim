" Custom command mappings
" Keymap takes the inputs of (<vim mode>map <alias> <resolved command>)

" Vim modes are n - normal, v/x - visual, i - insert, s - select, c - command line, t - terminal
let mapleader = ' '     " Set the leder charater for mapped commands

" Netrw navigation menu
nmap <leader>e :Ex<CR>      " Bring up menu fullscreen
nmap <leader>ev :Vex<CR>    " Bring up menu in a new left pane
nmap <leader>eh :Hex<CR>    " Bring up menu in a new bottom pane

" Navigate between split panes
nmap <leader>h <C-w>h<CR>   " Move down a pane
nmap <leader>k <C-w>k<CR>   " Move up a pane
nmap <leader>l <C-w>l<CR>   " Move right a pane
nmap <leader>q <C-w>q<CR>   " Close the current pane

" Copy/paste to/from the global keyboard
nmap <leader>y \+y          " \"+y yanks to the external clipboard (y doesn't)
vmap <leader>y \+y          " Support in visual and normal modes
nmap <leader>Y \+Y          " Y is equivelent to yy 
nmap <leader>p \+p          " \"+p pastes from the external clipboard (p is vim local)

" Visual block movement
vmap J :m '>+1<CR>gv=gv     " Moves the selected visual block down one line
vmap K :m '<-2<CR>gv=gv     " Moves the selected visual block up one line 

" Deletions
nmap <leader>d, \_d         " _d redirects to void buffer (d normally copies to clipboard)
vmap <leader>d, \_d         " Support in visual and normal modes
vmap <leader>p, "\"_dP"     " Deletes selected visual block and paste the clipboard

" Auto comment multiple lines
vmap <leader># :s/^/#/<CR> <Esc>:nohlsearch<CR>                 " Add a # style comment
vmap <leader>/ :s/^/\/\//<CR> <Esc>:nohlsearch<CR>              " Add a // style comment
vmap <leader>c :s/^\/\/\\|^[#"%!;]//<CR> <Esc>:nohlsearch <CR>  " Remove any comment style


