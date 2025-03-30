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

    -- example using `opts` for defining servers
    -- opts = {
    --   servers = {
    --     lua_ls = {}
    --   }
    -- },
    -- config = function(_, opts)
    --   local lspconfig = require('lspconfig')
    --   for server, config in pairs(opts.servers) do
    --     -- passing config.capabilities to blink.cmp merges with the capabilities in your
    --     -- `opts[server].capabilities, if you've defined it
    --     config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
    --     lspconfig[server].setup(config)
    --   end
    -- end
    build = 'nix run .#build-plugin'

   -- -- example calling setup directly for each LSP
   --  config = function()
   --    local capabilities = require('blink.cmp').get_lsp_capabilities()
   --    local lspconfig = require('lspconfig')

   --    lspconfig['lua_ls'].setup({ capabilities = capabilities })
   --  end
  }
  

  use {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'default' },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
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
