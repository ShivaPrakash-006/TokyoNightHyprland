return {
	"TobinPalmer/Tip.nvim",
	event = "VimEnter",
	init = function()
		--- @type Tip.config
		require("tip").setup({
			seconds = 1,
			title = "Tip!",
			url = "https://vtip.43z.one", -- Or https://vimiscool.tech/neotip
		})
	end,
}
