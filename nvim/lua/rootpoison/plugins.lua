return require('lazy').setup({

	-- Neovim Tmux Navigator
	{
		'christoomey/vim-tmux-navigator',
		lazy = false,
	},

	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-lua/popup.nvim',
			'nvim-telescope/telescope-fzy-native.nvim',
		},
		config = function()
			local builtin = require('telescope.builtin')
			require('telescope').load_extension('neoclip')
		end,
	},

	-- Treesitter + Context + Playground
	{
   "nvim-treesitter/nvim-treesitter",
    branch = "main",
    version = false,          -- don't let lazy pin the ancient master tag
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "rust", "nix", "lua", "python", "toml",
        "javascript", "typescript", "tsx", "html", "css",
        "c_sharp", "php", "gleam",
        "markdown", "markdown_inline", "json", "yaml",
        "bash", "vim", "vimdoc", "query",
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          -- start highlighting only if a parser exists for this ft
          if pcall(vim.treesitter.start, args.buf) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		commit = 'f6c99b64111ab1424c8fde3d9a6f3cd08234f8cb',
	},

	-- Lualine + Devicons
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},
	{ 'nvim-tree/nvim-web-devicons' },

	-- Catppuccin
	{
		'catppuccin/nvim',
		as = 'catppuccin',
		commit = 'cb5665990a797b102715188e73c44c3931b3b42e',
	},

	-- Harpoon
	{ 'ThePrimeagen/harpoon' },

	-- Undotree
	{ 'mbbill/undotree' },

	-- Fugitive + vim-vinegar
	{ 'tpope/vim-fugitive' },
	{ 'tpope/vim-vinegar' },

	-- lsp-zero + mason + mason-lspconfig + lspconfig
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v4.x',
		dependencies = {
			{ 'williamboman/mason.nvim', run = function() pcall(vim.cmd, 'MasonUpdate') end },
			'williamboman/mason-lspconfig.nvim',
			'L3MON4D3/LuaSnip',
		},
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'saghen/blink.cmp',
			'L3MON4D3/LuaSnip',
		},
	},

	-- blink.cmp
	{
		'saghen/blink.cmp',
		dependencies = {
			'saghen/blink.lib',
			'rafamadriz/friendly-snippets',
		},
		build = function()
			require('blink.cmp').build():pwait()
		end,
		opts_extend = { "sources.default" },
	},

	-- Git blame
	{ 'f-person/git-blame.nvim' },

  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

	-- Git Worktree
	{ 'ThePrimeagen/git-worktree.nvim' },

	-- Oil
	{ 'stevearc/oil.nvim' },

	-- Vim APM
	{ 'ThePrimeagen/vim-apm' },

	-- Presence
	{ 'Vakiyama/presence.nvim' },

	-- Prettier
	{ 'MunifTanjim/prettier.nvim' },

	-- Noice + nui + nvim-notify
	{
		'folke/noice.nvim',
		dependencies = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		},
	},

	-- Zen Mode + Twilight
	{ 'folke/zen-mode.nvim' },
	{ 'folke/twilight.nvim' },

	-- Markdown Preview
	{
		'iamcco/markdown-preview.nvim',
		run = 'cd app && npm install',
		ft = { 'markdown' },
	},

	-- Vim Pencil
	{ 'preservim/vim-pencil' },

	-- Dadbod + Dadbod UI + Dadbod Completion
	{ 'tpope/vim-dadbod' },
	{ 'kristijanhusak/vim-dadbod-ui' },
	{ 'kristijanhusak/vim-dadbod-completion' },

	-- Neoclip
	{
		'AckslD/nvim-neoclip.lua',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},

	-- Better TS Errors
	{ 'OlegGulevskyy/better-ts-errors.nvim' },

	-- Clear Action
	{ 'luckasRanarison/clear-action.nvim' },

	-- Indent Blankline
	{ 'lukas-reineke/indent-blankline.nvim' },

	-- Conform
	{ 'stevearc/conform.nvim' },
})
