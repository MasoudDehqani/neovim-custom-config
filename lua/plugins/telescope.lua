return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			-- pickers = { find_files = { find_command = { "rg", "--files", "--hidden", "-g", "!.git" } } },
			-- pickers = {
			-- 	find_files = {
			-- 		find_command = {
			-- 			"fd",
			-- 			"--type",
			-- 			"f",
			-- 			"--color=never",
			-- 			"--hidden",
			-- 			"--follow",
			-- 			"-E",
			-- 			".git/*",
			-- 		},
			-- 	},
			-- },
			-- pickers = { find_files = { find_command = { "rg", "--ignore", "--hidden", "--files", "-u" } } },
			defaults = {
				-- path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		keymap.set("n", "<leader>fg", "<cmd>Telescope git_status<cr>", { desc = "Find git status" })

		keymap.set("n", "gtd", "<cmd>Telescope lsp_definitions<cr>")
		keymap.set("n", "gtr", "<cmd>Telescope lsp_references<cr>")
		keymap.set("n", "gti", "<cmd>Telescope lsp_implementations<cr>")

		local builtin = require("telescope.builtin")
		keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
	end,
}
