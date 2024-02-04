require("zen-mode").setup({
  window = {
    height = 0.95,
  },
  plugins = {
    tmux = { enabled = true },
    twilight = { enabled = false },
  },
})

require("twilight").setup({
  dimming = {
    alpha = 0.50, -- amount of dimming
    -- we try to get the foreground from the highlight groups or fallback color
    color = { "Normal", "#ffffff" },
    term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
    inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
  },
  context = 10, -- lines around
  treesitter = true, -- use treesitter when available for the filetype
  expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
    "function",
    "method",
    "table",
    "if_statement",
  },
  exclude = {}, -- exclude these filetypes
});
