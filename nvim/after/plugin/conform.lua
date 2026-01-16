require("conform").setup({
  formatters_by_ft = {
    rust = { "rustfmt", lsp_format = "fallback" },
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
