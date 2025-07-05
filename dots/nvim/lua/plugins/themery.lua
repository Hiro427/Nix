return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = {
				"gruvbox",
				"catppuccin",
				"nord",
				"nordic",
				"tokyonight-night",
				"github_dark_default",
				"onedark",
				"kanagawa-dragon",
				"rose-pine",
			}, -- Your list of installed colorschemes.
			livePreview = true, -- Apply theme while picking. Default to true.
		})
	end,
	vim.keymap.set("n", "<leader>cs", ":Themery<CR>", { desc = "Change colorschemes" }),
}
