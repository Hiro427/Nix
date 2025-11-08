return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			statuscolumn = {
				enabled = true,
			},
			notifier = {
				enabled = true,
				timeout = 2000,
				border = "rounded",
				width = { min = 20, max = 0.4 },
			},
			-- terminal = { enabled = true, win = { style = "terminal" }, show_cwd = false },
			dashboard = {
				enabled = true,
				width = 35,
				formats = {},
				header = { "%s", align = "center" },

				preset = {
					-- 					header = [[
					--
					--   ⠤⣤⣤⣤⣄⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣠⣤⠤⠤⠴⠶⠶⠶⠶
					--   ⢠⣤⣤⡄⣤⣤⣤⠄⣀⠉⣉⣙⠒⠤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠴⠘⣉⢡⣤⡤⠐⣶⡆⢶⠀⣶⣶⡦
					--   ⣄⢻⣿⣧⠻⠇⠋⠀⠋⠀⢘⣿⢳⣦⣌⠳⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠞⣡⣴⣧⠻⣄⢸⣿⣿⡟⢁⡻⣸⣿⡿⠁
					--   ⠈⠃⠙⢿⣧⣙⠶⣿⣿⡷⢘⣡⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣷⣝⡳⠶⠶⠾⣛⣵⡿⠋⠀⠀
					--   ⠀⠀⠀⠀⠉⠻⣿⣶⠂⠘⠛⠛⠛⢛⡛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠛⠀⠉⠒⠛⠀⠀⠀⠀⠀
					-- ]],
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
        ⣼⣾⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠋⠁⠀⠀⠀
    ]],

					keys = {
						{
							icon = " ",
							key = "f",
							desc = "Find File",
							action = ":lua Snacks.dashboard.pick('files')",
						},
						{
							icon = " ",
							key = "r",
							desc = "Recent Files",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						{
							icon = "󰒲 ",
							key = "L",
							desc = "Lazy",
							action = ":Lazy",
							enabled = package.loaded.lazy ~= nil,
						},
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
				sections = {
					{ section = "header" },
					{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
					{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
					{ section = "startup" },
				},
			},
			-- explorer = { enabled = true, size = 0.3 },
			indent = { enabled = true },
			input = {
				enabled = true,
			},
			terminal = {
				enabled = true,
				win = {
					wo = {
						winbar = "",
					},
				},
			},
			picker = {
				enabled = true,
				win = {
					style = {
						blend = 10,
					},
				},
				layout = {
					layout = {
						backdrop = true,
					},
				},
				sources = {
					explorer = {
						layout = {
							layout = {
								width = 26,
							},
							auto_hide = { "input" },
						},
					},
				},

				-- layout = {
				-- 	layout = {
				-- 		width = 0.5,
				-- 		height = 0.5,
				-- 	},
				-- },
			},
		},
		keys = {
			{
				"<leader>e",
				function()
					Snacks.explorer()
				end,
				desc = "Explorer",
			},
			{
				"<leader>tt",
				function()
					Snacks.terminal.toggle()
				end,
				desc = "Toggle Terminal",
			},
		},
	},
}
