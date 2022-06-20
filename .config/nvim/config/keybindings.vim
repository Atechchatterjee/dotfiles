" general-remaps
nmap <A-S-P> :Prettier <CR>
nnoremap <A-N> :NvimTreeToggle<CR>

"toggle between terminal and editor
tnoremap <c-h> <C-\><C-n><C-w>h

"toggle spelling mistakes
noremap <F5> :setlocal spell! <CR>

nmap ( {
nmap ) }

nmap <C-_> :CommentToggle <CR>
vmap <C-_> :'<,'>CommentToggle<CR>
 
"for gui-client
nmap <C-/>   <Plug>NERDCommenterToggle
vmap <C-/>   <Plug>NERDCommenterToggle<CR>gv

" BufferLine mappings
map <C-t> :BufferLinePick <CR>
noremap <C-tab> :echo "c-tab working!!" <CR>
map <C-q> :bd <CR>

nmap <C-s> :Prettier :w <CR>

inoremap jj <Esc>
nnoremap <C-h> :wincmd h <CR>
nnoremap <C-l> :wincmd l <CR>
nnoremap <C-j> :wincmd j <CR>
nnoremap <C-k> :wincmd k <CR>
noremap <A-r> :FloatermNew --name=ranger ranger<CR>
noremap <A-v> :FloatermNew --name="vifm" vifm<CR>
noremap <A-t> :FloatermNew --width=0.4 --wintype=normal --position=right <CR>
noremap <A-d> :FloatermNew --height=0.4 --wintype=normal --position=bottom <CR>

let g:floaterm_keymap_new = '<Leader>f'
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next = '<F3>'
let g:floaterm_keymap_prev = '<F2>'

"CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> +x

"CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> +y

"switch tabs
noremap <Leader>1 1gt
noremap <Leader>2 2gt
noremap <Leader>3 3gt
noremap <Leader>4 4gt
noremap <Leader>5 5gt
noremap <Leader>6 6gt
noremap <Leader>7 7gt
noremap <Leader>8 8gt
noremap <Leader>9 9gt
noremap <Leader>0 :tablast<cr>
noremap <Leader>p :Autoformat<CR>
noremap <tab> :BufferLineCycleNext<CR>
noremap <S-tab> :BufferLineCyclePrev<CR>

noremap <C-+> <C-_> <C-n>

"resizing windows
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>, :exe "vertical resize -10" <CR>
nnoremap <silent> <Leader>. :exe "vertical resize +10" <CR>

" Keybindings for LSP related actions
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent> <C-S-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <C-w> <cmd> lua vim.lsp.diagnostic.show_line_diagnostics() <CR>
noremap <Leader>rn :Lspsaga rename<CR>

nnoremap gr <cmd>TroubleToggle lsp_references<cr>

"map <A-N> :NERDTreeToggle<CR>
map <Leader>tt :vnew term://zsh<CR>
" compile and run a c file
map <Leader>x :terminal gcc % -o %< && ./%<<CR>

"set splitbelow splitright
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>ff <cmd>Telescope find_files<CR>
nnoremap <Leader>fg <cmd>Telescope live_grep<cr>
nnoremap <Leader>fb <cmd>Telescope buffers<cr>
nnoremap <Leader>fh <cmd>Telescope help_tags<cr>
nnoremap <Leader>fc <cmd>Telescope colorscheme theme=dropdown<cr>

" Making adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +2<CR>
noremap <silent> <C-Right> :vertical resize -2<CR>
noremap <silent> <C-Up> :resize +2<CR>
noremap <silent> <C-Down> :resize -2<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

