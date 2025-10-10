return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
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
			require("mini.pick").setup({})
			require("mini.ai").setup({})
			require("mini.extra").setup({})
			-- Would like some more sources here, path and cmdline completions are a must for me.
			-- Otherwise this would be the ideal plugin for completions for my setup
			-- require("mini.snippets").setup({})
			-- require("mini.completion").setup({})
			require("mini.icons").setup({})
			require("mini.jump").setup({})
			require("mini.jump2d").setup({})
		end,
	},
	vim.keymap.set("n", "<leader><space>", ":Pick files<CR>", { desc = "Find Files (mini)", silent = true }),
	vim.keymap.set("n", "<leader>ff", ":Pick oldfiles<CR>", { desc = "Find Recent Files (mini)", silent = true }),
	vim.keymap.set("n", "<leader>fm", ":Pick marks<CR>", { desc = "Find Marks (mini)", silent = true }),
	vim.keymap.set("n", "<leader>fc", ":Pick commands<CR>", { desc = "Find Commands (mini)", silent = true }),
	vim.keymap.set("n", "<leader>fb", ":Pick buffers<CR>", { desc = "Find Buffers (mini)", silent = true }),
	vim.keymap.set("n", "<leader>fl", ":Pick buf_lines<CR>", { desc = "Find Lines (mini)", silent = true }),
	vim.keymap.set(
		"n",
		"<leader>fs"
		":Pick lsp scope='document_symbol'<CR>",
		{ desc = "Find Symbols (mini)", silent = true }
	),
	vim.keymap.set(
		"n",
		"<leader>fS",
		":Pick lsp scope='workspace_symbol'<CR>",
		{ desc = "Find Symbols (mini)", silent = true }
	),
	vim.keymap.set("n", "<leader>fd", ":Pick diagnostic<CR>", { desc = "Find Symbols (mini)", silent = true }),
	vim.keymap.set("n", "<leader>fk", ":Pick keymaps<CR>", { desc = "Find Symbols (mini)", silent = true }),
	vim.keymap.set("n", "<leader>ft", function()
		require("mini.pick").builtin.grep({
			pattern = "TODO|FIXME|HACK|NOTE",
			command = { "rg", "--no-heading", "--line-number", "--column", "--color=never" },
			prompt = "Find TODOs > ",
		})
	end, { desc = "Find TODO comments (mini)", silent = true }),
}
