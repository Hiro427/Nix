return {
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	{ "christoomey/vim-tmux-navigator" },
	{
		"fredrikaverpil/godoc.nvim",
		version = "*",
		build = "go install github.com/lotusirous/gostdsym/stdsym@latest", -- optional
		cmd = { "GoDoc" }, -- optional
		opts = { window = { type = "vsplit" }, picker = { type = "mini" } }, -- see further down below for configuration
		vim.keymap.set("n", "<leader>gd", ":GoDoc<CR>", { desc = "Search Go Documentation" }),
	},

	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"neovim/nvim-lspconfig", -- optional
		},
		opts = {}, -- your configuration
		vim.keymap.set(
			"n",
			"<leader>tt",
			":TailwindConcealToggle<CR>",
			{ desc = "Tailwind Conceal Toggle", silent = true }
		),
	},
	{
		"laytan/cloak.nvim",
		config = function()
			require("cloak").setup({})
		end,
		vim.keymap.set("n", "<leader>ct", ":CloakToggle<CR>", { desc = "Toggle Cloak", silent = true }),
	},

	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				extra_groups = { "FloatBorder", "NormalFloat", "Float", "WhichKeyNormal", "MiniNotifyNormal" },
			})
		end,
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
		vim.keymap.set("n", "<leader>tp", ":TypstPreview<CR>", { desc = "Open Typst Preview" }),
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
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
		},
		keys = {
			{ "<leader>yt", mode = { "n", "v" }, "<cmd>Yazi<cr>", desc = "Open yazi at the current file" },
			{ "<leader>yr", "<cmd>Yazi toggle<cr>", desc = "Resume the last yazi session" },
		},
		opts = {},
	},
}
