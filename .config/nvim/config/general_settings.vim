set rtp+=$GOROOT/misc/vim
filetype plugin indent on

syntax enable

set path+=**					
set wildmenu					
set hlsearch
set incsearch                  
set hidden                     
set nobackup                   
set noswapfile                 
set t_Co=256                   
set relativenumber number
set laststatus=2
set noshowmode
set expandtab                   
set smarttab                    
set shiftwidth=2                
set tabstop=2                   
set termguicolors 
set nowrap
set background=dark
set cursorline

set linespace=10

highlight LineNr guifg=gray

let mapleader = "\<Space>"
let g:rehash256 = 1
let g:webdevicons_enable = 1

let g:transparent_enabled = v:false
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_quit_on_open = 1
let g:user_emmet_install_global = 0

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

autocmd FileType html,css,typescriptreact,javascriptreact, EmmetInstall

highlight Cursor guifg=black guibg=white

hi LineNr guibg=bg
set foldcolumn=2
hi foldcolumn guibg=bg

" enable mouse functionality
set mouse=nicr
set mouse=a

nnoremap <leader>ss :mksession! ~/.vim/Session.vim<CR>:wqa<CR>
nnoremap <leader>so :so ~/.vim/Session.vim<CR>

" formats file on save
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*ts,*tsx FormatWrite
augroup END

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=Fira\ Code\ NF:h18

" typescript indend
let g:typescript_indent_disable = 0
let g:typescript_compiler_binary = 'tsc'
let g:tsx_ext_required = 1

" java autocomplete
let java_highlight_functions = 1

set completeopt=menu,menuone,noselect
