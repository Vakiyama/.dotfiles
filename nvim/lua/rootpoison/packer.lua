-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use { 'christoomey/vim-tmux-navigator', lazy = false } -- navigate between vim and tmux panes seamlessly
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-lua/popup.nvim'},
            {'nvim-telescope/telescope-fzy-native.nvim'},
        }
	}
	use {'nvim-treesitter/nvim-treesitter-context', commit = "f6c99b64111ab1424c8fde3d9a6f3cd08234f8cb" }
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
		branch = 'v4.x',
		requires = {
        -- LSP Support
        -- {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      -- {'hrsh7th/nvim-cmp'},     -- Required
      -- {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  };

  use {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    requires = { 'saghen/blink.cmp' },

    -- config = function()
    --   local lspconfig = require('lspconfig')
    --   local blink_cmp = require('blink.cmp')
    --   local capabilities = blink_cmp.get_lsp_capabilities()

    --   -- Setup tsserver (or ts_ls if that's your server) with the updated capabilities
    --   lspconfig.tsserver.setup({
    --     capabilities = capabilities,
    --     -- add any other tsserver options here
    --   })
    -- end
  }
  

  use {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },

    opts = {
      snippets = { preset = 'luasnip' },
    }
    -- use a release tag to download pre-built binaries
    -- build = 'nix run .#build-plugin',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    run = 'nix run .#build-plugin',
    opts_extend = { "sources.default" }
  }

	-- use ('github/copilot.vim')
	use ('f-person/git-blame.nvim') -- for blaming my coworkers
	-- use ('prichrd/netrw.nvim') -- nicer netrw
    use ({
        'folke/trouble.nvim',
        config = function()
            require("trouble").setup {
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
    use 'AckslD/nvim-neoclip.lua'
    use 'OlegGulevskyy/better-ts-errors.nvim'
    use 'itchyny/calendar.vim'
    -- use ({'boganworld/crackboard.nvim',
    --     config = function()
    --     require('crackboard').setup({
    --       session_key = '102b72779a94a1bb61d18b609108e320eb766aa28fc9b03edb64d9b29de90490',
    --     })
    --   end,
    -- })
end)
