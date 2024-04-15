-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
local use = require('packer').use

return require('packer').startup(function(use)
	-- https://github.com/wbthomason/packer.nvim
	-- Packer can manage itself : package manager for plugins
	-- ================================================================================
	-- <<< 
	use 'wbthomason/packer.nvim' -- Package Manager
	-- >>> 

	-- mason:  https://github.com/williamboman/mason.nvim/ -- Package Manager
	-- ================================================================================
	-- <<< 
	use {
		'williamboman/mason.nvim',
		config = function()
			require("mason").setup()
		end,
	}
	-- >>> 

	-- mason-lsp:  https://github.com/williamboman/mason-lspconfig
	-- Package Manager for LSPs and other stuff, just LSPs for now
	-- ================================================================================
	-- <<< 
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
	-- >>> 

	-- nvim-lspconfig: https://github.com/neovim/nvim-lspconfig
	-- ================================================================================
	-- <<< 
	use {
		'neovim/nvim-lspconfig' , -- Config for Neovim LSP
		-- configurations in plugins-config dir
		config = function() 
			require("plugins-config.lsp")
		end,
	}
	-- >>> 

	-- mfussenegger/nvim-jdtls: https://github.com/mfussenegger/nvim-jdtls
	-- For jdtls intial setup 
	-- TODO: Setup other options
	-- ================================================================================
	-- <<< 
	use 'mfussenegger/nvim-jdtls'
	-- >>> 

	-- cmp-nvim : completion helpers
	-- https://github.com/hrsh7th/nvim-cmp 
	-- ================================================================================
	-- <<< 
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
	-- >>> 

	-- lspkind.nvim: https://github.com/onsails/lspkind.nvim
	-- ================================================================================
	-- <<< 
	 use 'onsails/lspkind.nvim'
	-- >>> 

	-- nvim-treesitter: https://github.com/nvim-treesitter/nvim-treesitter
	-- ================================================================================
	-- <<< 
	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('plugins-config.treesitter')
		end,
		run = ':TSUpdate',
	}
	-- >>> 

	-- kanagawa.nvim: https://github.com/rebelot/kanagawa.nvim
	-- ================================================================================
	-- <<< 
	use 'rebelot/kanagawa.nvim' -- Colorscheme Kanagawa
	-- >>> 

	--	lukas-reineke/indent-blankline.nvim: https://github.com/lukas-reineke/indent-blankline.nvim
	--	For indent highlights
	-- ================================================================================
	-- <<< 
	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function ()
			require('plugins-config.indent-blankline')
		end
	}
	-- >>> 

	-- neo-tree.nvim: https://github.com/nvim-neo-tree/neo-tree.nvim
	-- ================================================================================
	-- <<< 
	use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v3.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'MunifTanjim/nui.nvim',
		}
	}
	-- >>> 

	-- neo-tree.nvim: https://github.com/nvim-neo-tree/neo-tree.nvim
	-- ================================================================================
	-- <<< 
	use 'junegunn/vim-easy-align' -- Easy Align
	-- >>> 

	-- neo-tree.nvim: https://github.com/nvim-telescope/telescope.nvim
	-- ================================================================================
	-- <<< 
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
	}
	-- >>> 

	-- neo-tree.nvim: https://github.com/nvim-telescope/telescope.nvim
	-- ================================================================================
	-- <<< 
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
	}
	-- >>> 

	-- numToStr/Comment.nvim: https://github.com/numToStr/Comment.nvim
	-- ================================================================================
	-- <<< 
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
	-- >>> 

	-- nvim-lualine/lualine.nvim: https://github.com/nvim-lualine/lualine.nvim
	-- ================================================================================
	-- <<< 
	use {
		'nvim-lualine/lualine.nvim',
		config = function ()
			require('plugins-config.lualine')
		end,
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	-- >>> 
end)

-- vim: set foldmethod=marker foldmarker=<<<,>>> :
