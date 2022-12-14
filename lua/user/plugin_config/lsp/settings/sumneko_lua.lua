return {
	settings = {
		Lua = {
			completion = {
				enable = true,
			},
			diagnostics = {
				enable = true,
				globals = {
					"vim",
				},
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
