return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		spec = {
			{ "<leader>f", group = "Find / Format" },
			{ "<leader>e", group = "Explorer" },
			{ "<leader>h", group = "Git Hunks" },
			{ "<leader>x", group = "Diagnostics" },
			{ "<leader>q", group = "Sessions" },
			{ "<leader>s", group = "Splits" },
			{ "<leader>t", group = "Tabs" },
			{ "<leader>g", group = "Git" },
		},
	},
}
