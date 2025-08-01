return {
	"saghen/blink.cmp",
	version = "*",
	event = { "LspAttach" },
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	opts = {
		keymap = {
			preset = "enter",
			["C-k"] = { "select_prev", "fallback" },
			["C-j"] = { "select_next", "fallback" },
		},
		cmdline = {
			completion = { menu = { auto_show = true } },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			per_filetype = {
				sql = { "dadbod" },
			},
			providers = {
				cmdline = {
					min_keyword_length = 2,
				},
				dadbod = { module = "vim_dadbod_completion.blink" },
			},
		},
		completion = {
			menu = {
				border = "rounded",
				scrolloff = 1,
				scrollbar = false,
				winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
				-- draw = {
				--   treesitter = { 'lsp' },
				-- }
			},
			documentation = {
				auto_show_delay_ms = 0,
				auto_show = true,
				window = {
					border = "rounded",
					winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
				},
			},
		},
	},
}
