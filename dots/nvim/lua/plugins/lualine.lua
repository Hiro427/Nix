return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local harpoon_files = require("harpoon_files")
		local M = require("config.transparent_theme_ll")
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = M.transparent_theme,
				component_separators = { left = "", right = "" },
				disabled_filetypes = {},
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					"mode",
				},
				lualine_b = {
					{
						"branch",
						colored = false,
						icon_only = false,
						icon = false,
						color = { bg = "NONE" },
					},
				},
				lualine_c = {
					"%=", --[[ add your center compoentnts here in place of this comment ]]
					{ harpoon_files.lualine_component },
				},
				lualine_x = {},
				lualine_y = { "diff" },
				lualine_z = {
					{
						"filename",
						symbols = {
							modified = "",
							readonly = "󰌾",
							unnamed = "󰄱",
							newfile = "",
						},
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = { "filetype" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
