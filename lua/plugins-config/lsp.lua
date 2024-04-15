local status, nvim_lsp = pcall( require, 'lspconfig')

if status then
	print("Found lspconfig, setting up")
else
	print("ERROR: lspconfig **Not Found** , skip configuration")
	return
end

local on_attach = function()
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {buffer = 0})
	vim.keymap.set("n", "<leader>gT", vim.lsp.buf.type_definition, {buffer = 0})
	vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {buffer = 0})
	vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, {buffer = 0})
	vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer = 0})
	vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer = 0})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.pyright.setup({ on_attach = on_attach, capabilities  = capabilities })
nvim_lsp.cssls.setup({ on_attach = on_attach, capabilities  = capabilities })
nvim_lsp.eslint.setup({ on_attach = on_attach, capabilities  = capabilities })
nvim_lsp.html.setup({ on_attach = on_attach, capabilities = capabilities})
nvim_lsp.jsonls.setup({ on_attach = on_attach, capabilities = capabilities})
nvim_lsp.jdtls.setup({ on_attach = on_attach, capabilities = capabilities})
nvim_lsp.tsserver.setup({ on_attach = on_attach, capabilities = capabilities})
nvim_lsp.pyright.setup({ on_attach = on_attach, capabilities = capabilities})
nvim_lsp.tailwindcss.setup({ on_attach = on_attach, capabilities = capabilities})
nvim_lsp.lemminx.setup({ on_attach = on_attach, capabilities = capabilities})

nvim_lsp.lua_ls.setup({
	on_attach = on_attach,
	on_init = function (client)
		local path = client.workspace_folders[1].name
		if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
			return
		end

		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT'
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				--library = {
					--vim.env.VIMRUNTIME
					-- Depending on the usage, you might want to add additional paths here.
					-- "${3rd}/luv/library"
					-- "${3rd}/busted/library",
				--}
				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
				library = vim.api.nvim_get_runtime_file("", true)
			}
		})
	end,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = {'vim'}
			}
		}
	}
})
