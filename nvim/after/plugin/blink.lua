local blink = require('blink.cmp')
blink.setup({
  fuzzy = {
    implementation = "prefer_rust_with_warning",
    prebuilt_binaries = {
      download = false,
    }
  },
})

local lspconfig = require('lspconfig')
local capabilities = blink.get_lsp_capabilities()

-- Setup tsserver (or ts_ls if that's your server) with the updated capabilities
lspconfig.ts_ls.setup({
  capabilities = capabilities,
  -- add any other tsserver options here
})

  -- config = function(_, opts)
  --   local lspconfig = require('lspconfig')
  --   for server, config in pairs(opts.servers) do
  --     -- passing config.capabilities to blink.cmp merges with the capabilities in your
  --     -- `opts[server].capabilities, if you've defined it
  --     config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
  --     lspconfig[server].setup(config)
  --   end
  -- end
