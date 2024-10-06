return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	after = "nvim-lspconfig",
	config = function()
		require("lspsaga").setup({})
	end,
}
