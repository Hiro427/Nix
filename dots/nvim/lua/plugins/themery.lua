return {
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themes = {
					"gruvbox",
					"catppuccin",
					"nord",
					"nordic",
					"tokyonight-night",
					"github_dark_default",
					"onedark",
					"kanagawa-dragon",
					"rose-pine",
					"everforest",
					"onedark_dark",
					"monoglow-z",
				}, -- Your list of installed colorschemes.
				livePreview = true, -- Apply theme while picking. Default to true.
			})
		end,
		vim.keymap.set("n", "<leader>cs", ":Themery<CR>", { desc = "Change colorschemes" }),
	},
	{
		"wnkz/monoglow.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("monoglow").setup({
				transparent = true,
				glow = true,
				on_highlights = function(hl, c)
					local my_color = "none"
					hl.FloatBorder = {
						bg = my_color,
					}
					hl.String = {
						fg = "#87ccc6",
					}
					hl.Function = {
						fg = "#ffffff",
					}
				end,
			})
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
		config = function()
			require("onedarkpro").setup({
				options = {
					transparency = true,
				},
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						ndentscope_color = "",
					},
				},
			})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				transparent_mode = true,
				inverse = false,
			})
		end,
	},
	{ "shaunsingh/nord.nvim", priority = 1000 },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "main",
				dark_variant = "main",
				styles = {
					italic = true,
					bold = true,
					transparency = true,
				},
			})
		end,
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").load()
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({
				transparent = true,
				styles = {
					sidebars = "transparent",
				},
			})
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, --
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
			})
		end,
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				-- Your config here
				background = "hard",
				italics = true,
			})
		end,
	},
}
