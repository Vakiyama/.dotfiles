require("catppuccin").setup({
    flavor = "frappe",
    transparent_background = true,     
    integrations = {
      cmp = true,
      treesitter = true,
      treesitter_context = true,
      telescope = {
        enabled = true,
      },
      notify = true,
      blink_cmp = {
        style = 'bordered',
      }
    },
		custom_highlights = {
      NormalFloat = { bg = "none" },
      TelescopeBorder = { bg = "none" },
      TelescopePromptTitle = { bg = "none" },
      TelescopeResultsTitle = { bg = "none" },
      TelescopePreviewTitle = { bg = "none" },
      MiniIndentscopeSymbol = { fg = "#737994" }
		}
})

vim.cmd.colorscheme "catppuccin"

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#626880' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='#c6d0f5' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#626880' })
