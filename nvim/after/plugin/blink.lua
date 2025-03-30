require('blink.cmp').setup({
  fuzzy = {
    implementation = "prefer_rust_with_warning",
    prebuilt_binaries = {
      download = false,
    }
  },
})
-- The 'detect_cwd' field is deprecated and no longer has any affect.
-- See https://github.com/epwalsh/obsidian.nvim/pull/366 for more details.
-- [blink.cmp]: No fuzzy matching library found
-- [blink.cmp]: Falling back to Lua implementation due to error while downloading pre-built binary:
-- ...er/start/blink.cmp/lua/blink/cmp/fuzzy/download/init.lua:77: No fuzzy matching library found, but downloading from github is disabled.
-- Either run `cargo build --release` via your package manager, or set `fuzzy.prebuilt_binaries.download = true` in config.
-- See the docs for more info.
-- [blink.cmp]: Set `fuzzy.implementation = 'prefer_rust' | 'lua'` to suppress this warning.

