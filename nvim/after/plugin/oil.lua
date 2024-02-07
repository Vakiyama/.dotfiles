-- OIL OIL OIL OILOIL OIL OIL OILOIL OIL OIL OILOIL OIL OIL OILOIL OIL OIL OILOIL OIL OIL OILOIL OIL OIL OIL
--
require("oil").setup({
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
    -- This function defines what is considered a "hidden" file
    is_hidden_file = function(name, bufnr)
      return vim.startswith(name, ".")
    end,
    -- This function defines what will never be shown, even when `show_hidden` is set
    is_always_hidden = function(name, bufnr)
      return false
    end,
    sort = {
      -- sort order can be "asc" or "desc"
      -- see :help oil-columns to see which columns are sortable
      { "type", "asc" },
      { "name", "asc" },
    },
  },
  float = {
    -- Padding around the floating window
    padding = 2,
    max_width = 0,
    max_height = 0,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
  }
})
