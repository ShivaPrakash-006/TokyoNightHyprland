return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20, -- Terminal height (for horizontal)
			open_mapping = [[<C-t>]], -- Shortcut to open terminal
			direction = "float", -- Can be 'vertical', 'horizontal', 'tab', or 'float'
			shade_terminals = true, -- Darkens background of terminal
			float_opts = { border = "curved" }, -- Floating terminal border
			on_create = function(term)
				term:send("fish")
			end,
		})
	end,
}
