return {
	"nvimdev/indentmini.nvim",
	event = "BufEnter",
	config = function()
		require("indentmini").setup({
			char = "|",
			-- char = "▏",
			exclude = {
				"erlang",
				"markdown",
			},
		})
		-- use comment color
		vim.cmd.highlight("default link IndentLine Comment")
	end,
}
