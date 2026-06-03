local lsp = require("lsp-zero")

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = ' ',
			[vim.diagnostic.severity.WARN] = ' ',
			[vim.diagnostic.severity.HINT] = ' ',
			[vim.diagnostic.severity.INFO] = '',
		},
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup()

vim.api.nvim_create_user_command('FormatAndSaveGleam', function()
	vim.cmd('write')
	vim.cmd('silent !gleam format %')
	vim.cmd('edit!')
	vim.cmd('write')
end, {})

vim.api.nvim_create_user_command('FormatAndSavePHP', function()
	vim.cmd('write')
	vim.cmd('silent !php-cs-fixer fix %')
	vim.cmd('edit!')
	vim.cmd('write')
end, {})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.php",
	callback = function() vim.cmd('FormatAndSavePHP') end,
})

vim.api.nvim_create_user_command('FormatAndSaveCsharp', function()
	vim.cmd('write')
	local result = vim.fn.system('dotnet csharpier ' .. vim.fn.expand('%'))
	if vim.v.shell_error ~= 0 then
		print('Error running csharpier: ' .. result)
		return
	end
	vim.cmd('edit!')
	vim.cmd('write')
end, {})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.cs",
	callback = function() vim.cmd('FormatAndSaveCsharp') end,
})

if vim.fn.executable('lua-format') == 1 then
	vim.api.nvim_create_user_command('FormatAndSaveLua', function()
		vim.cmd('write')
		vim.cmd('silent !lua-format %')
		vim.cmd('edit!')
		vim.cmd('write')
	end, {})

	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*.lua",
		callback = function() vim.cmd('FormatAndSaveLua') end,
	})
end

if vim.fn.executable('nixpkgs-fmt') == 1 then
	vim.api.nvim_create_user_command('FormatAndSaveNix', function()
		vim.cmd('write')
		vim.cmd('silent !nixpkgs-fmt %')
		vim.cmd('edit!')
		vim.cmd('write')
	end, {})

	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*.nix",
		callback = function() vim.cmd('FormatAndSaveNix') end,
	})
end

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.gleam",
	callback = function() vim.cmd('FormatAndSaveGleam') end,
})

-- rust-analyzer with clippy
if vim.fn.executable('rust-analyzer') == 1 then
  vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {
            check = { command = "clippy" },
            checkOnSave = true,   -- boolean now; the command lives under `check`
        },
    },
    root_markers = { { 'Cargo.toml', 'rust-project.json' }, 'flake.nix' },
  })
  vim.lsp.enable('rust_analyzer')
end

-- TypeScript/JavaScript
vim.lsp.config('ts_ls', {
	filetypes = { 'typescript', 'javascript' },
})

-- Python
vim.lsp.config('pyright', {
	filetypes = { 'python' },
})

-- Nix
vim.lsp.config('nil_ls', {
	filetypes = { 'nix' },
})

-- C#
vim.lsp.config('omnisharp', {
	filetypes = { 'csharp' },
})

-- PHP
vim.lsp.config('phpactor', {
	filetypes = { 'php' },
})

vim.lsp.enable({
  'ts_ls',
  'pyright',
  'nil_ls',
  'omnisharp',
  'phpactor',
  'tailwindcss',
})

-- Tailwind CSS with gleam support
local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config('tailwindcss', {
	capabilities = capabilities,
	filetypes = {
		'html', 'css', 'scss', 'sass', 'postcss',
		'javascript', 'javascriptreact', 'typescript', 'typescriptreact',
		'vue', 'svelte', 'gleam',
	},
  root_markers = { 
			'tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.ts',
			'postcss.config.js', 'postcss.config.cjs', 'postcss.config.ts',
			'package.json', 'bun.lockb', 'pnpm-lock.yaml', 'yarn.lock', '.git',
  },
	root_dir = function(fname)
		return vim.fs.root(fname, {

		})
	end,
	settings = {
		tailwindCSS = {
			includeLanguages = { gleam = "javascript" },
			classFunctions = { "class", "classes" },
		},
	},
})

vim.diagnostic.config({ virtual_text = true })

require('mason').setup({})

require('mason-lspconfig').setup({
	ensure_installed = {
		'tailwindcss',
	},
})
