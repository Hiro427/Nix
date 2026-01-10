return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			-- require("mini.statusline").setup({})
			-- require("mini.cursorword").setup({})
			require("mini.indentscope").setup({ draw = { delay = 50 }, symbol = "│" })
			require("mini.pairs").setup()
			require("mini.splitjoin").setup()
			require("mini.surround").setup()
			require("mini.diff").setup()
			require("mini.git").setup()
			require("mini.move").setup()
			require("mini.extra").setup()
			require("mini.icons").setup()
			require("mini.icons").tweak_lsp_kind()
			require("mini.bracketed").setup()
			require("mini.jump").setup()
			require("mini.files").setup()
			require("mini.tabline").setup()
			require("mini.cmdline").setup({
				delay = { completion = 350 },
			})

			require("mini.completion").setup({
				delay = { completion = 275 },
			})
			require("mini.notify").setup({ lsp_progress = { enable = false }, window = { winblend = 0 } })
			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					-- -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					bug = { pattern = "%f[%w]()BUG()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

					-- Highlight hex color strings (`#rrggbb`) using that color
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
			require("mini.pick").setup({
				mappings = {
					move_down = "<Tab>",
					move_up = "<S-Tab>",
					toggle_info = "<C-k>",
					toggle_preview = "<C-p>",
				},
			})
			local jump2d = require("mini.jump2d")
			jump2d.setup({
				spotter = jump2d.builtin_opts.word_start.spotter,
				view = { dim = true, n_steps_ahead = 2 },
				silent = true,
			})

			require("mini.starter").setup({
				header = [[
⠀⠀⡠⠤⡤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⣤⡤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⠤⢤⡀
⢠⠒⠀⠀⡟⠒⠓⠓⠚⠒⠓⢓⣚⣒⠓⠓⠚⠒⠓⠓⠚⡇⠀⠛⢶⠓⠓⠚⠒⠓⠓⠚⠒⠓⠓⠚⠒⠓⠓⠚⠒⠓⠓⠚⠒⠓⠓⠚⠒⠓⠓⠚⠒⠓⠓⠚⠒⠓⠓⠚⠒⠓⠓⠚⠒⠓⠓⠚⠒⠓⠓⠚⠒⠓⠓⠚⠒⠓⠓⠃
⠘⠤⠤⡀⠈⠢⣀⢤⠲⡩⡙⢔⠡⡊⢜⢩⢒⠤⡀⡠⠊⢀⠤⡤⡜⡲⡆⡖⢖⠲⠶⡒⢖⠲⡒⢖⠲⣲⠀⠀⢢⡂⢆⢂⡒⢆⢄⠀⠀⣀⣴⡲⣄⠐⡖⢖⠲⡒⢖⠲⡒⡆⢀⡠⡲⢒⠖⡤⡀⠀⠀⠀⠀⢀⡠⡄⣟⡭⠂⠀
⠀⠀⠀⠈⢳⢔⠕⡅⢕⢌⡜⠴⠥⠧⢕⡔⢅⢣⠩⡳⡴⠋⠀⡗⡌⡢⣃⢏⢢⢹⠀⣇⢣⢱⠜⠂⠓⠾⠀⠀⢸⢌⢪⠐⠪⡢⢍⡆⠀⠑⢗⡯⠃⠀⢨⠢⡃⡺⠂⠑⠪⣇⢎⠎⡌⣆⢕⠜⡸⡀⠀⢠⢔⢕⠕⠊⠀⠁⠀⠀
⠀⠀⠀⢠⢇⢣⢱⡸⠚⠡⠨⠨⢐⢁⢂⢊⠱⢅⢇⠪⡪⢆⠀⣇⢇⢪⢸⢘⢔⢹⠀⡧⣑⡎⠀⠀⠀⠀⠀⠀⢸⢸⢘⠀⠀⡏⡆⡇⣠⣲⢽⣺⣲⢄⢸⡑⢽⠀⠀⠀⠀⢸⢸⢨⠚⠀⢡⢣⠪⡇⡴⡱⡡⠋⠀⠀⠀⠀⠀⠀
⠀⠀⢀⡳⡑⣅⣳⣵⣳⣗⣷⡺⠖⠶⣖⣶⣖⣷⣳⢱⢑⢍⡆⡧⡣⡱⡡⡣⡱⣹⠀⣗⢅⡇⠀⠀⡀⠀⠀⠀⢸⡱⡱⠀⠀⣏⢎⣧⢷⢹⣳⣳⠝⡽⣼⢪⢹⠀⠀⢀⠀⢸⡱⡸⡀⠀⣮⣱⣑⡷⡕⢬⠃⢀⣀⠀⣀⡀⠀⠀
⠀⣀⡼⢚⢊⢉⠥⠔⠐⠒⠒⠒⠓⠓⠒⠒⠒⠂⠬⡍⠅⡓⣥⣗⢕⢅⢇⢇⢇⢾⠀⣗⢕⢧⢔⠮⡇⠀⠀⠀⢸⡪⡪⠀⠀⡧⡣⡏⢗⣞⣞⢾⢵⡫⢸⢕⢽⢄⢖⢽⠀⢸⡪⡪⡂⠀⠀⠀⠀⡧⡣⡛⡄⡜⡺⣚⢼⣜⡄⠀
⠀⠀⢸⢝⢝⢽⠀⢀⣶⣿⣷⡄⠀⢠⣶⣿⣶⡄⠀⣟⢝⢕⡝⣗⢕⡕⣕⢕⢕⢽⠀⣗⢕⡇⠉⠙⠇⠀⠀⠀⢸⡪⣪⠀⢀⢯⢪⠇⢸⣺⣺⢽⢽⡂⢸⢕⢽⠈⠑⢻⠀⢸⡪⡪⡂⠀⣀⣀⣀⢩⡪⣺⠉⠹⠽⢯⣷⡗⠁⠀
⠀⠀⠘⣕⢇⢗⢇⠸⣿⣿⣿⡏⠀⠸⣿⣿⣿⠇⣰⢕⡕⣧⠇⡷⡱⡕⣕⢵⢹⢺⠀⡷⡱⡇⠀⠀⠀⠀⠀⠀⢸⢎⡎⣏⣧⡳⠋⠀⠀⣗⣗⡯⣯⠀⢸⡕⣽⠀⠀⠀⠀⢸⢎⢮⡃⠀⠩⣎⢮⡝⡮⣚⠆⠀⠈⡯⣯⣺⢆⠀
⠀⠀⠀⠱⣫⢎⢗⡳⣌⠉⠁⠀⣿⠆⠈⠉⣁⡴⡳⡱⣕⠍⠀⡿⣸⣪⡾⡸⣕⢽⠀⡿⣸⣣⠀⠀⠀⢀⠀⠀⢸⣣⡫⠂⠀⠀⠀⠀⠈⢸⢮⣻⡊⠁⢸⡺⡺⡀⠀⠀⠀⣸⣣⢳⣣⣀⣞⢼⢸⡇⠘⢵⡫⣆⠀⡼⣝⠳⠝⠂
⠀⠀⠀⢀⠜⢷⣝⢎⣗⡽⣲⣂⠤⣔⣖⣫⡳⡵⣹⡹⠚⢤⡀⡯⡪⣾⢸⢕⡗⣽⠀⣿⡸⣜⢵⡲⣖⢿⠀⠀⢸⣎⢮⠀⠀⠀⠀⠀⠀⠈⡯⣞⠁⠀⢸⡣⡯⣺⢲⣲⢺⡏⢮⢧⢳⢕⡵⡝⡾⠀⠀⠀⠙⢮⡳⡽⡜⡀⠀⠀
⠐⠉⠑⠁⡠⠊⣈⣗⡯⣾⠿⠽⠤⠴⠝⢪⣟⢾⣍⡈⠢⡀⠼⠷⢽⠮⠆⠿⠼⠵⢾⢵⡧⣷⡷⠝⠘⠙⠀⠀⠋⠚⠘⠑⡠⡤⣤⣀⠖⠙⠉⠉⠳⠴⠷⠽⠾⡮⡷⡵⣗⠃⠀⠙⠱⠷⠕⠋⠁⠀⠀⠀⢀⣔⣏⠞⠻⠽⠂⠀
⠈⠒⡀⢀⣿⡫⣗⠷⠿⠽⠶⠤⠀⠠⠴⠯⠿⠽⠮⢞⡽⣳⢤⡶⣾⢽⠯⠿⠽⠯⠿⠽⠾⠵⣫⡻⣻⢽⡯⣿⠽⠯⠿⠽⠯⠿⠮⢞⢽⢿⢽⢯⢿⠽⠯⠿⠽⠯⠿⠾⢵⢝⡿⣽⠯⠿⠽⠯⠿⠽⢯⡿⣻⡪⠾⠽⠯⠿⠽⠇
⠀⠀⠘⢻⣇⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⠓⠧⠗⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠚⠮⠧⠋⠀⠀⠀⠀⠀⠀⠀⠀⠉⠚⠮⠧⠋⠀⠀⠀⠀⠀⠀⠀⠀⠑⠻⢎⡯⡖⣖⢖⣖⢾⣣⠧⠋⠀⠀⠀⠀⠀⠀⠀
                ]],
				footer = [[]],
			})
		end,
	},
}
