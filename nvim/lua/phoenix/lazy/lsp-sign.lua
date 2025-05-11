return {
	"ray-x/lsp_signature.nvim",
	config = function()
		require("lsp_signature").setup({
			bind = true, -- This is mandatory for floating window
			hint_enable = false, -- Disable inline hints (optional)
			floating_window = true, -- Use a floating window
		})
	end,
}
