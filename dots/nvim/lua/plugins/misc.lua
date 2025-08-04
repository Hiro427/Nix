return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({})
		end,
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
		opts = { conceal = { enabled = true } }, -- your configuration
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
              { "<leader>/", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
                {"S", mode = {"n", "x", "o"}, function() require("flash").treesitter() end, desc = "Remote Flash"},
                {"r", mode = {"n", "x", "o"}, function() require("flash").remote() end, desc = "Remote Flash"},
                {"R", mode = { "x", "o"}, function() require("flash").treesitter_search() end, desc = "Remote Flash"},
            },
		},
	},
	{
		{
			"sphamba/smear-cursor.nvim",
			opts = {},
			config = function()
				require("smear_cursor").setup({})
			end,
		},
	},
	{
		{
			"karb94/neoscroll.nvim",
			opts = {},
			config = function()
				require("neoscroll").setup({})
			end,
		},
	},
	{
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
				-- Optional image support for file preview: See `# Preview Mode` for more information.
				-- {"3rd/image.nvim", opts = {}},
				-- OR use snacks.nvim's image module:
				-- "folke/snacks.nvim",
			},
			lazy = false, -- neo-tree will lazily load itself
			---@module "neo-tree"
			---@type neotree.Config?
			opts = {
				window = {
					width = 25,
					position = "left",
					winbar = false,
				},
				-- add options here
				filesystem = {
					filtered_items = {
						visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
						hide_dotfiles = false,
						hide_gitignored = true,
						never_show = { ".git", ".venv", "node_modules" },
					},
				},
			},
			vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Neo-Tree", silent = true }),
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
				show_icon = false,
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
