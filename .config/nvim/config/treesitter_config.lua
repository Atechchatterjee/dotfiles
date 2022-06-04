-- Treesitter configurations - for efficient & proper syntax highlighting, commenting ... etc
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    --additional_vim_regex_highlighting = {'org'}
    additional_vim_regex_highlighting = true,
  },
  autotag = {
      enable = true,
      filetypes = { "html" , "xml", "typescriptreact", "javascriptreact" },
  },
}

