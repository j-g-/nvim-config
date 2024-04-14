local status, mason_lspconfig = pcall( require, 'mason-lspconfig')

if status then
	print("Found mason lspconfig, setting up")
else
	print("ERROR: mason lspconfig **Not Found** , skip configuration")
	return
end


mason_lspconfig.setup({
	automatic_installation = true,
	ensure_installed = {
		"cssls",
		"eslint",
		"html",
		"jsonls",
		"jdtls",
		"tsserver",
		"pyright",
		"tailwindcss",
		"lemminx",
		"lua_ls",
	},
})

