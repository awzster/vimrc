-- lua/config/utils.lua
-- nvm PATH (ищем последний Node)
local home = os.getenv("HOME")
local handle = io.popen('bash -lc "ls -d ' .. home .. '/.nvm/versions/node/*/bin 2>/dev/null | sort -V | tail -n1"')
local nvm_bin = handle and handle:read("*l") or nil
if handle then handle:close() end
if nvm_bin and #nvm_bin > 0 then
  vim.env.PATH = nvm_bin .. ":" .. (vim.env.PATH or "")
end

-- полезные утилиты для статуса
local M = {}

M.filename_with_bufnr = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
  if filename == "" then filename = "[No Name]" end
  --return string.format("[%d] %s", bufnr, filename)
  return string.format("%s", bufnr, filename)
  --return filename
end

M.char_code = function()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0)) -- 1-based
  local line = vim.api.nvim_get_current_line()
  local byteidx = vim.str_byteindex(line, col - 1) + 1
  local cp = utf8.codepoint(line, byteidx)
  if cp then return string.format("U+%04X", cp) end
  return ""
end

return M

