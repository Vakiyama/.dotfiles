local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'ts_ls',
  'rust_analyzer',
  'nil_ls',
  'omnisharp'
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = ' ',
        warn = ' ',
        hint = ' ',
        info = ''
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
-- This block should come after lsp.setup()
cmp.setup({
  -- Existing configuration...
  mapping = cmp_mappings,
  sources = cmp.config.sources({
    { name = 'vim-dadbod-completion' },
    { name = 'nvim_lsp' },
    -- Add more sources as needed
  }),
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        rg = '[Rg]',
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        vsnip = '[Snippet]',
        tags = '[Tag]',
        path = '[Path]',
        orgmode = '[Org]',
        ['vim-dadbod-completion'] = '[DB]',
      })[entry.source.name]
      return vim_item
    end,
  }
})

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


-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.gleam",
--   callback = function()
--     vim.cmd('FormatAndSaveGleam')
--   end,
-- })


lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['ts_ls'] = {'javascript', 'typescript'},
    ['rust_analyzer'] = {'rust'},
    ['nil_ls'] = {'nix'},
    ['pyright'] = {'python'},
    ['omnisharp'] = {'csharp'}
  }
})

vim.diagnostic.config({
    virtual_text = true

})

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp.default_setup,
  },
})
