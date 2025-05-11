return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"stevearc/quicker.nvim",
		"nyngwang/NeoWell.lua",
		"yorickpeterse/nvim-pqf",
	},

	config = function()
		require("trouble").setup({
			{
				modes = {
					test = {
						mode = "diagnostics",
						preview = {
							type = "split",
							relative = "win",
							position = "right",
							size = 0.3,
						},
					},
				},
			},
		})
		require("quicker").setup()
		require("neo-well").setup({
			height = 10,
		})
		require("pqf").setup()
	end,
}
