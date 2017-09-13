
"from https://www.youtube.com/watch?v=YhqsjUUHj6g
set encoding=utf-8
" load .vimrc on save
autocmd! bufwritepost .vimrc source %

" set default directory
cd /Users/lewisguignard/Documents/CODE/corax_engine
" Startup Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" nicer copy paste
set pastetoggle=<F2>
set clipboard=unnamed
vnoremap <C-c> "+y

set mouse=a " OSX = ALT/OPTION + click
set backspace=indent,eol,start

" Rebind <Leader> key
let mapleader = ","

" jj escapes input mode
inoremap jj <Esc>l

" Bind nohl
" removes highlighting of last text search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

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
set number  " show line numbers
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

" ============================================================================
" Plugins
" ============================================================================

" number toggling (relative vs absolute)
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

" Git awesomeness
Plugin 'tpope/vim-fugitive'

" Git in gutter
Plugin 'airblade/vim-gitgutter'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_solarized_bg='dark'
" collect powerline fonts
" see vim-airline documentation, and https://github.com/powerline/fonts
"let g:airline_powerline_fonts = 1



" ctrlp
" http://ctrlpvim.github.io/ctrlp.vim/
Plugin 'kien/ctrlp.vim'
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'rw'

" colors
set t_Co=256
syntax enable
set background=dark " light or dark
map <Leader>l :set background=light

"colors zenburn
colors solarized


" jedi-vim
Plugin 'davidhalter/jedi-vim'
let g:jedi#usages_command= "<Leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport pdb; pdb.set_trace() # BREAKPOINT<C-c>


" Better navigating through omnicomplete option list
" " See
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

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
" Python folding
set nofoldenable

" NERDTree
" auto open or close NERDTree
Plugin 'scrooloose/nerdtree'

" Nerdcommenter
Plugin 'scrooloose/nerdcommenter'

" easymotions
Plugin 'easymotion/vim-easymotion'

Plugin 'townk/vim-autoclose'

call vundle#end()            " required
filetype plugin indent on    " required
" -------------------------- end plugins ----------------------
