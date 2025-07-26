return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {},
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
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{ "diff", colored = true, color = { bg = "NONE" } },
					{ "filetype", icon_only = false, icon = true, colored = false },
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
