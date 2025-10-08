return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({})
		end,
	},
	{
		"fredrikaverpil/godoc.nvim",
		version = "*",
		dependencies = {
			{ "folke/snacks.nvim" }, -- optional
		},
		build = "go install github.com/lotusirous/gostdsym/stdsym@latest", -- optional
		cmd = { "GoDoc" }, -- optional
		opts = {
			window = {
				type = "vsplit",
			},
			picker = {
				type = "snacks",
			},
		}, -- see further down below for configuration
		vim.keymap.set("n", "<leader>gd", ":GoDoc<CR>", { desc = "Search Go Documentation" }),
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	-- tailwind-tools.lua
	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
			"neovim/nvim-lspconfig", -- optional
		},
		-- opts = { conceal = { enabled = true } }, -- your configuration
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
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
