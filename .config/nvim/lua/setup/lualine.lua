--  _                _ _                  _
-- | |   _   _  __ _| (_)_ __   ___      | |_   _  __ _
-- | |  | | | |/ _` | | | '_ \ / _ \     | | | | |/ _` |
-- | |__| |_| | (_| | | | | | |  __/  _  | | |_| | (_| |
-- |_____\__,_|\__,_|_|_|_| |_|\___| (_) |_|\__,_|\__,_|
--
local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
	return
end

lualine.setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = true
		},
	sections = {
		lualine_a = {'mode',
		function() if vim.o.spell then return 'SPELL' else return '' end end,
			function() if vim.o.paste then return 'PASTE' else return '' end end},
		lualine_b = {'branch', 'diff'},
		lualine_c = {'filename', 'diagnostics'},
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
	tabline = {},
	extensions = {}
}
