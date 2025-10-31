return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			local function on_attach(client, bufnr)
				local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
				if client.name == "emmet_language_server" and filetype == "templ" then
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end
			end

			-- Remove the incorrect mini.completion line
			-- capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities.textDocument.completion.completionItem.resolveSupport = {
				properties = { "documentation", "detail" },
			}

			local lspconfig = require("lspconfig")

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
				"asm_lsp",
				"cmake",
				"kotlin_language_server",
			})

			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = {
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"typescript",
					"scss",
					"svelte",
					"pug",
					"typescriptreact",
					"templ",
					"vue",
					"php",
					"blade",
				},
			})
		end,
	},
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename Symbol" }),
	vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover, { desc = "LSP Hover/Show Docs" }),
}
