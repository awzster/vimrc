-- lua/config/diagnostics.lua
require("lsp_lines").setup()
vim.diagnostic.config({ virtual_text = false })
local lsp_lines_enabled = true

local function toggle_lsp_lines()
  lsp_lines_enabled = not lsp_lines_enabled
  vim.diagnostic.config({ virtual_text = not lsp_lines_enabled })
  require("lsp_lines").toggle()
  vim.notify("Diagnostics: " .. (lsp_lines_enabled and "lines" or "virtual_text"))
end
vim.keymap.set("n", "<leader>dl", toggle_lsp_lines, { desc = "Toggle diagnostics lines/text" })

-- (опционально) глобальный тумблер show/hide
-- local diagnostics_enabled = true
-- vim.keymap.set("n", "<Leader>f", function()
--   diagnostics_enabled = not diagnostics_enabled
--   if diagnostics_enabled then vim.diagnostic.show() else vim.diagnostic.hide() end
-- end, { desc = "Toggle diagnostics" })

