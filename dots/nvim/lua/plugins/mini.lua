return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.files").setup({
				windows = {
					preview = true, -- Show preview window
					width_focus = 30,
					width_nofocus = 20,
					width_preview = 60,
				},
			})
			local Path = require("plenary.path")
			-- local json = "/home/jacobrambarran/.config/stylix/palette.json" -- or use vim.fn.expand("~/.config/stylix/palette.json")
			local json = vim.fn.expand("~/.config/stylix/palette.json")
			local palette = vim.fn.json_decode(Path:new(json):read())

			-- Add '#' to each color
			for k, v in pairs(palette) do
				if k:match("^base") and not v:match("^#") then
					palette[k] = "#" .. v
				end
			end

			require("mini.base16").setup({ palette = palette })

			require("mini.base16").setup({ palette = palette })

			require("mini.pairs").setup({})
			require("mini.surround").setup({})
			require("mini.cursorword").setup({})
			require("mini.diff").setup({})
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
			require("mini.ai").setup({})
			require("mini.statusline").setup({})
			-- Would like some more sources here, path and cmdline completions are a must for me.
			-- Otherwise this would be the ideal plugin for completions for my setup
			-- require("mini.snippets").setup({})
			-- require("mini.completion").setup({})
			require("mini.icons").setup({})
			vim.keymap.set("n", "<leader>e", MiniFiles.open, { desc = "Open MiniFiles" })
		end,
	},
}
