require("catppuccin").setup({
    flavor = "frappe",
    transparent_background = true,     
    integrations = {
      cmp = true,
      treesitter = true,
      notify = true,
    }
})

vim.cmd.colorscheme "catppuccin"

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#626880' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='#c6d0f5' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#626880' })

