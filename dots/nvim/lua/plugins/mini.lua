return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.pairs").setup({})
			require("mini.surround").setup({})
			require("mini.cursorword").setup({})
			require("mini.diff").setup({})
			require("mini.git").setup({})
			require("mini.ai").setup({})
			-- require("mini.indentscope").setup({ draw = { delay = 200 } })
			require("mini.extra").setup({})
			-- Would like some more sources here, path and cmdline completions are a must for me.
			-- Otherwise this would be the ideal plugin for completions for my setup
			-- require("mini.snippets").setup({})
			-- require("mini.completion").setup({})
			-- require("mini.icons").setup({})
			require("mini.move").setup({
				mappings = {
					-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
					left = "<S-h>",
					right = "<S-l>",
					down = "<S-j>",
					up = "<S-k>",

					-- Move current line in Normal mode
					line_left = "<S-h>",
					line_right = "<S-l>",
					line_down = "<S-j>",
					line_up = "<S-k>",
				},
			})
		end,
	},
}
