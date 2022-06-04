call plug#begin('~/.vim/plugged')

" General Plugins
Plug 'scrooloose/nerdcommenter'
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

Plug 'akinsho/bufferline.nvim'

"auto-close tag configured with treesitter
Plug 'windwp/nvim-ts-autotag'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'Yggdroot/indentLine'

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

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Theme Plugins
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'chase/focuspoint-vim'
Plug 'projekt0n/github-nvim-theme'
Plug 'tomasiser/vim-code-dark'
Plug 'charliesbot/night-owl.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'https://github.com/rose-pine/neovim.git'

call plug#end()

let BASE_DIR = "/home/anish/.config/nvim/"

exec "source " BASE_DIR . "config/general_settings.vim"
exec "source " BASE_DIR . "config/keybindings.vim"

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
  }
EOF
