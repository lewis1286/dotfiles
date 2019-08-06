" Notes:
" lifesaving vim python wrapping (save to .vim/indent/python.vim)
" from: https://www.vim.org/scripts/script.php?script_id=974
" curl https://www.vim.org/scripts/download_script.php?src_id=4316
"         > ~/.vim/indent/python.vim"

set encoding=utf-8
" load .vimrc on save
autocmd! bufwritepost .vimrc source %

" historical undo (across saves)
if has('persistent_undo')
    set undodir=$HOME/.vimundo
    set undolevels=1000
    set undoreload=10000
    set undofile
endif

"--------------- clipboard  -----------
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" ------------------ temp for omni completion -----------
" Enable autocompletion
set omnifunc=syntaxcomplete#Complete
" Select keyword as you type
set completeopt=longest,menuone
" ----------------- temp for omni completion -----------

" Startup Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" nicer copy paste
set pastetoggle=<F2>

set mouse=n " mouse mode in normal mode for clicking, not in visual for copying
"set mouse=a " OSX = ALT/OPTION + click

" write file when change focus THIS ISN'T WORKING
:au FocusLost * :wa

set backspace=indent,eol,start

" ----------------------------------------------------------------------
" ------------------       remapped keys          ----------------------
" ----------------------------------------------------------------------
" Rebind <Leader> key
let mapleader = ","

nmap <leader>d :GitGutterToggle <return> :set relativenumber! <return> :set number! <return>
map <Leader>l :nohl <CR>

nmap <leader>v :vsplit ~/.vimrc<CR>

" move text to new line and get back to normal mode
nmap <Leader>w ha<return><Esc>
" jj escapes input mode
inoremap jj <Esc>l

map <Leader>b Oimport pdb; pdb.set_trace() # BREAKPOINT<C-c>
" Bind nohl
" removes highlighting of last text search

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" set scrolling no less than three lines from screen border
set scrolloff=3

" open splits on right
set splitright

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
" ERROR: this reverts all work when on a mac!!
"command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

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

" -------------------------       colors          ----------------
"set t_Co=256

Plugin 'flazz/vim-colorschemes' " big list of colorschemes

" Had to manually download into .vim/colors and .vim/autoload
" do:
" cd ~/.vim/colors && wget https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim 
" cd ~/.vim/autoload && wget https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/onedark.vim

Plugin 'joshdick/onedark.vim'

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

"set termguicolors
syntax on
set background=dark
"colorscheme onedark
colorscheme gruvbox
set colorcolumn=80

" Dope ass snippets
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/ultisnips/Ultisnips/"


" ---------------------------------------------------------
" Vim8/neovim linting and ?some code completion
" ---------------------------------------------------------
Plugin 'w0rp/ale'
let g:ale_sign_column_always = 1
" Integrate w/ Airline
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_highlights = 1

" Linting:
" Select flake8 and pylint, and ignore pylint, so only flake8 is run.
let g:ale_linters = {'python': ['flake8', 'pylint', 'isort']}
"let g:ale_linters_ignore = {'python': ['pylint']}

"" Completion engine:
" This setting must be set before ALE is loaded.
"let g:ale_completion_enabled = 1

"" Fixing:
let g:ale_fixers = {
\   'python': [
\       'isort',
\       'remove_trailing_lines',
\       'trim_whitespace',
\   ],
\}

"" ---------- Language Server Protocol ----------------
"Plugin 'prabirshrestha/async.vim'
"Plugin 'prabirshrestha/vim-lsp'

"if executable('pyls')
    "" pip install python-language-server
    "au User lsp_setup call lsp#register_server({
        "\ 'name': 'pyls',
        "\ 'cmd': {server_info->['pyls']},
        "\ 'whitelist': ['python'],
        "\ })
"endif
" ---------------------------------------------------



" choose window overlay
Plugin 't9md/vim-choosewin'
nmap - <Plug>(choosewin)

"Python folding
set nofoldenable
Plugin 'tmhedberg/simpylfold'

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


"Plugin 'sql.vim--Stinson'

 "python syntax .. maybe it will highlight sql queries:
Plugin 'hdima/python-syntax'
let python_highlight_all = 1


" automatically update ctags (needs exuberant ctags on box running vim)
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'

" set dynamic tags file to current project
:set tags=./tags;
:let g:easytags_dynamic_files = 1

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
:set conceallevel=2

" Arduino
Plugin 'stevearc/vim-arduino'
nnoremap <buffer> <leader>av :ArduinoVerify<CR>
nnoremap <buffer> <leader>au :ArduinoUpload<CR>
nnoremap <buffer> <leader>as :ArduinoUploadAndSerial<CR>

" <C-[hjkl]> across vim panes and tmux panes
Plugin 'christoomey/vim-tmux-navigator'

" Zen mode
Plugin 'junegunn/goyo.vim'


" --------------- completion engine for nvim --------------------------
Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-jedi'

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

"let g:deoplete#disable_auto_complete = 1
"let g:deoplete#auto_complete = 0
set completeopt+=noinsert
let g:deoplete#auto_complete_delay = 450
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" deoplete tab-complete (vanilla is <C-n>, <C-p>)
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Formatting (also do `pip install yapf`)
Plugin 'sbdchd/neoformat'

" ----------------------------------------------------------------------
" -------------------------- playground:  ------------------------------
" ----------------------------------------------------------------------
Plugin 'mhinz/vim-startify'
Plugin 'majutsushi/tagbar'
" ----------------------------------------------------------------------

"-------------------------- end plugins ----------------------
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set foldmethod=syntax

