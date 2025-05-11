return {
	"AckslD/nvim-neoclip.lua",
	dependencies = { "kkharji/sqlite.lua", module = "sqlite" },
	config = function()
		require("neoclip").setup({
			enable_persistent_history = true,
			enable_macro_history = true,
			countinous_sync = true,
			default_register = "+",
			keys = {
				telescope = {
					i = {
						select = "<CR>",
					},
				},
			},
		})
	end,
}
