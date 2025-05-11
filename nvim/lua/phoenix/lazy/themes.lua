return {
	"lmantw/themify.nvim",
	lazy = false,
	priority = 999,

	config = function()
		require("themify").setup({
			async = true,
			activity = true,
			"folke/tokyonight.nvim",
			"sho-87/kanagawa-paper.nvim",
			"comfysage/evergarden",
			"Mofiqul/vscode.nvim",
			"nyoom-engineering/oxocarbon.nvim",
		})
	end,
}
