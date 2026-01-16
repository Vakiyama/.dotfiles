local lsp = require("lsp-zero")

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] =' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.HINT] = ' ',
      [vim.diagnostic.severity.INFO] = '',
    },
  },
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

local lspconfig = require('lspconfig')

-- Configuring the Gleam LSP
lspconfig.gleam.setup({})

vim.api.nvim_create_user_command('FormatAndSaveGleam', function()
  vim.cmd('write')                    -- Save the file
  vim.cmd('silent !gleam format %')  -- Run the formatter on the current file
  vim.cmd('edit!')                    -- Force reload the file from disk
  vim.cmd('write')                    -- Save the file
end, {})

-- Define a command to format and save C# files
vim.api.nvim_create_user_command('FormatAndSavePHP', function()
  vim.cmd('write')  -- Save the file
  vim.cmd('silent !php-cs-fixer fix %')  -- Run the formatter on the current file
  vim.cmd('edit!')  -- Reload the file from disk
  vim.cmd('write')  -- Save the file again
end, {})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.php",
  callback = function()
    vim.cmd('FormatAndSavePHP')
  end,
})

-- Define a command to format and save C# files
vim.api.nvim_create_user_command('FormatAndSaveCsharp', function()
  vim.cmd('write')  -- Save the file
  
  -- Run the formatter and capture the result
  local result = vim.fn.system('dotnet csharpier ' .. vim.fn.expand('%'))
  
  -- Check if there was an error
  if vim.v.shell_error ~= 0 then
    print('Error running csharpier: ' .. result)
    return
  end
  
  vim.cmd('edit!')  -- Reload the file from disk
  vim.cmd('write')  -- Save the file again
end, {})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.cs",
  callback = function()
    vim.cmd('FormatAndSaveCsharp')
  end,
})

-- lua format on save
if vim.fn.executable('lua-format')
  then
      vim.api.nvim_create_user_command('FormatAndSaveLua', function()
          vim.cmd('write')
          vim.cmd('silent !lua-format %')
          vim.cmd('edit!')
          vim.cmd('write')
      end, {})

      vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*.lua",
          callback = function()
              vim.cmd('FormatAndSaveLua')
          end,
      })
  end

-- nix format on save
if vim.fn.executable('nixfmt')
  then
      vim.api.nvim_create_user_command('FormatAndSaveNix', function()
          vim.cmd('write')
          vim.cmd('silent !nixpkgs-fmt %')
          vim.cmd('edit!')
          vim.cmd('write')
      end, {})

      vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*.nix",
          callback = function()
              vim.cmd('FormatAndSaveNix')
          end,
      })
  end


vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.gleam",
  callback = function()
    vim.cmd('FormatAndSaveGleam')
  end,
})


local lsp_configurations = require('lspconfig.configs')

-- if vim.loop.os_uname().sysname == "Linux" then
--             local command = [[
--                 source /etc/os-release;
--                 echo $NAME
--             ]]
--             local handle = io.popen(command)
--             if handle ~= nil then
--                 local distro = handle:read("*a")
-- 
--                 if distro:match("NixOS") ~= nil then
--                     if vim.fn.executable('lua-language-server') == 1 and
--                         not lsp_configurations.lua_lsp
--                     then
--                         lsp_configurations.lua_lsp = {
--                             default_config = {
--                                 name = 'lua-language-server',
--                                 cmd = { 'lua-language-server' },
--                                 filetypes = { 'lua' },
--                                 root_dir = lspconfig.root_pattern('init.lua')
--                             }
--                         }
--                         lspconfig.lua_lsp.setup({})
--                     end
--                 end
-- 
--                 handle:close()
--             end
--         end


if vim.fn.executable('rust-analyzer') == 1 then
    lspconfig.rust_analyzer.setup({
        settings = {
            ['rust-analyzer'] = {
                check = {
                    command = "clippy",  -- Use clippy instead of cargo check
                },
                -- Optional: configure clippy features
                checkOnSave = {
                    command = "clippy",
                },
            }
        },
        -- Only if you need to override root_dir
        root_dir = require('lspconfig.util').root_pattern('Cargo.toml', 'rust-project.json', 'flake.nix'),
    })
end

servers = {
    ['ts_ls'] = {
      filetypes = { 'typescript', 'javascript' },
    },
    ['rust_analyzer'] = {'rust'},
    ['nil_ls'] = {'nix'},
    ['pyright'] = {'python'},
    ['omnisharp'] = {'csharp'},
    ['phpactor'] = {'php'}
  }

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = servers 
})

local capabilities = require('blink.cmp').get_lsp_capabilities()

lspconfig.ts_ls.setup({
  capabilities = capabilities,
})


vim.diagnostic.config({
    virtual_text = true
}) 

require('mason').setup({})

require('mason-lspconfig').setup({
   handlers = {
    -- keep your default setup
    require('lsp-zero').default_setup,

    -- override tailwindcss so we can add gleam support
    tailwindcss = function()
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        -- make the server attach to Gleam buffers too
        filetypes = {
          'html', 'css', 'scss', 'sass', 'postcss',
          'javascript', 'javascriptreact', 'typescript', 'typescriptreact',
          'vue', 'svelte',
          'gleam', 
        },

        -- let it find your project root even in monorepos
        root_dir = lspconfig.util.root_pattern(
          'tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.ts',
          'postcss.config.js', 'postcss.config.cjs', 'postcss.config.ts',
          'package.json', 'bun.lockb', 'pnpm-lock.yaml', 'yarn.lock', '.git'
        ),

        -- VS Code-style "init_options" are respected by the Tailwind LSP

        settings = {
          tailwindCSS = {
            includeLanguages = {
                gleam = "javascript",
            },
            classFunctions = {
                "class",
                "classes",
            },
          },
        },
      })
    end,
  },
  ensure_installed = {
    'tailwindcss',
  },
})
