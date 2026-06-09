return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	cmd = { "Mason", "MasonInstall", "MasonUpdate" },
	config = function()
		local lsp_servers = require("config.lsp-servers")

		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = lsp_servers.servers,
			automatic_installation = false,
		})
	end,
}
