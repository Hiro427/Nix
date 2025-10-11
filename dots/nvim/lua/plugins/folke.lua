return {
	-- Lua
	{
		"folke/zen-mode.nvim",
		vim.keymap.set("n", "<leader>zm", ":ZenMode<CR>", { desc = "Start Zen Mode", silent = true }),
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
		},
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
}
