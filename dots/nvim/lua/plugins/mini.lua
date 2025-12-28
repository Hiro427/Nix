return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			-- require("mini.statusline").setup({})
			-- require("mini.cursorword").setup({})
			-- require("mini.indentscope").setup({ draw = { delay = 200 } })
			-- require("mini.snippets").setup({})
			-- require("mini.completion").setup({})
			require("mini.bracketed").setup({})
			require("mini.pairs").setup({})
			require("mini.surround").setup({})
			require("mini.diff").setup({})
			require("mini.git").setup({})
			require("mini.ai").setup({})
			require("mini.splitjoin").setup({})
			require("mini.extra").setup({})
			require("mini.icons").setup({})
			require("mini.jump").setup({})
			require("mini.files").setup({})
			-- require("mini.statusline").setup({})
			require("mini.tabline").setup({})
			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					-- -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					-- fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					-- hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					-- todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					-- note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

					-- Highlight hex color strings (`#rrggbb`) using that color
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
			-- NOTE: https://nvim-mini.org/mini.nvim/doc/mini-pick.html
			local pick_win_config = function()
				local height = math.floor(0.6 * vim.o.lines)
				-- local height = math.floor(0.618 * vim.o.lines)
				local width = math.floor(0.6 * vim.o.columns)
				return {
					anchor = "NW",
					height = height,
					width = width,
					row = math.floor(0.5 * (vim.o.lines - height)),
					col = math.floor(0.5 * (vim.o.columns - width)),
				}
			end
			require("mini.pick").setup({
				mappings = {
					move_down = "<Tab>",
					move_up = "<S-Tab>",
					toggle_info = "<C-k>",
					toggle_preview = "<C-p>",
				},
				-- source = {
				-- 	show = require("mini.pick").default_show,
				-- },
				window = { config = pick_win_config, border = "double" },
			})
			local jump2d = require("mini.jump2d")
			local jump_line_start = jump2d.builtin_opts.word_start
			jump2d.setup({
				spotter = jump_line_start.spotter,
				view = { dim = true, n_steps_ahead = 2 },
				silent = true,
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
		end,
	},
	-- vim.keymap.set("n", "<leader><space>", ":Pick files<CR>", { desc = "Find Files (mini)", silent = true }),
	-- vim.keymap.set("n", "<leader>fr", ":Pick oldfiles<CR>", { desc = "Find Recent Files (mini)", silent = true }),
	-- vim.keymap.set("n", "<leader>fm", ":Pick marks<CR>", { desc = "Find Marks (mini)", silent = true }),
	-- vim.keymap.set("n", "<leader>fc", ":Pick commands<CR>", { desc = "Find Commands (mini)", silent = true }),
	-- vim.keymap.set(
	-- 	"n",
	-- 	"<leader>fb",
	-- 	":Pick buffers include_current=false<CR>",
	-- 	{ desc = "Find Buffers (mini)", silent = true }
	-- 	--
	-- ),
	-- vim.keymap.set("n", "<leader>fd", ":Pick diagnostic<CR>", { desc = "Find Symbols (mini)", silent = true }),
	-- vim.keymap.set("n", "<leader>fk", ":Pick keymaps<CR>", { desc = "Find Symbols (mini)", silent = true }),
	-- vim.keymap.set(
	-- 	"n",
	-- 	"<leader>fq",
	-- 	":Pick list scope='quickfix'<CR>",
	-- 	{ desc = "Search Quickfix List (mini)", silent = true }
	-- ),
	-- vim.keymap.set("n", "<leader>fg", ":Pick grep_live<CR>", { desc = "Find Grep Match (mini)", silent = true }),
	-- vim.keymap.set(
	-- 	"n",
	-- 	"<leader>fl",
	-- 	":Pick buf_lines scope='current'<CR>",
	-- 	{ desc = "Find Lines (mini)", silent = true }
	-- ),
	-- vim.keymap.set(
	-- 	"n",
	-- 	"<leader>fs",
	-- 	":Pick lsp scope='document_symbol'<CR>",
	-- 	{ desc = "Find Symbols (mini)", silent = true }
	-- ),
	-- vim.keymap.set("n", "<leader>gb", ":Pick git_branches<CR>", { desc = "Find Git Branches (mini)", silent = true }),
	-- vim.keymap.set("n", "<leader>gc", ":Pick git_commits<CR>", { desc = "Find Git Commits (mini)", silent = true }),
	-- vim.keymap.set(
	-- 	"n",
	-- 	"<leader>fS",
	-- 	":Pick lsp scope='workspace_symbol'<CR>",
	-- 	{ desc = "Find Symbols (mini)", silent = true }
	-- ),

	-- vim.keymap.set("n", "<leader>ft", function()
	-- 	require("mini.pick").builtin.grep({
	-- 		pattern = "TODO|FIXME|HACK|NOTE",
	-- 		command = { "rg", "--no-heading", "--line-number", "--column" },
	-- 		prompt = "Find TODOs > ",
	-- 	})
	-- end, { desc = "Find TODO comments (mini)", silent = true }),

	vim.keymap.set("n", "<leader>e", ":lua MiniFiles.open()<CR>", { desc = "Toggle Mini Files", silent = true }),
}
