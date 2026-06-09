return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt", lsp_format = "fallback" },
			javascript = { "prettier", stop_after_first = true },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
		},
		format_on_save = function(bufnr)
			if vim.bo[bufnr].modifiable == false then
				return
			end
			local ft = vim.bo[bufnr].filetype
			if ft == "markdown" or ft == "gitcommit" then
				return
			end
			return { timeout_ms = 1000, lsp_format = "fallback" }
		end,
	},
	keys = {
		{
			"<leader>fnow",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end,
			mode = { "n", "v" },
			desc = "Format file or range (in visual mode)",
		},
	},
}
