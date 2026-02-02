return {
	{
		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
			config = function()
				require("catppuccin").setup({
					flavour = "mocha", -- latte, frappe, macchiato, mocha
					background = { -- :h background
						light = "latte",
						dark = "mocha",
					},
					transparent_background = false, -- disables setting the background color.
					float = {
						transparent = true, -- enable transparent floating windows
					},
					default_integrations = true,
					auto_integrations = true,
					integrations = {
						mini = {
							enabled = true,
							indentscope_color = "",
						},
						-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
					},
				})
			end,
		},
	},
	-- setup must be called before loading
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
				transparent_mode = true,
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
