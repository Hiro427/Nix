return {
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "HiPhish/rainbow-delimiters.nvim" },
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you use standalone mini plugins
		---@module 'render-markdown'
		---@type render.md.UserConfig
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
	{
		"chomosuke/typst-preview.nvim",
		lazy = false, -- or ft = 'typst'
		version = "1.*",
		opts = {}, -- lazy.nvim will implicitly calls `setup {}`
		config = function()
			require("typst-preview").setup({
				dependencies_bin = {
					["tinymist"] = "/run/current-system/sw/bin/tinymist",
					["websocat"] = "/run/current-system/sw/bin/websocat",
				},
			})
		end,
		vim.keymap.set("n", "<leader>pt", ":TypstPreview<CR>", { desc = "Open Typst Preview" }),
	},
	{
		"abecodes/tabout.nvim",
		lazy = false,
		config = function()
			require("tabout").setup({
				completion = true, -- if the tabkey is used in a completion pum
				ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
			})
		end,
		dependencies = { "nvim-treesitter/nvim-treesitter" }, --optional
		opt = true, -- Set this to true if the plugin is optional
		event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
		priority = 1000,
	},
}
