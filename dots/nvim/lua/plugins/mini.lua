return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.pairs").setup({})
			require("mini.surround").setup({})
			require("mini.cursorword").setup({})
			require("mini.diff").setup({})
			require("mini.files").setup({})
			require("mini.git").setup({})
			require("mini.pick").setup({})
			require("mini.ai").setup({})
			require("mini.indentscope").setup({ draw = { delay = 100 } })
			require("mini.extra").setup({})
			-- Would like some more sources here, path and cmdline completions are a must for me.
			-- Otherwise this would be the ideal plugin for completions for my setup
			require("mini.snippets").setup({})
			require("mini.completion").setup({})
			require("mini.icons").setup({})
			require("mini.jump").setup({})
			require("mini.splitjoin").setup({})
			require("mini.jump2d").setup({ view = { dim = true, n_steps_ahead = 0 } })
			local miniclue = require("mini.clue")
			miniclue.setup({
				triggers = {
					-- Leader triggers
					{ mode = "n", keys = "<leader>" },
					{ mode = "x", keys = "<leader>" },
					-- `g` key
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },
					-- Marks
					{ mode = "n", keys = "'" },
					{ mode = "x", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "`" },
					--Square-Brackets
					{ mode = "n", keys = "]" },
					{ mode = "x", keys = "[" },
					-- Registers
					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },
					{ mode = "n", keys = "m", desc = "Set mark" },
				},
				window = { delay = 200 },
				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.square_brackets(),
				},
			})
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
			local visits = require("mini.visits")
			visits.setup({})
			vim.keymap.set("n", "<leader>va", visits.add_path, { desc = "Add Visit (mini)" })
			vim.keymap.set("n", "<leader>vr", visits.remove_path, { desc = "Remove Visit (mini)" })
			vim.keymap.set("n", "<leader>vl", ":Pick visit_paths<CR>", { desc = "List Visits (mini)", silent = true })

			require("mini.bracketed").setup({})
			local hipatterns = require("mini.hipatterns")

			hipatterns.setup({
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "FIXME", group = "MiniHipatternsFixme" },
					hack = { pattern = "HACK", group = "MiniHipatternsHack" },
					todo = { pattern = "TODO", group = "MiniHipatternsTodo" },
					note = { pattern = "NOTE", group = "MiniHipatternsNote" },
				},
			})
			require("mini.starter").setup({
				header = [[
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣠⡤⢶⣶⠖⢲⣶⠀⠀⠀⠀⠀⠀⠀⠀⣼⠋⠉⠉⢹⣷⠖⣶⠖⣶⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡤⠶⠚⠋⠉⢹⣿⡏⡀⣼⡇⠀⣿⡏⠀⠀⠀⠀⠀⠀⠀⢰⠇⠀⠀⢠⣿⣿⣴⣿⣤⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⢰⠏⠁⠀⠀⠀⠀⢐⣿⣿⣀⣰⣿⣶⣾⣿⣥⠤⠴⠖⠒⠒⠚⣿⡿⠶⠿⠿⣿⣿⠋⠉⠉⣿⣏⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⢀⡟⠀⠀⠀⣀⣠⣴⣾⣿⠿⠛⠛⠋⢹⡿⠀⠀⠀⠀⠀⠀⠀⢰⣿⠁⠀⠀⢰⣿⠇⠀⠀⢸⡿⠀⠀⠀⠀⠀⠉⢹⣿⠀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⣼⣁⣤⣶⣿⠿⠟⢻⣿⡟⠀⠀⠀⢀⣿⣁⣀⣤⣴⡶⠀⠀⠀⣾⣇⣀⣀⣤⣾⡟⠀⠀⢀⣿⠷⠶⠶⠶⠆⠀⠀⣾⡿⠋⠁⠀⢀⠉⠑⢦⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⢠⡿⠟⠋⠁⠀⠀⠀⣾⣿⠁⠀⠀⠀⣼⠟⠛⠉⠉⠀⠀⠀⠀⣸⣿⠿⠿⠿⠛⠋⠀⠀⠀⣸⣯⣤⣤⣀⡀⠀⠀⢰⡏⠀⣼⠏⠀⣾⣧⠀⠈⣇⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⡟⠀⠀⠀⠀⠀⠀⢰⣿⠇⠀⠀⠀⢰⡟⠀⣀⣀⣤⠀⠀⠀⢀⡿⠁⠀⠀⠀⠀⠀⠀⠀⣰⡿⠁⠀⠈⠉⠀⠀⢀⣿⡄⠀⠋⢀⣾⠟⠁⠀⣰⡟⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⣸⠁⠀⠀⠀⣀⣤⣶⣿⡏⠀⠀⠀⠀⣾⠿⠛⠛⠉⠁⠀⠀⢀⣾⠇⠀⢀⣀⣀⣀⣀⣤⣾⣿⣇⣀⣀⣀⣠⣤⣴⡿⣏⣻⣦⣴⣿⣷⣀⣠⣴⣿⣁⣀⣠⣤⣀⠀⠀⠀
        ⠀⠀⠀⠀⢠⠇⣀⣴⣶⣿⣿⠿⠛⠉⠀⠀⠀⠀⣼⠇⠀⠀⠀⠀⢀⣠⣴⣿⣿⣩⠭⠭⠖⠲⣬⣭⢡⣶⢰⢿⣧⣶⣰⢿⡏⠁⢠⡟⡽⣭⣭⣭⣭⡽⢭⣽⢿⣿⣍⣵⣶⣜⢷⣄⠀
        ⠀⠀⠀⠀⠾⢿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⢀⣼⡿⢀⣠⣤⣶⡾⠿⠛⠉⣿⡕⣿⣣⡴⠲⣼⣿⣵⣟⣳⣶⣿⣿⣿⡟⣾⣥⣤⣿⣸⠁⣿⣷⣶⡗⢠⣿⣿⣿⣯⣋⠾⣽⣾⣗⣽⠇
        ⠀⠀⠀⣴⠞⠉⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⡿⠛⠻⠟⠛⠉⠀⠀⠀⠀⣼⠇⣿⣿⣿⣿⡟⢻⢿⣿⣿⣿⣿⣿⡿⣿⣴⣷⣌⣛⣣⠿⢿⣿⣿⡿⢿⣿⣟⣽⣿⣷⡿⣞⣿⣇⡾⠁⠀
        ⠀⠀⢠⠇⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣸⢿⣻⣹⣿⢃⡏⢸⠛⡿⣻⣭⢹⣿⢋⣿⣋⣿⣟⡟⢠⣿⣿⣿⠃⡾⡿⣿⣿⣿⣿⢣⣿⡟⣼⠃⠀⠀
        ⠀⠀⡟⠀⠀⠀⠀⠀⣀⣴⣾⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡾⣣⡿⠿⣿⣻⡏⣾⣟⣩⣴⣇⡽⣷⠿⣷⣿⣾⣿⡞⡿⠁⣾⣿⣿⠏⣸⣽⣧⣿⡿⣞⡿⣎⢣⣻⡇⠀⠀⠀
        ⠀⣸⠀⠀⠀⣀⣴⣾⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣟⣽⠷⣖⣒⣒⡲⢼⣛⣯⣷⣘⣿⣯⣵⠧⠽⣦⣭⣿⣙⣓⣚⣿⣿⣓⣒⣋⣛⣃⣘⣻⡽⢾⣝⠾⣽⠃⠀⠀⠀
        ⢠⠇⣀⣴⣾⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣯⡼⠞⠛⠉⠁⠉⠙⠷⠟⠀⠘⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠙⠿⠏⠀⠀⠀⠀
        ⣼⣾⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
]],
				-- items = {
				-- 	{ name = "󰒲 lazy", action = "Lazy", section = "Actions" },
				-- },
				items = { require("mini.starter").sections.recent_files(5, false, true) },
				footer = [[
Whatever you do, enjoy it to the fullest. That is the secret of life. 
                        - Rider (Fate/Zero)
                ]],
			})
			require("mini.notify").setup({ window = { config = { border = "rounded", zindex = 200 }, winblend = 0 } })
		end,
	},
	vim.keymap.set("n", "<leader><space>", ":Pick files<CR>", { desc = "Find Files (mini)", silent = true }),
	vim.keymap.set("n", "<leader>ff", ":Pick oldfiles<CR>", { desc = "Find Recent Files (mini)", silent = true }),
	vim.keymap.set("n", "<leader>fm", ":Pick marks<CR>", { desc = "Find Marks (mini)", silent = true }),
	vim.keymap.set("n", "<leader>fc", ":Pick commands<CR>", { desc = "Find Commands (mini)", silent = true }),
	vim.keymap.set("n", "<leader>fb", ":Pick buffers<CR>", { desc = "Find Buffers (mini)", silent = true }),
	vim.keymap.set(
		"n",
		"<leader>fl",
		":Pick buf_lines scope='current'<CR>",
		{ desc = "Find Lines (mini)", silent = true }
	),
	vim.keymap.set("n", "<leader>fg", ":Pick grep<CR>", { desc = "Grep (mini)", silent = true }),
	vim.keymap.set(
		"n",
		"<leader>fs",
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
	vim.keymap.set("n", "<leader>e", function()
		MiniFiles.open()
	end, { desc = "Mini Files", silent = true }),
	vim.keymap.set("n", "<leader>ft", function()
		require("mini.pick").builtin.grep({
			pattern = "TODO|FIXME|HACK|NOTE",
			command = { "rg", "--no-heading", "--line-number", "--column" },
			prompt = "Find TODOs > ",
		})
	end, { desc = "Find TODO comments (mini)", silent = true }),
}
