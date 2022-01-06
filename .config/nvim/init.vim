call plug#begin('~/.vim/plugged')

" General Plugins
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
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'mhartington/formatter.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mattn/emmet-vim'
Plug 'windwp/nvim-ts-autotag' "auto-close tag configured with treesitter
Plug 'kyazdani42/nvim-tree.lua'

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
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'chase/focuspoint-vim'
Plug 'tiagovla/tokyodark.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'Yagua/nebulous.nvim'
Plug 'projekt0n/github-nvim-theme'

call plug#end()

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

let mapleader = " "
let g:rehash256 = 1
let g:webdevicons_enable = 1
"let g:gitgutter_realtime = 1
let g:gitgutter_enabled = 0 

"let NERDTreeShowHidden=1
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1

"set updatetime=600

let g:user_emmet_install_global = 0
autocmd FileType html,css,typescriptreact,javascriptreact, EmmetInstall

" enable mouse functionality
set mouse=nicr
set mouse=a

" set colorscheme
"lua require('colorbuddy').colorscheme('gruvbuddy')

let g:tokyonight_style = "night"
let g:tokyonight_dark_sidebar = 1
let g:tokyonight_dark_float = 1
colorscheme tokyonight

"hi! NonText ctermbg=NONE guibg=NONE
"hi! Normal guibg=NONE ctermbg=NONE
"hi! LineNr guibg=NONE guifg=#B2B2B2 ctermbg=white
hi! TabLineFill guifg=#2E3440 guibg=#2E3440 ctermfg=LightGreen ctermbg=DarkGreen
hi VertSplit guifg=#2E3440

" formats file on save
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*ts,*tsx FormatWrite
augroup END

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

" Find files using Telescope command-line sugar.
nnoremap <Leader>ff <cmd>Telescope find_files<CR>
nnoremap <Leader>fg <cmd>Telescope live_grep<cr>
nnoremap <Leader>fb <cmd>Telescope buffers<cr>
nnoremap <Leader>fh <cmd>Telescope help_tags<cr>
nnoremap <Leader>fc <cmd>Telescope colorscheme theme=dropdown<cr>

" Making adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" toggle git-gutter
map <Leader>g :GitGutterToggle <CR>

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

"let g:python_highlight_all = 1

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

" general-remaps
nmap <C-t> gt
"nmap <C-b> :NERDTreeToggle<CR>
nmap <A-S-P> :Prettier <CR>
"map <Enter> :Goyo <CR>
nnoremap <A-N> :NvimTreeToggle<CR>

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
noremap <tab> gt

noremap <C-+> <C-_> <C-n>

"resizing windows
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>, :exe "vertical resize -10" <CR>
nnoremap <silent> <Leader>. :exe "vertical resize +10" <CR>

"let NERDTreeMapOpenInTab='\r'

"let g:lightline = {
            "\ 'colorscheme': 'material',
            "\ 'active': {
            "\   'left': [ [ 'mode', 'paste'  ],
            "\             [ 'gitbranch', 'readonly', 'filename', 'modified' ], [ 'statuslinetabs' ] ]
            "\
            "\},
            "\}

"------------------------------------------------------------------- Lsp config ---------------------------------------------------------------------------

lua << EOF
EOF

lua << EOF
    -- Telescope Configuration
    require('telescope').setup {
        defaults={
            color_devicons=true,
            --layout_config = {
            --    vertical = {width = 0.5}
            --},
        },
       -- pickers = {
       --   find_files = {
       --     previewer = false,
       --   },
       --},
    }

    -- Configuring LSP
    local nvim_lsp = require('lspconfig')
    local on_attach = function(client, bufnr) end
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- attaching the different language installed servers
    local servers = { 'pyright', 'clangd', 'tsserver', 'jdtls' }

    for _, lsp in ipairs(servers) do
      nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        }
      }
    end

    -- configuring lsp installer
    local lsp_installer = require("nvim-lsp-installer")

    -- Register a handler that will be called for all installed servers.
    -- Alternatively, you may also register handlers on specific server instances instead (see example below).
    lsp_installer.on_server_ready(function(server)
        local opts = {}
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
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

set completeopt=menu,menuone,noselect

lua <<EOF
  -- setting colorscheme
  --require("nebulous").setup {
  --  variant = "midnight",
  --  disable = {
  --    background = true,
  --    endOfBuffer = false,
  --    terminal_colors = false,
  --  },
  --  italic = {
  --    comments   = false,
  --    keywords   = false,
  --    functions  = false,
  --    variables  = false,
  --  },
  --}

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
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

  -- Treesitter configurations - for efficient & proper syntax highlighting, commenting ... etc
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    autotag = {
        enable = true,
        filetypes = { "html" , "xml", "typescriptreact", "javascriptreact" },
    }
  }

  function prettier_formatter() -- formatter for typescript, javascript, typescript-react, javascript-react
    return {
      exe = "prettier",
      args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
      stdin = true
    }
  end

  -- setting up formatter
  require('formatter').setup({
      filetype = {
          javascript = {prettier_formatter},
          javascriptreact = {prettier_formatter},
          typescript = {prettier_formatter},
          typescriptreact = {prettier_formatter},
      }
  })

  require'lualine'.setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {}
  }

-- nvim-tree config
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
EOF
