set rtp+=$GOROOT/misc/vim
filetype plugin indent on

syntax enable

set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set hlsearch
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set t_Co=256                    " Set if term supports 256 colors.
set number
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
set laststatus=2
set noshowmode
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=2                " One tab == four spaces.
set tabstop=2                   " One tab == four spaces.
set termguicolors 
set nowrap
set background=dark
set cursorline

let mapleader = " "
let g:rehash256 = 1
let g:webdevicons_enable = 1
let g:gitgutter_enabled = 0 

let g:transparent_enabled = v:false
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_quit_on_open = 1
let g:user_emmet_install_global = 0

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

autocmd FileType html,css,typescriptreact,javascriptreact, EmmetInstall

" indent guides configuration
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 1
let g:indentLine_char_list = ['.']

" enable mouse functionality
set mouse=nicr
set mouse=a

colorscheme rose-pine

" formats file on save
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*ts,*tsx FormatWrite
augroup END

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=Fira\ Code\ NF:h18

" typescript indend
let g:typescript_indent_disable = 1
let g:typescript_compiler_binary = 'tsc'
let g:tsx_ext_required = 1

" java autocomplete
let java_highlight_functions = 1

set completeopt=menu,menuone,noselect