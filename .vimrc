call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/tc50cal/vim-terminal.git'
Plug 'https://github.com/sonph/onehalf.git'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/leafgarland/typescript-vim.git'
Plug 'https://github.com/xavierd/clang_complete.git'
Plug 'chiel92/vim-autoformat'
Plug 'honza/vim-snippets'
Plug 'https://github.com/vifm/vifm.vim.git'
Plug 'justmao945/vim-clang'
Plug 'https://github.com/xavierd/clang_complete.git'
Plug 'voldikss/vim-floaterm'
Plug 'https://github.com/skammer/vim-css-color.git'

"Themes-Plugins
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'chriskempson/base16-vim'
Plug 'jacoborus/tender.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'https://github.com/jnurmine/Zenburn.git'
Plug 'https://github.com/arzg/vim-colors-xcode.git'
Plug 'tomasiser/vim-code-dark'
Plug 'https://github.com/dunstontc/vim-vscode-theme.git'
Plug 'https://github.com/sickill/vim-monokai.git'
Plug 'https://github.com/blueshirts/darcula.git'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
Plug 'https://github.com/leafgarland/typescript-vim.git'
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'https://github.com/arcticicestudio/nord-vim.git'
Plug 'dikiaap/minimalist'
Plug 'christophermca/meta5'
Plug 'zacanger/angr.vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'NLKNguyen/papercolor-theme'
Plug 'whatyouhide/vim-gotham'
"Plug 'jdkanani/vim-material-theme'
Plug 'hzchirs/vim-material'

call plug#end()

syntax on
syntime on

"Themes-settings
let base16colorspace=256
set termguicolors
syntax enable
let g:gruvbox_contrast_dark = 'hard'
colorscheme vim-material
let g:material_style='palenight'
let g:gruvbox_termcolors=16
set background=dark
set laststatus=2

set number relativenumber
set sidescroll=1
set nowrap
set noswapfile
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set noshowmode

let mapleader = " "

" color highlight
 let g:cssColorVimDoNotMessMyUpdatetime = 1

" fixes the alacrity issue with mouse
if !has('nvim')
	set ttymouse=sgr
endif
set mouse=n

nmap <C-t> gt

set encoding=UTF-8

let NERDTreeMapOpenInTab='\r'

"syntastic settings
execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = "-std=c++17 -Wall -Wextra -Wpedantic"
let g:syntastic_quiet_messages={'level':'warnings'}

" changes cursor when in insert and normal mode
autocmd InsertEnter,InsertLeave * set cul!

"buid and run cpp code
set autowrite

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

" Enable true color(fixes colors for tmux)
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"

inoremap jj <Esc>
nnoremap <leader>h :wincmd h <CR>
nnoremap <leader>l :wincmd l <CR>
nnoremap <leader>j :wincmd j <CR>
nnoremap <leader>k :wincmd k <CR>
noremap <A-r> :FloatermNew --name=ranger ranger<CR>
noremap <A-v> :FloatermNew --name="vifm" vifm<CR>
noremap <A-t> :FloatermNew --width=0.4 --wintype=normal --position=right <CR>
noremap <A-d> :FloatermNew --height=0.4 --wintype=normal --position=bottom <CR>
noremap <C-c> :FloatermNew g++ -std=c++17 @% -o $argv && ./@% <CR>
let g:floaterm_keymap_new = '<Leader>f'
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next = '<F3>'
let g:floaterm_keymap_prev = '<F2>'


syntax match myTodo /\v<(TODO|FIXME|NOTE).*/ containedin=.*Comment

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
	au!
	autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" switch tabs
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
noremap <leader>p :Autoformat<CR>

" resizing windows
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>, :exe "vertical resize -10" <CR>
nnoremap <silent> <Leader>. :exe "vertical resize +10" <CR>

"Cpp syntax highlighting
"let g:cpp_class_scope_highlight = 1
"let g:cpp_member_variable_highlight = 1
"let g:cpp_class_decl_highlight = 1
"let g:cpp_posix_standard = 1
"let g:cpp_experimental_simple_template_highlight = 1
"let g:cpp_experimental_template_highlight = 1
"let g:cpp_no_function_highlight = 1
"let c_no_curly_error=1

if !has('gui_running')
	set t_Co=256
endif

" Ctrl P config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

"path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-3.8/lib'
"or path directly to the library file
let g:clang_library_path='/usr/lib/llvm-9/lib'

" coc config
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = [
			\ 'coc-snippets',
			\ 'coc-eslint',
			\ 'coc-json',
			\ 'coc-clangd',
			\ 'coc-prettier',
			\ 'coc-java',
			\ 'coc-emmet',
			\ 'coc-tabnine',
			\ 'coc-python',
			\ 'coc-tsserver'
			\]

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<Tab>" :
			\ coc#refresh()

" closes the preview window uptop
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

nmap <C-n> :NERDTreeToggle<CR>

let g:lightline = {
			\ 'colorscheme': 'material',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste'  ],
			\             [ 'gitbranch', 'readonly', 'filename', 'modified'  ] ]
			\
			\},
			\ 'component_function': {
			\   'gitbranch': 'FugitiveHead'
			\
			\},
			\
			\}

" resolves the clash b/w clangd and auto-pairs
let g:AutoPairsMapCR = 0
imap <silent><CR> <CR><Plug>AutoPairsReturn

"typescript indend
let g:typescript_indent_disable = 1
let g:typescript_compiler_binary = 'tsc'
