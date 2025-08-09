return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local harpoon_files = require("harpoon_files")
		local M = require("config.transparent_theme_ll")
		-- local function get_git_root()
		-- 	local git_root = vim.fn.fnamemodify(vim.fn.systemlist("git rev-parse --show-toplevel")[1], ":t")
		-- 	local git_branch = " " .. vim.fn.systemlist("git branch --show-current")[1]
		-- 	if vim.v.shell_error ~= 0 then
		-- 		return nil -- Not in a git repo
		-- 	end
		-- 	local res = git_root .. "" .. git_branch
		-- 	return res
		-- end
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
					{
						"branch",
					},
					-- {
					-- 	"branch",
					-- 	colored = false,
					-- 	icon_only = false,
					-- 	icon = false,
					-- 	color = { bg = "NONE" },
					-- },
				},
				lualine_b = {
					-- { "diff", symbols = { added = " ", modified = " ", removed = " " }, colored = false },
				},
				lualine_c = {
					"%=", --[[ add your center compoentnts here in place of this comment ]]
					{ harpoon_files.lualine_component },
					-- { "diagnostics" },
					-- { "diff" },
				},
				lualine_x = {},
				lualine_y = {
					{
						"diagnostics",
					},
					-- {
					-- 	"filename",
					-- 	symbols = {
					-- 		modified = "",
					-- 		readonly = "󰌾",
					-- 		unnamed = "󰄱",
					-- 		newfile = "",
					-- 	},
					-- },
				},
				lualine_z = { "filename" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = { "" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
