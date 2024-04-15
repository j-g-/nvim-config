local status, jdtls = pcall( require, 'jdtls')

if status then
	print("Found jdtls, setting up")
else
	print("ERROR: jdtls **Not Found** , skip configuration")
	return
end
local home_dir =  os.getenv("HOME")
local jdtls_mason_bin = "/.local/share/nvim/mason/bin/jdtls" -- relative path

local os_name =  vim.loop.os_uname().sysname

if string.find(os_name , "Windows")  then
	jdtls_mason_bin = "\\AppData\\Local\\nvim-data\\mason\\bin\\jdtls" -- relative path
end


local config = {
    cmd = { home_dir .. jdtls_mason_bin },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
jdtls.start_or_attach(config)
