call plug#begin('~/.vim/plugged')

"General Plugins
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree' |
			\ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'https://github.com/xavierd/clang_complete.git'
Plug 'justmao945/vim-clang'
Plug 'honza/vim-snippets'
Plug 'https://github.com/vifm/vifm.vim.git'
Plug 'voldikss/vim-floaterm'
Plug 'https://github.com/skammer/vim-css-color.git'
Plug 'https://github.com/Shougo/vimfiler.vim.git'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/ap/vim-css-color.git'

"Themes Plugins
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'https://github.com/sickill/vim-monokai.git'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
Plug 'danilo-augusto/vim-afterglow'
Plug 'sainnhe/gruvbox-material'
Plug 'mhartington/oceanic-next'

" Syntax highlighting plugins
Plug 'HerringtonDarkholme/yats.vim' "TS
Plug 'https://github.com/vim-python/python-syntax.git'
"Plug 'uiiaoo/java-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

call plug#end()

" General settings
syntax on
set ai
set ruler
set number
set nowrap
set hlsearch
set noshowmode
set noswapfile
set smartindent
set scrolloff=7
set sidescroll=1
set shiftwidth=4
set encoding=UTF-8
set ttimeoutlen=0
set tabstop=4 softtabstop=4
set backspace=indent,eol,start

highlight Comment ctermfg=green

let mapleader = " "
let g:yats_host_keyword = 1

"keeps the cursor shape block in insert mode
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0

set guicursor+=i:blinkwait10

" fixes the alacrity issue with mouse
if !has('nvim')
	set ttymouse=sgr
endif

set mouse=a

" fzf settings
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0)

" -- Themes settings & Syntax highlighting --
"set termguicolors
"set background=dark
set laststatus=2
"let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_termcolors=16
"colorscheme OceanicNext 
"let g:cssColorVimDoNotMessMyUpdatetime = 1 "color highlight
"let g:python_highlight_all = 1

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx " set filetypes as typescript.tsx

" Prettier on save
"let g:prettier#quickfix_enabled = 0
"autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

"typescript indend
let g:typescript_indent_disable = 1
let g:typescript_compiler_binary = 'tsc'
let g:tsx_ext_required = 1

" Enable true color(fixes colors for tmux)
"if exists('+termguicolors')
	"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	"set termguicolors
"endif

"execute "set t_8f=\e[38;2;%lu;%lu;%lum"
"execute "set t_8b=\e[48;2;%lu;%lu;%lum"

" java autocomplete
let java_highlight_functions = 1

" -- all remaps --
nmap <C-t> gt
nmap <C-b> :NERDTreeToggle<CR>
nmap <A-S-P> :Prettier <CR>

" toggle spelling mistakes
nmap <F5> :setlocal spell! <CR>

"fzf remaps
nmap <C-p> :Files <CR>
nmap <A-g> :GFiles <CR>
nmap <A-r> :Rg <CR>

nmap ( {
nmap ) }

" nerdcommenter: <C-/>
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv
nmap <C-s> :Prettier :w <CR>

inoremap jj <Esc>
nnoremap <leader>h :wincmd h <CR>
nnoremap <leader>l :wincmd l <CR>
nnoremap <leader>j :wincmd j <CR>
nnoremap <leader>k :wincmd k <CR>
"noremap <A-r> :FloatermNew --name=ranger ranger<CR>
noremap <A-v> :FloatermNew --name="vifm" vifm<CR>
noremap <A-t> :FloatermNew --width=0.4 --wintype=normal --position=right <CR>
noremap <A-d> :FloatermNew --height=0.4 --wintype=normal --position=bottom <CR>
let g:floaterm_keymap_new = '<Leader>f'
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next = '<F3>'
let g:floaterm_keymap_prev = '<F2>'

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y

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
noremap <tab> gt

noremap <C-+> <C-_> <C-n>

" resizing windows
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>, :exe "vertical resize -10" <CR>
nnoremap <silent> <Leader>. :exe "vertical resize +10" <CR>

let NERDTreeMapOpenInTab='\r'

"syntastic settings
"execute pathogen#infect()
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
let g:syntastic_java_javac_classpath = '/usr/lib/jvm/java-6-openjdk/'

" changes cursor when in insert and normal mode
 autocmd InsertEnter, InsertLeave * set cul!

"buid and run cpp code
set autowrite

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

syntax match myTodo /\v<(TODO|FIXME|NOTE).*/ containedin=.*Comment

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

if !has('gui_running')
	set t_Co=256
endif

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
			\ 'coc-java',
			\ 'coc-emmet',
			\ 'coc-python',
			"\ 'coc-prettier',
			\ 'coc-tsserver'
			\]

"command! -nargs=0 Prettier :CocCommand prettier.formatFile

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

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste'  ],
			\             [ 'gitbranch', 'readonly', 'filename', 'modified' ], [ 'statuslinetabs' ] ]
			\
			\},
			\ 'component_function': {
			\   'gitbranch': 'FugitiveHead',
			\   'statuslinetabs': 'LightlineStatuslineTabs',
			\   'cocstatus': 'coc#status'
			\},
			\}

function! LightlineStatuslineTabs() abort
	return join(map(range(1, tabpagenr('$')),
				\ '(v:val == tabpagenr() ? "[*] " : "") . lightline#tab#filename(v:val)'), " \u2b81 ")
endfunction

" resolves the clash b/w clangd and auto-pairs
let g:AutoPairsMapCR = 0

" ====== COC-default settings ========

" TextEdit might fail if hidden is not set.
set hidden

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"" Use `[g` and `]g` to navigate diagnostics
"" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

"" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"augroup mygroup
"autocmd!
"" Setup formatexpr specified filetype(s).
"autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"" Update signature help on jump placeholder.
"autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
