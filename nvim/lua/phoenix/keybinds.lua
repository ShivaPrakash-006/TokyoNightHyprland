-- telescope.nvim
local builtin = require("telescope.builtin")

-- There are more pickers, see https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#pickers
vim.keymap.set("n", "ff", builtin.find_files, { desc = "Telescope Find Files" })
vim.keymap.set("n", "fg", builtin.find_files, { desc = "Telescope Find Git Files" })
vim.keymap.set("n", "fb", builtin.buffers, { desc = "Telescope Buffers" })
vim.keymap.set("n", "fc", builtin.commands, { desc = "Telescope Find Commands" })
vim.keymap.set("n", "fk", builtin.keymaps, { desc = "Telescope Find Keymaps" })
vim.keymap.set("n", "fy", ":Telescope neoclip<CR>", { desc = "Telescope Find Yanks" })
vim.keymap.set("n", "ft", builtin.treesitter, { desc = "Telescope Treesitter" })
vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Telescope Goto Definition" })
vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Telescope Goto References" })
vim.keymap.set("n", "fd", builtin.diagnostics, { desc = "Telescope Find Diagnostics" })
vim.keymap.set("n", "gfc", builtin.git_commits, { desc = "Telescope Git Commits" })
vim.keymap.set("n", "gfb", builtin.git_branches, { desc = "Telescope Git Brances" })
vim.keymap.set("n", "ggs", builtin.git_status, { desc = "Telescope Git Status" })

-- today.nvim (journal)
vim.keymap.set("n", "<leader>td", ":Today<CR>", { desc = "Open Today's Journal" })

-- symbols-outline.nvim
vim.keymap.set("n", "so", ":SymbolsOutline<CR>", { desc = "Toggle SymbolsOutline" })

-- nvim-tree.lua
vim.keymap.set("n", "ft", ":NvimTreeToggle<CR>", { desc = "Toggle File Tree" })

-- luasnips.lua
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	mapping = {
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({select = true}) -- Scroll through completion menu
			elseif luasnip.locally_jumpable(1) then
				luasnip.jump(1) -- Jump to next argument
			else
				fallback() -- Insert a tab
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item() -- Scroll backwards in completion
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1) -- Jump back to previous argument
			else
				fallback()
			end
		end, { "i", "s" }),
	},
})

-- lspsaga.lua
vim.keymap.set("n", "<F2>", ":Lspsaga rename<CR>", { desc = "Rename Symbol Under Cursor" })
vim.keymap.set("n", "<leader>ca", ":Lspsaga code_action<CR>", { desc = "Code Action" })

-- conform.nvim
vim.keymap.set("n", "<leader>ff", function()
	require("conform").format()
end, { desc = "Format file" })

-- register.nvim
vim.keymap.set("n", '"', ":Register<CR>", { desc = "Search Registers" })

-- project.nvim
vim.keymap.set("n", "fp", ":Telescope projects<CR>", { desc = "Telescope Find Projects" })

-- persistence.nvim
vim.keymap.set("v", "cs", ":CodeSnapSave<CR>", { desc = "CodeSnap Selected Lines" })
vim.keymap.set("v", "chs", ":CodeSnapSaveHighlight<CR>", { desc = "CodeSnapHighlight Selected Lines" })

-- cheatsheet.nvim
vim.keymap.set("n", "<leader>h", ":Cheatsheet<CR>", { desc = "Open Cheatsheet" })

--quickfix.nvim
vim.keymap.set("n", "<leader>qf", ":copen<CR>", { desc = "Open QuickFix " })

-- sniprun.nvim
vim.keymap.set("v", "<leader>r", "<Plug>SnipRun", { silent = true, desc = "Run Selected Lines" })
vim.keymap.set("n", "<leader>r", "<Plug>SnipRun", { silent = true, desc = "Run Selected Line" })

-- lazygit.nvim
vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", { desc = "LazyGit" })

-- neoscroll.nvim
local neoscroll = require("neoscroll")
local keymap = {
	["<C-u>"] = function()
		neoscroll.ctrl_u({ duration = 250 })
	end,
	["<C-d>"] = function()
		neoscroll.ctrl_d({ duration = 250 })
	end,
	["<C-b>"] = function()
		neoscroll.ctrl_b({ duration = 450 })
	end,
	["<C-f>"] = function()
		neoscroll.ctrl_f({ duration = 450 })
	end,
	["<C-y>"] = function()
		neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
	end,
	["<C-e>"] = function()
		neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
	end,
	["zt"] = function()
		neoscroll.zt({ half_win_duration = 250 })
	end,
	["zz"] = function()
		neoscroll.zz({ half_win_duration = 250 })
	end,
	["zb"] = function()
		neoscroll.zb({ half_win_duration = 250 })
	end,
}
local modes = { "n", "v", "x" }
for key, func in pairs(keymap) do
	vim.keymap.set(modes, key, func)
end

-- minimap.nvim
local codewindow = require("codewindow")
vim.keymap.set("n", "<leader>mtt", function()
	codewindow.toggle_minimap()
end, { desc = "Toggle Minimap" })
vim.keymap.set("n", "<leader>mtf", function()
	codewindow.toggle_focus()
end, { desc = "Focus Minimap" })

-- zen.nvim
vim.keymap.set("n", "<leader>zm", ":ZenMode<CR>", { desc = "Toggle ZenMode " })

-- winshift.nvim
vim.keymap.set("n", "<C-w>m", ":WinShift<CR>", { desc = "Toggle WinShift Mode " })
vim.keymap.set("n", "<C-w>X", ":WinShift<CR>", { desc = "Swap Two Splits " })

-- trouble.nvim
vim.keymap.set("n", "<leader>xx", ":Trouble diagnostics toggle<CR>", { desc = "Toggle Trouble " })
