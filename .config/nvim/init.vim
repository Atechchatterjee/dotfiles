call plug#begin('~/.vim/plugged')

" General Plugins
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree' |
			\ Plug 'Xuyuanp/nerdtree-git-plugin'
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
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'vimwiki/vimwiki'
Plug 'https://github.com/ap/vim-css-color.git'
Plug 'https://github.com/tpope/vim-surround.git'

" Lsp Related Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'glepnir/lspsaga.nvim'
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Themes Plugins
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'https://github.com/sainnhe/sonokai.git'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'https://github.com/nanotech/jellybeans.vim.git'
Plug 'wojciechkepka/vim-github-dark'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'NLKNguyen/papercolor-theme'

" Syntax highlighting plugins
"Plug 'HerringtonDarkholme/yats.vim' "TS
"Plug 'https://github.com/vim-python/python-syntax.git'
"Plug 'pangloss/vim-javascript'
"Plug 'maxmellon/vim-jsx-pretty'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

set rtp+=$GOROOT/misc/vim
filetype plugin indent on    

syntax enable

set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set t_Co=256                    " Set if term supports 256 colors.
set number relativenumber
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
set laststatus=2
set noshowmode
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.
set termguicolors 
set nowrap

let mapleader = " "
let g:rehash256 = 1

map <A-N> :NERDTreeToggle<CR>
set encoding=UTF-8

let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

autocmd FileType typescript :set makeprg=tsc 

colorscheme jellybeans

"hi! NonText ctermbg=NONE guibg=NONE
"hi! Normal guibg=NONE ctermbg=NONE
"hi! LineNr guibg=NONE guifg=grey ctermbg=NONE

map <Leader>tt :vnew term://zsh<CR>
map <leader>x :terminal gcc % -o %< && ./%<<CR>

set mouse=nicr
set mouse=a

set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

let g:python_highlight_all = 1

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=Fira\ Code\ NF:h18

"autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx " set filetypes as typescript.tsx

"typescript indend
let g:typescript_indent_disable = 1
let g:typescript_compiler_binary = 'tsc'
let g:tsx_ext_required = 1

"java autocomplete
let java_highlight_functions = 1

" all remaps 
nmap <C-t> gt
nmap <C-b> :NERDTreeToggle<CR>
nmap <A-S-P> :Prettier <CR>

"toggle between terminal and editor
tnoremap <c-h> <C-\><C-n><C-w>h

"toggle spelling mistakes
noremap <F5> :setlocal spell! <CR>

nmap ( {
nmap ) }

"nerdcommenter: <C-/> (for terminal)
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

"for gui-client
nmap <C-/>   <Plug>NERDCommenterToggle
vmap <C-/>   <Plug>NERDCommenterToggle<CR>gv

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

"resizing windows
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>, :exe "vertical resize -10" <CR>
nnoremap <silent> <Leader>. :exe "vertical resize +10" <CR>

let NERDTreeMapOpenInTab='\r'

let g:lightline = {
			\ 'colorscheme': 'onedark',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste'  ],
			\             [ 'gitbranch', 'readonly', 'filename', 'modified' ], [ 'statuslinetabs' ] ]
			\
			\},
			\}

"------------------------------------------------------------------- Lsp config ---------------------------------------------------------------------------

lua << EOF
    require'lspconfig'.tsserver.setup{}
    require'lspconfig'.clangd.setup{}
    local lsp_installer = require("nvim-lsp-installer")

    -- Register a handler that will be called for all installed servers.
    -- Alternatively, you may also register handlers on specific server instances instead (see example below).
    lsp_installer.on_server_ready(function(server)
        local opts = {}

        -- (optional) Customize the options passed to the server
        -- if server.name == "tsserver" then
        --     opts.root_dir = function() ... end
        -- end

        -- This setup() function is exactly the same as lspconfig's setup function.
        -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        server:setup(opts)
    end)
    lsp_installer.settings({
        ui = {
            icons = {
                server_installed = "✓",
                server_pending = "➜",
                server_uninstalled = "✗"
            }
        }
    })

EOF

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
"nnoremap <silent> K <cmd>Lspsaga hover_doc<CR>
"nnoremap <silent><leader>ac <cmd>lua require'lspsaga.codeaction'.code_action()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
    },

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Setup lspconfig.
  --local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --  capabilities = capabilities
  --}
EOF
