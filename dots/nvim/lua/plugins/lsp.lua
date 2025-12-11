return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities.textDocument.completion.completionItem.resolveSupport = {
				properties = { "documentation", "detail" },
			}

			vim.lsp.enable({
				"lua_ls",
				"gopls",
				"rust_analyzer",
				"zls",
				"clangd",
				"ts_ls",
				"bashls",
				"nixd",
				"ruff",
				"marksman",
				"emmet_language_server",
				"html",
				"spectral",
				"yamlls",
				"sqls",
				"taplo",
				"jdtls",
				"htmx",
				"intelephense",
				"dockerls",
				"svelte",
				"docker_compose_language_service",
				"terraformls",
				"templ",
				"fortls",
				"hls",
				"nim_langserver",
				"ols",
				"tinymist",
				"tailwindcss",
				"asm_lsp",
				"cmake",
				"kotlin_language_server",
			})
		end,
	},
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename Symbol" }),
	vim.keymap.set("n", "<leader>ld", vim.lsp.buf.hover, { desc = "LSP Hover/Show Docs" }),
}
