set encoding=utf-8
" load .vimrc on save
autocmd! bufwritepost .vimrc source %

" Startup Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" nicer copy paste
set pastetoggle=<F2>

set mouse=n " mouse mode in normal mode for clicking, not in visual for copying
" write file when change focus
:au FocusLost * :wa

"set mouse=a " OSX = ALT/OPTION + click
set backspace=indent,eol,start


" Rebind <Leader> key
let mapleader = ","

nmap <leader>d :GitGutterToggle <return> :set relativenumber! <return> :set number! <return>

" move text to new line and get back to normal mode
nmap <Leader>w a<return><Esc>
" jj escapes input mode
inoremap jj <Esc>l
inoremap jk <Esc>l

" Bind nohl
" removes highlighting of last text search
map <Leader>l :nohl <CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" set scrolling no less than three lines from screen border
set scrolloff=3

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" Jump to previous file
noremap <Leader>3 <C-^>

" remove whitespace
nnoremap <leader>s :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv
vnoremap > >gv

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set wrap  " don't automatically wrap on load
"set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" other useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" save file as root even when not root
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" ============================================================================
" Plugins
" ============================================================================

" Auto closing for [{( etc.
Plugin 'Townk/vim-autoclose'

" multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" number toggling (relative vs absolute)
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

" Git awesomeness
"Plugin 'tpope/vim-fugitive'

" Git in gutter
Plugin 'airblade/vim-gitgutter'

" ----------------------------------------------------------
"                       Airline
" ----------------------------------------------------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='biogoo'
let g:airline_theme='light'

" ----------------------------------------------------------

" ctrlp badass file searcing
" http://ctrlpvim.github.io/ctrlp.vim/
Plugin 'kien/ctrlp.vim'
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'a'

" colors
set t_Co=256
syntax enable
set background=dark " light or dark
"map <Leader>l :set background=light <CR>
"map <Leader>t :set background=dark <CR>

Plugin 'flazz/vim-colorschemes'
colors gruvbox


map <Leader>b oimport pdb; pdb.set_trace() # BREAKPOINT<C-c>

" Dope ass snippets
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/ultisnips/UltiSnips"

" choose window overlay
Plugin 't9md/vim-choosewin'
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable=1
let g:choosewin_color_label = {
      \ 'gui': ['ForestGreen', 'white', 'bold'],
      \ 'cterm': [9, 16]
      \ }
let g:choosewin_color_overlay= {
      \ 'gui': ['ForestGreen', 'black'],
      \ 'cterm': [240, 0]
      \ }
"Python folding
set nofoldenable

" NERDTree
map <Leader>q :NERDTreeToggle<CR>
Plugin 'scrooloose/nerdtree'
" hide __pycache__ files
let NERDTreeChDirMode=2 " change CWD to root when root is changed"
" Nerdcommenter
Plugin 'scrooloose/nerdcommenter'

" easymotions
Plugin 'easymotion/vim-easymotion'
" one leader key activates
map <Leader> <Plug>(easymotion-prefix)


Plugin 'sql.vim--Stinson'

" python syntax .. maybe it will highlight sql queries:
Plugin 'hdima/python-syntax'
let python_highlight_all = 1


" automatically update ctags (needs exuberant ctags on box running vim)
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'

" set dynamic tags file to current project
:set tags=./tags;
:let g:easytags_dynamic_files = 1

" python mode (big ass plugin!!)
"Plugin 'klen/python-mode'
"let g:pymode_python = 'python3'
"let g:pymode_trim_whitespaces = 1 " trim unused whitespace
"let g:pymode_options_max_line_length = 79
"let g:pymode_doc = 1
"let g:pymode_doc_bind = 'K'
"let g:pymode_lint = 0
"let g:pymode_lint_ignore = ["E501", "E0100"]
"let g:pymode_rope = 0
"let g:pymode_rope_completion = 0
"let g:pymode_rope_complete_on_dot = 0
"let g:pymode_rope_completion_bind = '<C-Space>'
"let g:pymode_rope_autoimport = 0
"let g:pymode_rope_autoimport_modules = ['os', 'pandas', 'datetime', 'numpy']
"let g:pymode_rope_autoimport_import_after_complete = 0


" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
:set conceallevel=2


"-------------------------- playground:  ----------------------

" Arduino
Plugin 'stevearc/vim-arduino'
nnoremap <buffer> <leader>av :ArduinoVerify<CR>
nnoremap <buffer> <leader>au :ArduinoUpload<CR>
nnoremap <buffer> <leader>as :ArduinoUploadAndSerial<CR>

Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"-------------------------- end plugins ----------------------
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set foldmethod=syntax

