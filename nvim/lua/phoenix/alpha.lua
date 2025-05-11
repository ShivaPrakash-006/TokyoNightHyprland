local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set a custom header (ASCII Art)
dashboard.section.header.val = {
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}

-- Recent Files Button
dashboard.section.buttons.val = {
	dashboard.button("n", " New File", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", " Find File", ":Telescope find_files <CR>"),
	dashboard.button("r", "󱀸 Recent Files", ":Telescope oldfiles <CR>"),
	dashboard.button("ss", "󰁯 Select Session", function()
		require("persistence").select()
	end),
	dashboard.button("rs", "󰦛 Restore Session", function()
		require("persistence").load({ last = true })
	end),
	dashboard.button("p", " Open Project", ":Telescope projects <CR>"),
	dashboard.button("q", "󰈆 Quit", ":qa<CR>"),
}

-- Set Footer
-- dashboard.section.footer.val = { " Nice Code Brother! " }

-- Apply Settings
alpha.setup(dashboard.config)
