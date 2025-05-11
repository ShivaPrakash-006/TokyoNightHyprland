return {
	"andweeb/presence.nvim",
	lazy = false, -- Loads immediately when NeoVim starts
	config = function()
		require("presence").setup({
			auto_update = true, -- Auto-update Discord status
			neovim_image_text = "Lazing Around in NeoVim", -- Custom NeoVim text
			main_image = "neovim", -- "neovim" or "file"
			client_id = "793271441293967371", -- Default Discord app ID
			debounce_timeout = 10, -- Time (in sec) before updating Discord
			enable_line_number = false, -- Show line number in status
			blacklist = {}, -- Ignore certain projects
			buttons = {
				{ label = "Github  ", url = "https://github.com/ShivaPrakash-006" },
			},
		})
	end,
}
