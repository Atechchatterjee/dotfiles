call plug#begin('~/.vim/plugged')

" General Plugins
Plug 'honza/vim-snippets'
Plug 'https://github.com/vifm/vifm.vim.git'
Plug 'voldikss/vim-floaterm'
Plug 'https://github.com/skammer/vim-css-color.git'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'vimwiki/vimwiki'
Plug 'https://github.com/ap/vim-css-color.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'jiangmiao/auto-pairs'
Plug 'mhartington/formatter.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mattn/emmet-vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'https://github.com/terrortylor/nvim-comment'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'akinsho/bufferline.nvim'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'ianding1/leetcode.vim'

"auto-close tag configured with treesitter
Plug 'windwp/nvim-ts-autotag'
Plug 'kyazdani42/nvim-tree.lua'

" makes nvim-completely transparent
Plug 'xiyaowong/nvim-transparent' 
Plug 'iamcco/markdown-preview.nvim'
Plug 'iamcco/markdown-preview.nvim'
Plug 'https://github.com/tpope/vim-fugitive.git'

" Lsp Related Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'glepnir/lspsaga.nvim'
Plug 'folke/trouble.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Theme Plugins
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'chase/focuspoint-vim'
Plug 'projekt0n/github-nvim-theme'
Plug 'tomasiser/vim-code-dark'
Plug 'ayu-theme/ayu-vim'
Plug 'https://github.com/rose-pine/neovim.git'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'https://github.com/w0ng/vim-hybrid.git'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'https://github.com/overcache/NeoSolarized.git'

Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'jordanbrauer/citylights.nvim'
Plug 'https://github.com/jordanbrauer/citylights.nvim.git'
Plug 'navarasu/onedark.nvim'

call plug#end()

set guifont=JetBrains_Mono:h13

lua << EOF
  package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/config/?.lua"

  local function import(file_names)
    for _, name in ipairs(file_names) do
      require(name)
    end
  end

  import {
    "treesitter_config",
    "lsp_config",
    "telescope",
    "formatter_config",
    "lualine_config",
    "nvimtree_config",
    "trouble_config",
    "gitsigns_config",
    "bufferline_config",
    "cmp_config"
  }

  require("lspsaga.codeaction")

  require("nvim_comment").setup({
    hook = function()
      require("ts_context_commentstring.internal").update_commentstring()
    end,
  })

  require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
  }

  local saga = require("lspsaga")
  saga.init_lsp_saga()

  require('material').setup({
    italics = {
      comments = true, 
      keywords = true,
      functions = false,
      strings = false,
      variables = false 
    },
    disable = {
      colored_cursor = true,
      background = true
    },
    contrast = {
      sidebars = false,
      floating_windows = false,
      popup_menu = false,
      non_current_windows = false,
      line_numbers = true,
      cursor_line = true
    },
    lualine_style="stealth"
  })

  require("onedark").setup {
    style = "darker"
  }
EOF

set background=dark

let g:material_style = "deep ocean"
colorscheme material

set linespace=10

let BASE_DIR = "/home/anish/.config/nvim/"

exec "source " BASE_DIR . "config/keybindings.vim"
exec "source " BASE_DIR . "config/general_settings.vim"
