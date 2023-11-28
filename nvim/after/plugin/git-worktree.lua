require("telescope").load_extension("git_worktree");

vim.keymap.set("n", "<leader>pw", "<cmd>:lua require('telescope').extensions.git_worktree.git_worktrees()<CR>");
vim.keymap.set("n", "<leader>pc", "<cmd>:lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>");

