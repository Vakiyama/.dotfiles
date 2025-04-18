vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", ":Oil<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

-- replace custom
vim.keymap.set("n", "<leader>fr", [[:%s/]])

-- replace occurences of current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- open filetree
vim.keymap.set("n", "<leader>pt", vim.cmd.Neotree)

-- lsp hover
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover)

-- exit terminal insert mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- toggle git blame
vim.keymap.set("n", "<leader>b", vim.cmd.GitBlameToggle)

-- copilot toggle
-- vim.api.nvim_set_keymap("n", "<leader>ct", ":Copilot<CR>", { noremap = true, silent = true })

-- refactoring plugin
vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")

vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")

vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")

vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")

vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

-- zenmode
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>")

-- pencil
vim.keymap.set("n", "<leader>p", ":TogglePencil<CR>");

-- markdown preview
vim.g.mkdp_markdown_css = '/home/Root/.config/nvim/after/plugin/markdown.css';

-- db-ui
--
vim.keymap.set("n", "<leader>dv", ":DBUIToggle<CR>");

-- lazy shift
vim.cmd([[
  command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>
  command! -bar -nargs=* -complete=file -range=% -bang Write     <line1>,<line2>write<bang> <args>
  command! -bar -nargs=* -complete=file -range=% -bang Wq        <line1>,<line2>wq<bang> <args>
  command! -bar                                  -bang Wa     wa
  command! -bar                                  -bang Wqall     wqa
  command! -bar                                  -bang Q         quit
  command! -bar                                  -bang Quit      quit
  command! -bar                                  -bang Qall      qall
  command! -bar -nargs=? -complete=option              Set       set <args>
  command! -bar -nargs=? -complete=help                Help      help <args>
  command! -bar                                        Messages  messages
]])

