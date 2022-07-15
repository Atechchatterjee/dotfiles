-- Treesitter configurations - for efficient & proper syntax highlighting, commenting ... etc
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}
    -- additional_vim_regex_highlighting = false,
  },
  enable_autocmd = false,
  autotag = {
      enable = true,
      filetypes = { "html" , "xml", "typescriptreact", "javascriptreact" },
  },
  context_commentstring = {
    enable = true,
    config = {
      javascript = {
        __default = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s'
      },
     typescript = {
        __default = '// %s',
        __multiline = '/* %s */',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
     }
    }
  }
}

