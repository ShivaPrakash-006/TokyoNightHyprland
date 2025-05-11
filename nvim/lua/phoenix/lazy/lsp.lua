return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim", -- Info On Lsp and Progress
	},
	config = function()
		-- Managing Servers
		local servers = { "clangd", "cmake", "lua_ls", "ltex", "pyright", "vimls", "ts_ls", "eslint", "html", "marksman" } -- Language Servers
		require("mason").setup() -- Start mason
		require("fidget").setup() -- Start fidget
		require("mason-lspconfig").setup({
			ensure_installed = servers,
		})

		-- Activating Server
		local lspconfig = require("lspconfig")
		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
		end

		-- Code Completion
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		cmp.setup({
			snippet = { -- Snippets
				expand = function(args)
					luasnip.lsp_expand(args.body) -- LuaSnip
				end,
			},
			mapping = {
				["<Down>"] = cmp.mapping.select_next_item(),
				["<Up>"] = cmp.mapping.select_prev_item(),
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			},
			sources = { -- All Sources, For More Visit: https://github.com/hrsh7th/nvim-cmp?tab=readme-ov-file
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
		})
	end,
}
