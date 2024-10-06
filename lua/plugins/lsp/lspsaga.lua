return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	after = "nvim-lspconfig",
	config = function()
		require("lspsaga").setup({
			code_action = { extend_gitsigns = true },
			ui = {
				code_action = "",
			},
		})
	end,
}
