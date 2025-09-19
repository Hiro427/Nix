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
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = true })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
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
		{
			"folke/flash.nvim",
			event = "VeryLazy",
			---@type Flash.Config
			opts = {
				modes = {
					search = {
						enabled = true,
					},
					char = {
						jump_labels = true,
					},
				},
			},
    -- stylua: ignore
            keys = {
              { "<leader>//", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Jump (Flash)" },
                {"<leader>/t", mode = {"n", "x", "o"}, function() require("flash").treesitter() end, desc = "Treesitter (Flash)"},
                {"<leader>/r", mode = {"n", "x", "o"}, function() require("flash").remote() end, desc = "Remote (Flash)"},
                {"<leader>/s", mode = { "x", "o"}, function() require("flash").treesitter_search() end, desc = "Treesitter Search (Flash)"},
                {"<c-f>", mode = {"c"}, function() require("flash").toggle() end, desc = "Toggle Flash Search"},
            },
		},
	},
	{
		{
			"kiennt63/harpoon-files.nvim",
			dependencies = {
				{ "ThePrimeagen/harpoon", branch = "harpoon2" },
			},
			opts = {
				icon = "󱡅",
				show_icon = true,
				show_index = false,
			},
		},
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
