local blink = require('blink.cmp')
blink.setup({
	fuzzy = {
		-- Nix env: build the native matcher from source via the `build` hook in
		-- plugins.lua (`require('blink.cmp').build():pwait()`). Prebuilt binaries
		-- from GitHub releases don't link correctly on Nix. Use hard "rust" so a
		-- stale/missing build errors loudly instead of silently falling back to Lua.
		implementation = "rust",
	},
	completion = {
		menu = {
			draw = {
				columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, { 'source_name' } },
			},
		},
	},
})
