vim.cmd('source ~/.cache/calendar.vim/credentials.vim')
vim.g.calendar_google_calendar = 1
vim.g.calendar_google_task = 1

vim.keymap.set("n", "<leader>c", "<cmd>Calendar<cr>")
