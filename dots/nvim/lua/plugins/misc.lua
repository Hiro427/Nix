return {
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "HiPhish/rainbow-delimiters.nvim" },
	{
		"leath-dub/snipe.nvim",
		keys = {
			{
				"<leader>l",
				function()
					require("snipe").open_buffer_menu()
				end,
				desc = "Open Snipe buffer menu",
			},
		},
		opts = {
			ui = { position = "cursor" },
			-- vsplit = V, split = H, close = D
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				view = { width = 26, signcolumn = "no" },
			})
		end,
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Neotree", silent = true }),
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
		-- lazy.nvim
		{
			"chrisgrieser/nvim-origami",
			event = "VeryLazy",
			opts = {}, -- needed even when using default config

			-- recommended: disable vim's auto-folding
			init = function()
				vim.opt.foldlevel = 99
				vim.opt.foldlevelstart = 99
			end,
			config = function()
				require("origami").setup({
					foldKeymaps = { setup = false },
					autoFold = { enabled = false },
					foldtext = { lineCount = { template = " %d lines", hlgroup = "SpecialComment" } },
				})
			end,
		},
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
