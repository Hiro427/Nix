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
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			-- ["<Esc>"] = { "cancel" },
		},
		cmdline = {
			keymap = { preset = "inherit" },
			completion = { menu = { auto_show = true } },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "lazydev" },
			providers = {
				cmdline = {
					min_keyword_length = 2,
				},
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
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
					-- border = "rounded",
					winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
				},
			},
		},
	},
}
