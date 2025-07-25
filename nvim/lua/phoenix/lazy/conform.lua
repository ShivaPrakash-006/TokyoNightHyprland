return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = { -- Formatters
      markdown = { "prettierd" },
      lua = { 'stylua' },
      c = { 'clang-format' },
      python = { 'black' },
      javascript = { 'prettierd' },
    },
    -- Set default options
    default_format_ops = {
      lsp_format = "fallback",
    },
    -- Set up format-on-save
    format_on_save = {
      timeout_ms = 500
    }
  }
}
