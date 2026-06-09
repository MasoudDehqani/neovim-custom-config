return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"SmiteshP/nvim-navic",
			opts = {
				lsp = {
					auto_attach = true,
				},
			},
		},
	},
	config = function()
		local map = vim.keymap.set
		local lsp_servers = require("config.lsp-servers")

		local on_attach = function(_, bufnr)
			local function opts(desc)
				return { buffer = bufnr, desc = "LSP " .. desc }
			end

			map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
			map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
			map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
			map("n", "<leader>K", vim.lsp.buf.signature_help, opts("Show signature help"))
			map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
			map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

			map("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts("List workspace folders"))

			map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))
			map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
			map("n", "gr", vim.lsp.buf.references, opts("Show references"))
		end

		local on_init = function(client, _)
			if client.supports_method("textDocument/semanticTokens") then
				client.server_capabilities.semanticTokensProvider = nil
			end
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()

		capabilities.textDocument.completion.completionItem = {
			documentationFormat = { "markdown", "plaintext" },
			snippetSupport = true,
			preselectSupport = true,
			insertReplaceSupport = true,
			labelDetailsSupport = true,
			deprecatedSupport = true,
			commitCharactersSupport = true,
			tagSupport = { valueSet = { 1 } },
			resolveSupport = {
				properties = {
					"documentation",
					"detail",
					"additionalTextEdits",
				},
			},
		}

		for _, name in ipairs(lsp_servers.servers) do
			local server_opts = {
				on_attach = on_attach,
				on_init = on_init,
				capabilities = capabilities,
			}

			local settings = lsp_servers.server_settings[name]
			if settings then
				server_opts = vim.tbl_deep_extend("force", server_opts, settings)
			end

			vim.lsp.config(name, server_opts)
			vim.lsp.enable(name)
		end
	end,
}
