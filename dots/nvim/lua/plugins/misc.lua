return {
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xd",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({
				vim.keymap.set("n", "<leader>xt", ":TodoTrouble<CR>", { desc = "View Todos (Trouble)" }),
			})
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	-- {
	-- 	"Bekaboo/dropbar.nvim",
	-- 	dependencies = {
	-- 		"nvim-telescope/telescope-fzf-native.nvim",
	-- 		build = "make",
	-- 	},
	-- 	config = function()
	-- 		local dropbar_api = require("dropbar.api")
	-- 		vim.keymap.set("n", "<leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
	-- 	end,
	-- },
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
	-- {
	-- 	"tribela/transparent.nvim",
	-- },
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
		vim.keymap.set("n", "<leader>tt", ":TailwindConcealToggle<CR>", { desc = "Tailwind Conceal Toggle" }),
	},
	{
		"laytan/cloak.nvim",
		config = function()
			require("cloak").setup({})
		end,
	},
	{
		{
			"folke/flash.nvim",
			event = "VeryLazy",
			---@type Flash.Config
			opts = {},
    -- stylua: ignore
            keys = {
              { "<leader>/", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
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
			vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Neo-Tree" }),
		},
	},
}
