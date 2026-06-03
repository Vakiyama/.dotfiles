local blink = require('blink.cmp')
blink.setup({
	fuzzy = {
		implementation = "prefer_rust_with_warning",
    -- prebuilt_binaries = {
		-- 	download = false,
		-- }
	},
	completion = {
		menu = {
			draw = {
				columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, { 'source_name' } },
			},
		},
	},
})
