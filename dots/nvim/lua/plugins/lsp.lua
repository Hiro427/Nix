return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			-- If you have a custom cmp capabilities function
			capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			capabilities.textDocument.formatting = {
				dynamicRegistration = false,
			}

			capabilities.textDocument.semanticTokens = capabilities.textDocument.semanticTokens or {}
			capabilities.textDocument.semanticTokens.augmentsSyntaxTokens = false

			capabilities.textDocument.completion.completionItem = {
				contextSupport = true,
				snippetSupport = true,
				deprecatedSupport = true,
				commitCharactersSupport = true,
				resolveSupport = {
					properties = {
						"documentation",
						"detail",
						"additionalTextEdits",
					},
				},
				labelDetailsSupport = true,
				documentationFormat = { "markdown", "plaintext" },
			}
			vim.lsp.enable({
				"lua_ls",
				"gopls",
				"rust_analyzer",
				"zls",
				"clangd",
				"tailwindcss",
				"ts_ls",
				"bashls",
				"nil",
				"pylsp",
				"marksman",
				"emmet_language_server",
				"html",
				"spectral",
				"yamlls",
				"sqls",
				"taplo",
				"jdtls",
				"intelephense",
				"dockerls",
			})
			--   local lspconfig = require("lspconfig")
			--   lspconfig.ts_ls.setup({
			--     capabilities = capabilities,
			--   })
			--   -- Add other servers as needed
		end,
	},
}
