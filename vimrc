

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
"set clipboard=unnamed
"vnoremap <C-c> "*y


"set mouse=a " OSX = ALT/OPTION + click
"set backspace=indent,eol,start
" write file when change focus
:au FocusLost * :wa

" same as above but ignore errors for no name files, read only files
":au FocusLost * silent! wa



"set mouse=a " OSX = ALT/OPTION + click
set backspace=indent,eol,start

" Rebind <Leader> key
let mapleader = ","

nmap <leader>d :GitGutterToggle <return> :set relativenumber! <return> :set number! <return>
  "Copy to clipboard
"set clipboard+=unnamedplus
"vnoremap  <leader>y  +y
"nnoremap  <leader>Y  +yg_
"nnoremap  <leader>y  +y
"nnoremap  <leader>yy  +yy

  "Paste from clipboard
"nnoremap <leader>p +p
"nnoremap <leader>P +P
"vnoremap <leader>p +p
"vnoremap <leader>P +P

" jj escapes input mode
inoremap jj <Esc>l

" Bind nohl
" removes highlighting of last text search
noremap <C-a> :nohl<CR>
vnoremap <C-a> :nohl<CR>
inoremap <C-a> :nohl<CR>

 "Quicksave command
"noremap <C-Z> :update<CR>
"vnoremap <C-Z> <C-C>:update<CR>
"inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
"noremap <Leader>e :quit<CR>  " Quit current window
"noremap <Leader>E :qa!<CR>   " Quit all windows


"noremap <Leader>a o<Esc>

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

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Showing line numbers and length
"set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
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
" multiple cursors
Plugin 'terryma/vim-multiple-cursors'


" number toggling (relative vs absolute)
Plugin 'jeffkreeftmeijer/vim-numbertoggle'


" Git awesomeness
Plugin 'tpope/vim-fugitive'


" Git in gutter
Plugin 'airblade/vim-gitgutter'


" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='zenburn'
let g:airline_solarized_bg='dark'
" collect powerline fonts
" see vim-airline documentation, and https://github.com/powerline/fonts
"let g:airline_powerline_fonts = 1


" ctrlp badass file searcing
" http://ctrlpvim.github.io/ctrlp.vim/
Plugin 'kien/ctrlp.vim'
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'a'

" better ctrlp for python
"Plugin 'FelikZ/ctrlp-py-matcher'
"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }



" colors
set t_Co=256
syntax enable
set background=dark " light or dark
map <Leader>l :set background=light <CR>
map <Leader>t :set background=dark <CR>

"colors solarized
"colors vrunchbang-dark
Plugin 'flazz/vim-colorschemes'
"colors zenburn
"colorscheme onedark
colors gruvbox

" jedi-vim
"Plugin 'davidhalter/jedi-vim'
"let g:jedi#usages_command= "<Leader>z"
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
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


" easy debugger
"map <Leader>b oimport pdb; pdb.set_trace() # BREAKPOINT<C-c>

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
"set nofoldenable

" NERDTree
map <Leader>q :NERDTreeToggle<CR>
Plugin 'scrooloose/nerdtree'
" hide __pycache__ files
"let NERDTreeIgnore=['\__pycache__$[[dir]]']
let NERDTreeChDirMode=2 " change CWD to root when root is changed"
" Nerdcommenter
Plugin 'scrooloose/nerdcommenter'

" easymotions
Plugin 'easymotion/vim-easymotion'
" one leader key activates
map <Leader> <Plug>(easymotion-prefix)


" markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'JamshedVesuna/vim-markdown-preview'
let g:markdown_fenced_languages=['ruby', 'python', 'bash=sh']
let g:markdown_syntax_conceal=1


" TypeScript highlighting
Plugin 'leafgarland/typescript-vim'


"---------------- debugging plugins -------------------------


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
Plugin 'klen/python-mode'
let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1 " trim unused whitespace
let g:pymode_options_max_line_length = 79
let g:pymode_folding = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_lint_ignore = ["E501"]
"let g:pymode_rope = 1

" ----------- enable sql syntax highlighting in python files ----------
"function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
  "let ft=toupper(a:filetype)
  "let group='textGroup'.ft
  "if exists('b:current_syntax')
    "let s:current_syntax=b:current_syntax
    "" Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    "" do nothing if b:current_syntax is defined.
    "unlet b:current_syntax
  "endif
  "execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  "try
    "execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  "catch
  "endtry
  "if exists('s:current_syntax')
    "let b:current_syntax=s:current_syntax
  "else
    "unlet b:current_syntax
  "endif
  "execute 'syntax region textSnip'.ft.'
  "\ matchgroup='.a:textSnipHl.'
  "\ start="'.a:start.'" end="'.a:end.'"
  "\ contains=@'.group
"endfunction
"au FileType python call TextEnableCodeSnip('sql', "'''", "'''", 'SpecialComment')
" -------------------------------------------------------------------



" make color hex codes etc color highlighted
"Plugin 'chrisbra/colorizer'


"Plugin 'tpope/vim-surround'


"Plugin 'townk/vim-autoclose'

" tagging (using ctags for tag, see: https://andrew.stwrt.ca/posts/vim-ctags/
Plugin 'majutsushi/tagbar'
noremap <Leader>e :TagbarToggle<CR>


" Linting
"Plugin 'w0rp/ale'


" jedi-vim
"Plugin 'davidhalter/jedi-vim'
"let g:jedi#usages_command= "<Leader>z"
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
" makes tab-completion for jedi-vim
"Plugin 'ervandew/supertab'
"-------------------------- end plugins ----------------------
" Disable plugins on start (TODO: add diable line numbering)
":au VimEnter * :GitGutterDisable
call vundle#end()            " required
filetype plugin indent on    " required




