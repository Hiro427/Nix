-- For `plugins/markview.lua` users.
return {
	"OXY2DEV/markview.nvim",
	lazy = false,

	config = function()
		require("markview.spec").setup({
			preview = {
				icon_provider = "devicons",
				enable = false,
			},
			typst = {
				enable = false,
			},
		})
	end,

	vim.keymap.set(
		"n",
		"<leader>ms",
		":Markview splitToggle<CR>",
		{ desc = "Toggle Split Doc Preview (yaml, markdown, latex, html)", silent = true }
	),

	vim.keymap.set(
		"n",
		"<leader>mt",
		":Markview Toggle<CR>",
		{ desc = "Toggle Doc Preview (yaml, markdown, latex, html)", silent = true }
	),
}
