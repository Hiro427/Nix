return {
	-- Minimal configuration
	{
		"David-Kunz/gen.nvim",
		config = function()
			require("gen").setup({
				show_model = true,
				display_mode = "vertical-split",
				show_prompt = true,
			})
			vim.keymap.set({ "n", "v" }, "<leader>gc", ":Gen Chat<CR>", { desc = "start Gen Chat" })
			vim.keymap.set({ "n", "v" }, "<leader>ga", ":Gen Ask<CR>", { desc = "Ask Gen" })
			vim.keymap.set({ "n", "v" }, "<leader>gm", ":Gen<CR>", { desc = "Gen Menu" })
		end,
	},
}
