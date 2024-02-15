-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use { 'christoomey/vim-tmux-navigator', lazy = false } -- navigate between vim and tmux panes seamlessly
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-lua/popup.nvim'},
            {'nvim-telescope/telescope-fzy-native.nvim'},
        }
	}
	use ('nvim-treesitter/nvim-treesitter-context')
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use { "catppuccin/nvim", as = "catppuccin" }
	use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use ('nvim-treesitter/playground')
	use ('ThePrimeagen/harpoon')
	use ('mbbill/undotree')
	use ('tpope/vim-fugitive')
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			run = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
	}};
	-- use ('github/copilot.vim')
	use ('f-person/git-blame.nvim') -- for blaming my coworkers
	-- use ('prichrd/netrw.nvim') -- nicer netrw
    use ({
        'folke/trouble.nvim',
        config = function()
            require("trouble").setup {
                icons = false,
                use_diagnostic_signs = true,
            }
        end
    })
    use 'ThePrimeagen/git-worktree.nvim' 

    -- refactoring plugin 
    use 'ThePrimeagen/refactoring.nvim' 

    use ({ 'stevearc/oil.nvim'  })
    use 'ThePrimeagen/vim-apm'
    use 'Vakiyama/presence.nvim' 
    use 'MunifTanjim/prettier.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'tpope/vim-vinegar' 
    use 'nvim-tree/nvim-web-devicons'
    use 
    { 'folke/noice.nvim',
      requires = {
        {"MunifTanjim/nui.nvim"},
        {"rcarriga/nvim-notify"},
      },
    }
    use 'folke/zen-mode.nvim' 
    use 'folke/twilight.nvim' 
    use({
      "epwalsh/obsidian.nvim",
      tag = "*",  -- recommended, use latest release instead of latest commit
      requires = { 
        "nvim-lua/plenary.nvim", -- telescope already has this as a dep but idk
      },
    })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    use 'preservim/vim-pencil'
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'
    use 'kristijanhusak/vim-dadbod-completion'
end)
