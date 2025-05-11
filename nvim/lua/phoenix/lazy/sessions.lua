return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- Load before opening files
	opts = {
		options = { "buffers", "curdir", "tabpages", "winsize", "terminal" },
	},
}
