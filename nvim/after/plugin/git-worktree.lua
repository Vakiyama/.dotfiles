local worktree = require("git-worktree")

worktree.setup({
  change_directory_command = "tcd",
  update_on_change = true,         -- plugin will try to cd for you
  update_on_change_command = "edit .",
  clearjumps_on_change = true,
  autopush = false,
})

require("telescope").load_extension("git_worktree")
vim.keymap.set("n", "<leader>pw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
vim.keymap.set("n", "<leader>pc", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")

-- single helper (don’t duplicate)
local function cd_to(p, scope)
  if type(p) ~= "string" or p == "" then return end
  vim.cmd((scope or "tcd") .. " " .. vim.fn.fnameescape(p))
end

-- Handle both callback signatures (string path OR metadata table)
worktree.on_tree_change(function(op, meta)
  if op ~= worktree.Operations.Switch then return end

  local p = nil
  if type(meta) == "string" then
    p = meta
  elseif type(meta) == "table" then
    -- cover different versions/fields
    p = meta.path or meta.worktree_path or meta.toplevel or meta.cwd
  end

  if not p then
    vim.notify("[git-worktree] switch: missing path; not changing cwd", vim.log.levels.WARN)
    return
  end

  -- belt & suspenders: even though setup() already does tcd+edit, enforce it here
  cd_to(p, "tcd")
  vim.schedule(function()
    pcall(vim.cmd, "silent! edit .")
  end)
end)
