-- Lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git', 'clone', '--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

-- Settings (no plugin deps)
require("rootpoison.set")

-- Plugin declarations
require("rootpoison.plugins")

-- Remaps + entry (safe to load after plugins)
require("rootpoison.remap")
require("rootpoison.entry")
