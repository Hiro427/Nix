return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.indentscope").setup({ draw = { delay = 50 }, symbol = "│" })
			require("mini.pairs").setup()
			require("mini.ai").setup()
			require("mini.surround").setup()
			require("mini.diff").setup()
			require("mini.git").setup()
			require("mini.extra").setup()
			require("mini.icons").setup()
			-- require("mini.icons").tweak_lsp_kind()
			require("mini.bracketed").setup()
			require("mini.jump").setup()
			require("mini.tabline").setup()
			require("mini.move").setup({
				mappings = {
					left = "<S-h>",
					right = "<S-l>",
					down = "<S-j>",
					up = "<S-k>",

					-- Sove current line in Normal mode
					line_left = "<S-h>",
					line_right = "<S-l>",
					line_down = "<S-j>",
					line_up = "<S-k>",
				},
			})

			-- require("mini.cmdline").setup({
			-- 	autocomplete = { delay = 200 },
			-- })
			require("mini.files").setup({
				windows = {
					preview = true,
					width_preview = 50,
				},
			})

			-- require("mini.completion").setup({
			-- 	delay = { completion = 100 },
			-- })
			require("mini.notify").setup({ lsp_progress = { enable = true }, window = { winblend = 0 } })
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
