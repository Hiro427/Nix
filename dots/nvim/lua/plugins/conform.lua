return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format" },
			rust = { "rustfmt" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			go = { "gofmt" },
			fortran = { "fprettify" },
			haskell = { "ormolu" },
			nix = { "nixfmt" },
			sql = { "sql_formatter" },
			typ = { "typstyle" },
			toml = { "taplo" },
			sh = { "shfmt" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
