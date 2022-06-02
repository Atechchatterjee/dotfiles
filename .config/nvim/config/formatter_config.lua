function prettier_formatter() -- formatter for typescript, javascript, typescript-react, javascript-react
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--double-quote'},
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

