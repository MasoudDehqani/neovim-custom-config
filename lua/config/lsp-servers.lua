local M = {}

M.servers = {
	"html",
	"cssls",
	"rescriptls",
	"ts_ls",
	"lua_ls",
	"tailwindcss",
	"rust_analyzer",
}

M.server_settings = {
	lua_ls = {
		settings = {
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
			},
		},
	},
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				checkOnSave = true,
			},
		},
	},
	ts_ls = {
		settings = {
			typescript = {
				format = { enable = false },
			},
			javascript = {
				format = { enable = false },
			},
		},
	},
	tailwindcss = {
		settings = {
			tailwindCSS = {
				includeLanguages = {
					typescript = "javascript",
					typescriptreact = "javascript",
				},
			},
		},
	},
}

return M
