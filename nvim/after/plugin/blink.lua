local blink = require('blink.cmp')
blink.setup({
  fuzzy = {
    implementation = "prefer_rust_with_warning",
    prebuilt_binaries = {
      download = false,
    }
  },
 -- Error detected while processing /home/Root/.config/nvim/after/plugin/blink.lua:
 -- E5112: Error while creating lua chunk: /home/Root/.config/nvim/after/plugin/blink.lua:9: '}' expected (to close '{' at line 2) near '='

  completion = {
    menu = {
      draw = {
        columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, { 'source_name' } },
      },
    },
  },
})

local lspconfig = require('lspconfig')

  -- config = function(_, opts)
  --   local lspconfig = require('lspconfig')
  --   for server, config in pairs(opts.servers) do
  --     -- passing config.capabilities to blink.cmp merges with the capabilities in your
  --     -- `opts[server].capabilities, if you've defined it
  --     config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
  --     lspconfig[server].setup(config)
  --   end
  -- end
