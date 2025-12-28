return {
	{
		{
			"AlexvZyl/nordic.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				require("nordic").setup({
					bold_keywords = true,
					transparent = {
						-- Enable transparent background.
						bg = true,
						-- Enable transparent background for floating windows.
						float = true,
					},
					telescope = {
						style = "classic", -- options: 'classic' || 'flat'
					},
				})
			end,
		},
	},

	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				transparent_mode = false,
				inverse = false,
			})
		end,
	},

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
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({
				on_colors = function() end,
				transparent = true,
			})
		end,
	},
}
