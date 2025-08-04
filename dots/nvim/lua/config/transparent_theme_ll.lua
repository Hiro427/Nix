local M = {}

local colors = {
	fg = "#a0a0a0", -- off-white for text and icons
	bg = "none", -- transparent background
	inactive_fg = "#a0a0a0", -- slightly dimmed for inactive sections
}

M.transparent_theme = {
	normal = {
		a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.fg, bg = colors.bg },
	},
	insert = {
		a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
	},
	visual = {
		c = { fg = colors.fg, bg = colors.bg },
		a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
	},
	replace = {
		a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.fg, bg = colors.bg },
	},
	command = {
		a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.fg, bg = colors.bg },
	},
	inactive = {
		a = { fg = colors.inactive_fg, bg = colors.bg },
		b = { fg = colors.inactive_fg, bg = colors.bg },
		c = { fg = colors.inactive_fg, bg = colors.bg },
	},
}

return M
