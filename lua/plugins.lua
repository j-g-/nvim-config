-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
local use = require('packer').use

return require('packer').startup(function(use)
	-- https://github.com/wbthomason/packer.nvim
	-- Packer can manage itself : package manager for plugins
	-- ================================================================================
	use 'wbthomason/packer.nvim' -- Package Manager


	-- mason:  https://github.com/williamboman/mason.nvim/ -- Package Manager
	-- ================================================================================
	use {
		'williamboman/mason.nvim',
		config = function()
			require("mason").setup()
		end,
	}

	-- mason-lsp:  https://github.com/williamboman/mason-lspconfig
	-- Package Manager for LSPs and other stuff, just LSPs for now
	-- ================================================================================
	use {
		'williamboman/mason-lspconfig',
		requires = {
			{'williamboman/mason.nvim'},
		},
		config = function()
			local status, mason = pcall(require, "mason")
			if status then
				print("Calling Mason Setup")
				mason.setup()
				require("mason-lspconfig").setup()
				require ("plugins-config.mason-lspconfig")
			else
				print("Mason not loaded")
			end
		end,
	}

	-- nvim-lspconfig: https://github.com/neovim/nvim-lspconfig
	-- ================================================================================
	use {
		'neovim/nvim-lspconfig' , -- Config for Neovim LSP
		-- configurations in plugins-config dir
		config = function() 
			require("plugins-config.lsp")
		end,
	}

	-- mfussenegger/nvim-jdtls: https://github.com/mfussenegger/nvim-jdtls
	-- For jdtls intial setup 
	-- TODO: Setup other options
	-- ================================================================================
	use {
		'mfussenegger/nvim-jdtls',
		config = function ()
			require("plugins-config.jdtls")
		end,
	}



	-- cmp-nvim : completion helpers
	-- https://github.com/hrsh7th/nvim-cmp 
	-- ================================================================================
	 use 'hrsh7th/cmp-buffer'
	 use 'hrsh7th/cmp-path'
	 use 'hrsh7th/cmp-cmdline'
	 use 'hrsh7th/cmp-nvim-lsp'
	 use {
		 'hrsh7th/nvim-cmp',
		 config = function()
			 require("plugins-config.cmp-configs")
		 end,
		 requires = {
			 'L3MON4D3/LuaSnip',
			 'saadparwaiz1/cmp_luasnip',
		 },
	 }

	-- lspkind.nvim: https://github.com/onsails/lspkind.nvim
	-- ================================================================================
	 use 'onsails/lspkind.nvim'

	-- nvim-treesitter: https://github.com/nvim-treesitter/nvim-treesitter
	-- ================================================================================
	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('plugins-config.treesitter')
		end,
		run = ':TSUpdate',
	}

	-- kanagawa.nvim: https://github.com/rebelot/kanagawa.nvim
	-- ================================================================================
	use 'rebelot/kanagawa.nvim' -- Colorscheme Kanagawa

	--	lukas-reineke/indent-blankline.nvim: https://github.com/lukas-reineke/indent-blankline.nvim
	--	For indent highlights
	-- ================================================================================
	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function ()
			require('plugins-config.indent-blankline').setup()
		end
	}

	-- neo-tree.nvim: https://github.com/nvim-neo-tree/neo-tree.nvim
	-- ================================================================================
	use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v3.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'MunifTanjim/nui.nvim',
		}
	}

	-- neo-tree.nvim: https://github.com/nvim-neo-tree/neo-tree.nvim
	-- ================================================================================
	use 'junegunn/vim-easy-align' -- Easy Align


	-- neo-tree.nvim: https://github.com/nvim-telescope/telescope.nvim
	-- ================================================================================
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
	}

	-- neo-tree.nvim: https://github.com/nvim-telescope/telescope.nvim
	-- ================================================================================
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
	}

	-- numToStr/Comment.nvim: https://github.com/numToStr/Comment.nvim
	-- ================================================================================
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

end)

--
--  for neo-tree.nvim : 'nvim-tree/nvim-web-devicons',
--
--	use 'nvim-tree/nvim-tree.lua' -- nvim tree
-- -- Simple plugins can be specified as strings
-- use 'rstacruz/vim-closer'
-- 
-- -- Lazy loading:
-- -- Load on specific commands
-- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
-- 
-- -- Load on an autocommand event
-- use {'andymass/vim-matchup', event = 'VimEnter'}
-- 
-- -- Load on a combination of conditions: specific filetypes or commands
-- -- Also run code after load (see the "config" key)
-- use {
--   'w0rp/ale',
--   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
--   cmd = 'ALEEnable',
--   config = 'vim.cmd[[ALEEnable]]'
-- }
-- 
-- -- Plugins can have dependencies on other plugins
-- use {
--   'haorenW1025/completion-nvim',
--   opt = true,
--   requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
-- }
-- 
-- -- Plugins can also depend on rocks from luarocks.org:
-- use {
--   'my/supercoolplugin',
--   rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
-- }
-- 
-- -- You can specify rocks in isolation
-- use_rocks 'penlight'
-- use_rocks {'lua-resty-http', 'lpeg'}
-- 
-- -- Local plugins can be included
-- use '~/projects/personal/hover.nvim'
-- 
-- -- Plugins can have post-install/update hooks
-- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
-- 
-- -- Post-install/update hook with neovim command
-- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
-- 
-- -- Post-install/update hook with call of vimscript function with argument
-- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
-- 
-- -- Use specific branch, dependency and run lua file after load
-- use {
--   'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
--   requires = {'kyazdani42/nvim-web-devicons'}
-- }
-- 
-- -- Use dependency and run lua function after load
-- use {
--   'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
--   config = function() require('gitsigns').setup() end
-- }
-- 
-- -- You can specify multiple plugins in a single call
-- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}
-- 
-- -- You can alias plugin names
-- use {'dracula/vim', as = 'dracula'}
