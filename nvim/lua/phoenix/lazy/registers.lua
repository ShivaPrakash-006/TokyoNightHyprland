return {
	"tversteeg/registers.nvim",
	config = function()
		require("registers").setup({
			show_empty = false,
			bind_keys = {
				normal = '"',
				insert = false,
			},
		})
	end,
}
