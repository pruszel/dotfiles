" Enable useful vim features
set nocompatible

" Enable plugins
filetype plugin on

" set location of swap, backup, and undo files
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

" netrw config
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_browse_split = 3 "open files in new tab
let g:netrw_winsize = 25

" Key mappings

let mapleader ="<space>"

" Save
nnoremap <leader>s :w<CR>

" Quit
nnoremap <leader>q :q<CR>

" Yank from cursor to end of line
nnoremap Y y$

" Toggle folds (<Space>)
noremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>

" Exit insert mode using ii
" :imap ii <Esc>

" Read JSON as JavaScript
au BufRead,BufNewFile *.json set ft=json syntax=javascript

"Configure whitespace settings
set ts=4 sts=4 sw=4 expandtab smarttab
autocmd Filetype html setlocal ts=4 sts=4 sw=4 expandtab smarttab
autocmd Filetype css setlocal ts=4 sts=4 sw=4 expandtab smarttab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab smarttab
autocmd Filetype php setlocal ts=4 sts=4 sw=4 expandtab smarttab
autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab smarttab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab smarttab

" Syntax highlighting
set t_Co=256
set background=dark
syntax on

" Theme
colorscheme molokai

" Editor config
set relativenumber " Use relative line numbers. Current line is still in status bar.
au BufReadPost,BufNewFile * set relativenumber
set autoindent " Copy indent from last line when starting new line.
set backspace=indent,eol,start
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set esckeys " Allow cursor keys in insert mode.
set expandtab " Expand tabs to spaces
set foldcolumn=4 " Column to show folds
set foldenable
set foldlevel=2
" set foldlevelstart=2 " Sets `foldlevel` when editing a new buffer
set foldmethod=syntax " Markers are used to specify folds.
set foldminlines=0 " Allow folding single lines
set foldnestmax=3 " Set max fold nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle.
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches.
set incsearch " Highlight dynamically as pattern is typed.
set laststatus=2 " Always show status line
set lispwords+=defroutes " Compojure
set lispwords+=defpartial,defpage " Noir core
set lispwords+=defaction,deffilter,defview,defsection " Ciste core
set lispwords+=describe,it " Speclj TDD/BDD
set magic " Enable extended regexes.
set mouse=a " Enable mouse in all modes.
set noerrorbells " Disable error bells.
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command.
set nostartofline " Don't reset cursor to start of line when moving around.
set nowrap " Do not wrap lines.
set nu " Enable line numbers.
set ofu=syntaxcomplete#Complete " Set omni-completion method.
set report=0 " Show all changes.
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window.
set shiftwidth=2 " The # of spaces for indenting.
set shortmess=atI " Don't show the intro message when starting vim.
set showmode " Show the current mode.
set showtabline=2 " Always show tab bar.
set sidescrolloff=3 " Start scrolling three columns before vertical border of window.
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters.
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set softtabstop=2 " Tab key results in 2 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set title " Show the filename in the window titlebar.
set undofile " Persistent Undo.
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line.
set wildmode=list:longest " Complete only until point of ambiguity.
set winminheight=0 "Allow splits to be reduced to a single line.
set wrapscan " Searches wrap around end of file
