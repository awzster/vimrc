-- lua/config/treesitter.lua
require("nvim-treesitter.configs").setup({
  ensure_installed = { "javascript", "typescript", "tsx", "html", "css", "json", "lua" },
  highlight = { enable = true },
  incremental_selection = { enable = true },
  matchup = { enable = true },
  indent = { enable = true, disable = { 'xml' } }
})

