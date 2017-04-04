" ----------------- JACA's vim web dev config ---------
"
"------------------ Usability -------------------------
set nocompatible        " not vi compatible, enable plugins
syntax on		" turn on syntax hl
set number		" show line numbers
"
" detect filetypes and load specific plugins
"
filetype on
filetype plugin on
filetype indent on
"------
set autoread		" reload changes outside of vim	
"------
set encoding=utf-8	" utf-8 encoding
set fileencoding=utf-8
"------
runtime macros/matchit.vim	" enable matchit
"------
set backspace=indent,eol,start 	" delete over eol,lb...
"------
set hidden		"put buffers in bg instead of closing
"------
set fileformat=unix	"set unix line endings, and try unix/dos le
set fileformats=unix,dos
"------
"------------------ Customization -------------------------
"
"search options, esc to remove searhl, hl search and incl search
set hlsearch
set incsearch
nnoremap <esc> :noh<return><esc>	
"
set wildmode=list:longest	"suggestions for normal mode
"
set scrolloff=3			"3 lines for visible cursor
"
"indentention rules
set expandtab		"spaces instead of tabs
set autoindent  	"ind based on above line
set smartindent 	"smart indent for c-like langs
set shiftwidth=4 	"tabs are 4 spaces for reading
set softtabstop=4	"tabs are 4 spaces in insert mode
" ----------------- Plugins ---------------------"
" set the runtime path to include Vundle and initialize
set rtp+=/home/jaca/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'wincent/command-t'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'shawncplus/phpcomplete.vim'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'stanangeloff/php.vim'
Plugin 'joonty/vdebug'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'      
Plugin 'Lokaltog/vim-easymotion'    
Plugin 'fholgado/minibufexpl.vim'
Plugin 'tpope/vim-surround'         
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
" " -- Web Development
Plugin 'Shutnik/jshint2.vim'        
Plugin 'mattn/emmet-vim'            
Plugin 'skammer/vim-css-color'      
Plugin 'hail2u/vim-css3-syntax'     
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'crusoexia/vim-monokai'
"
" " end plugin definition
" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" start NERDTree on start-up and focus active window
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
"
"
" " set the color theme to wombat256
colorscheme monokai
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
" " make a mark for column 80
set colorcolumn=90
" " and set the mark color to DarkSlateGray
highlight ColorColumn ctermbg=lightgray guibg=lightgray
if !has('gui_running')
      set t_Co=256
  endif
" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
syntax on
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']
