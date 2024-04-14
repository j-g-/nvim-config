local status, jdtls = pcall( require, 'jdtls')

if status then
	print("Found jdtls, setting up")
else
	print("ERROR: jdtls **Not Found** , skip configuration")
	return
end
local config = {
    cmd = {'/home/jc/.local/share/nvim/mason/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
jdtls.start_or_attach(config)
