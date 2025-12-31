return {
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "HiPhish/rainbow-delimiters.nvim", lazy = true, event = "BufEnter" },
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach", -- Or `LspAttach` `VeryLazy`
		priority = 1000, -- needs to be loaded in first
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "amongus",
				options = { show_source = true, throttle = 20, enable_on_insert = true, multilines = true },
				overflow = { mode = "wrap" },
				break_line = { enabled = true, after = 20 },
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
}
