-- lua/config/conform.lua
require("conform").setup({
  formatters_by_ft = {
    javascript       = { "eslint_d" },
    javascriptreact  = { "eslint_d" },
    typescript       = { "eslint_d" },
    typescriptreact  = { "eslint_d" },
    json             = { "prettier" },
    --html             = { "prettier" },
    css              = { "prettier" },
    --xml              = { "xmllint" },
    --xsl              = { "xmllint" },
    --xslt             = { "xmllint" },
  },
  formatters = {
    xmllint = {
      command = "xmllint",
      args = {
        "--format",
        "--recover", -- игнорировать ошибки
        "-"
      },
      stdin = true,
    },
  },
  format_on_save = {
    timeout_ms = 2000,
    lsp_fallback = false,
  },
})
local conform = require("conform")
conform.formatters.eslint_d = {
  prepend_args = { "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" },
  cwd = function(_) return vim.env.HOME end,
}

