-- load plugins and lspconfig
require('plugins')
-- require('mylspconfig')
require('mappings')


-- <<< Start: General options 

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
-- >>> End: General options 

-- <<< Start: Color Setup 

vim.cmd 'colorscheme kanagawa'

-- >>> End: Color Setup 
--
-- <<< Start: nvim-tree setup
-- To start tree 

-- >>> End: Color Setup 



-- vim: set foldmethod=marker foldmarker=<<<,>>> :
