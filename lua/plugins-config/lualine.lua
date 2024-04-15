local status, lualine = pcall( require, 'lualine')

if status then
	print("Found lualine, setting up")
else
	print("ERROR: lualine **Not Found** , skip configuration")
	return
end

lualine.setup {
	options = {
		icons_enabled = true,
		theme = 'ayu_dark',
		component_separators = { left = '|', right = '|'},
		section_separators = { left = '[', right = ']'},
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {
		lualine_a = {
			{
				'tabs',
				tab_max_length = 40,  -- Maximum width of each tab. The content will be shorten dynamically (example: apple/orange -> a/orange)
				max_length = vim.o.columns / 3, -- Maximum width of tabs component.
				mode = 2, -- 0: Shows tab_nr
				path = 0, -- 0: just shows the filename
				use_mode_colors = true,
			}
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {'filename'},
		lualine_y = {'branch'},
		lualine_z = {}

	},
	winbar = {
	},

	inactive_winbar = {
	},
	extensions = {}
}
