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

-- lazy 
vim.cmd([[
  command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>
  command! -bar -nargs=* -complete=file -range=% -bang Write     <line1>,<line2>write<bang> <args>
  command! -bar -nargs=* -complete=file -range=% -bang Wq        <line1>,<line2>wq<bang> <args>
  command! -bar                                  -bang Wa     wa<bang>
  command! -bar                                  -bang Wqall     wqa<bang>
  command! -bar -nargs=* -complete=file -range=% -bang We        <line1>,<line2>w<bang> | e <args>
  command! -bar -nargs=* -complete=file -count   -bang Wnext     <count>wnext<bang> <args>
  command! -bar -nargs=* -complete=file -count   -bang Wprevious <count>wprevious<bang> <args>
  command! -bar -nargs=* -complete=file          -bang E         edit<bang> <args>
  command! -bar -nargs=* -complete=file          -bang Edit      edit<bang> <args>
  command! -bar                                  -bang Q         quit<bang>
  command! -bar                                  -bang Quit      quit<bang>
  command! -bar                                  -bang Qall      qall<bang>
  command! -bar -nargs=? -complete=option              Set       set <args>
  command! -bar -nargs=? -complete=help                Help      help <args>
  command! -bar -nargs=* -complete=file          -bang Make      make<bang> <args>
  command! -bar -nargs=* -complete=buffer        -bang Bdel      bdel<bang> <args>
  command! -bar -nargs=* -complete=buffer        -bang Bwipe     bwipe<bang> <args>
  command! -bar -nargs=* -complete=file          -bang Mksession mksession<bang> <args>
  command! -bar -nargs=* -complete=dir           -bang Cd        cd<bang> <args>
  command! -bar                                        Messages  messages
  command! -bar -nargs=+ -complete=file          -bang Source    source<bang> <args>
]])

