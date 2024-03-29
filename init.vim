"--------------------------
"|        Settings        |
"--------------------------

" Ignore case-sensivity on searches
set ignorecase
" Use case sensitive search if there is a capital letter in the search
set smartcase
" Don't highlight search results
set nohlsearch
" Use system clipboard by default in Windows
set clipboard=unnamed
" Use system clipboard by default in Linux
set clipboard=unnamedplus
" Make the yanked region apparent (200ms highlight)
au TextYankPost * silent! lua vim.highlight.on_yank{ timeout=200 }

if (!exists('g:vscode'))
    " Enable relative numbers
    set relativenumber
    set number

    " Default updatetime 4000ms is not good for async update
    set updatetime=100
endif


"--------------------------
"|        Mappings        |
"--------------------------

" Map leader to space key
" https://stackoverflow.com/a/446293/6622233
nnoremap <SPACE> <Nop>
let mapleader=" "
" Swap K with % in [v]isual mode
vnoremap K %
" Swap % with K in [v]isual mode
vnoremap % K
" Swap K with % in [n]ormal mode
nnoremap K %
" Swap % with K in [n]ormal mode
nnoremap % K
" Re-runs the macro recorded at q on every line in the selection
vnoremap <leader>q :'<,'>normal @q<CR>

if (!exists('g:vscode')) 
    " Telescope
    nnoremap <C-p> <cmd>Telescope find_files<cr>

    " Hunk jumping
    nmap <leader>gj <Plug>(GitGutterNextHunk)
    nmap <leader>gk <Plug>(GitGutterPrevHunk)

    " Opens VIMRC
    map <leader>ov :vsp $MYVIMRC<CR>
    " Sources VIMRC
    map <leader>sv :source $MYVIMRC<CR>

    " Save current file with Ctrl+s
    nnoremap <C-s> :w<CR>
endif

if (exists('g:vscode')) 
    " Hunk jumping
    nnoremap <leader>gj <Cmd>call VSCodeNotify('workbench.action.editor.nextChange')<CR>
    nnoremap <leader>gk <Cmd>call VSCodeNotify('workbench.action.editor.previousChange')<CR>
endif

" Attach `init.lua` inside `lua` folder
lua require("init")