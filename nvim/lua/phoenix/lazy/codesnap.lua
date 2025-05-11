return {
	"mistricky/codesnap.nvim",
	build = "make",
	config = function()
		require("codesnap").setup({
			mac_window_bar = true,
			title = "CodeSnap.nvim",
			code_font_family = "JetBrainsMono NF",
			watermark_font_family = "FiraCode Nerd Font",
			watermark = " @ShivaPrakash-006",
			bg_theme = "grape",
			breadcrumbs_separator = "/",
			has_breadcrumbs = true,
			has_line_number = true,
			show_workspace = false,
			min_width = 0,
			bg_x_padding = 122,
			bg_y_padding = 82,
			save_path = (os.getenv("HOME") .. "/Pictures/CodeSnap"),
		})
	end,
}
