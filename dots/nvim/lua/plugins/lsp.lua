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
				-- ...rest of your on_attach logic...
			end

			require("lspconfig").emmet_ls.setup({
				on_attach = on_attach,
				-- ...other options...
			})

			local lspconfig = require("lspconfig")
			local configs = require("lspconfig/configs")

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
				-- "tailwindcss",
				"ts_ls",
				"bashls",
				"nixd",
				"pylsp",
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
			})

			--   lspconfig.ts_ls.setup({
			--     capabilities = capabilities,
			--   })
			--   -- Add other servers as needed
			--
			--
			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
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
}
