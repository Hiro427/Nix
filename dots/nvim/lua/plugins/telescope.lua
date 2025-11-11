return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
	config = function()
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-f>"] = require("telescope.actions.layout").toggle_preview,
						["<C-e>"] = { "<esc>", type = "command" },
						["<esc>"] = require("telescope.actions").close,
						["<Tab>"] = require("telescope.actions").move_selection_next,
						["<S-Tab>"] = require("telescope.actions").move_selection_previous,
						["<C-l>"] = require("telescope.actions").toggle_selection,
					},
					n = {
						["<C-f>"] = require("telescope.actions.layout").toggle_preview,
						["<C-e>"] = { "<esc>", type = "command" },
						["<esc>"] = require("telescope.actions").close,
						["<Tab>"] = require("telescope.actions").move_selection_next,
						["<S-Tab>"] = require("telescope.actions").move_selection_previous,
						["<C-l>"] = require("telescope.actions").toggle_selection,
					},
				},
				preview = {
					hide_on_startup = true, -- hide previewer when picker starts
				},
			},
			pickers = {
				git_branches = {
					theme = "dropdown",
				},
				marks = {
					theme = "dropdown",
				},
				current_buffer_fuzzy_find = {
					theme = "dropdown",
				},
				commands = {
					theme = "dropdown",
				},
				lsp_document_symbols = {
					theme = "dropdown",
				},
				lsp_dynamic_workspace_symbols = {
					theme = "dropdown",
				},
				keymaps = {
					theme = "dropdown",
				},
				buffers = {
					theme = "dropdown",
				},
				oldfiles = {
					disable_devicons = true,
					theme = "dropdown",
					previewer = true,
				},
				find_files = {
					disable_devicons = true,
					theme = "ivy",
					previewer = true,
				},
			},
			extensions = {
				fzf = {},
			},
			require("telescope").load_extension("fzf"),
		})
	end,
	vim.keymap.set("n", "<leader>ft", ":TodoTelescope theme=dropdown<CR>", { desc = "Todo Telescope", silent = true }),

	vim.keymap.set(
		"n",
		"<leader><space>",
		require("telescope.builtin").find_files,
		{ desc = "Find Files (telescope)", silent = true }
	),
	vim.keymap.set(
		"n",
		"<leader>ff",
		require("telescope.builtin").oldfiles,
		{ desc = "Find Recent Files (telescope)", silent = true }
	),
	vim.keymap.set(
		"n",
		"<leader>fm",
		require("telescope.builtin").marks,
		{ desc = "Find Marks (telescope)", silent = true }
	),
	vim.keymap.set(
		"n",
		"<leader>fc",
		require("telescope.builtin").commands,
		{ desc = "Find Commands (telescope)", silent = true }
	),
	vim.keymap.set(
		"n",
		"<leader>fb",
		require("telescope.builtin").buffers,
		{ desc = "Find Buffers (telescope)", silent = true }
	),
	vim.keymap.set(
		"n",
		"<leader>fl",
		require("telescope.builtin").current_buffer_fuzzy_find,
		{ desc = "Find Lines (telescope)", silent = true }
	),
	vim.keymap.set(
		"n",
		"<leader>fg",
		require("telescope.builtin").live_grep,
		{ desc = "Grep (telescope)", silent = true }
	),
	vim.keymap.set(
		"n",
		"<leader>fs",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "Find Symbols (telescope)", silent = true }
	),
	vim.keymap.set(
		"n",
		"<leader>fS",
		require("telescope.builtin").lsp_dynamic_workspace_symbols,
		{ desc = "Find Symbols (telescope)", silent = true }
	),
	vim.keymap.set(
		"n",
		"<leader>fd",
		require("telescope.builtin").diagnostics,
		{ desc = "Find Symbols (telescope)", silent = true }
	),
	vim.keymap.set(
		"n",
		"<leader>fk",
		require("telescope.builtin").keymaps,
		{ desc = "Find Symbols (telescope)", silent = true }
	),
}
