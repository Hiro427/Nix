return {
	{
		"kawre/neotab.nvim",
		event = "InsertEnter",
		opts = {
			-- configuration goes here
		},
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = { -- set to setup table
		},
		config = function()
			require("colorizer").setup({
				user_default_options = {
					tailwind = true,
					-- virtualtext_inline = true,
				},
			})
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		config = function()
			require("render-markdown").setup({})
		end,
	},
	{
		"NeogitOrg/neogit",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
		},
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
		},
	},
	{
		"laytan/cloak.nvim",
		config = function()
			require("cloak").setup({})
		end,
		-- vim.keymap.set("n", "<leader>", ":CloakToggle<CR>", { desc = "Toggle Cloak", silent = true }),
	},
}
