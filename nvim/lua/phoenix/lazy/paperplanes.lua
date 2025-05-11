return {
	"rktjmp/paperplanes.nvim",
	-- options shown with default values
	config = function()
		require("paperplanes").setup({
			register = "+",
			provider = "paste.rs",
			provider_options = {},
			notifier = require("notify"),
		})
	end,
}
