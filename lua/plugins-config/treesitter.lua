local status, ts_configs = pcall( require, 'nvim-treesitter.configs')
-- local tsc = require 'nvim-treesitter.configs'

if status then
	print("Found nvim-treesitter.configs, setting up")
else
	print("ERROR: nvim-treesitter.configs **Not Found** , skip configuration")
	return
end
ts_configs.setup({
	modules = {},
	sync_install = false,
	ignore_install = {},
	auto_install = false,
	ensure_installed = {
		"typescript",
		"java",
		"css",
		"html",
		"python",
		"tsx",
		"xml",
		"lua",
	}
})

-- ts_configs.setup( { })
