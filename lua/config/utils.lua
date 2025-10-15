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
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))  -- 1-based row, 0-based col? No: col is 1-based *but* 0 means before first char
  if col == 0 then
    return ""
  end

  -- Get the single character at (row-1, col-1) to (row-1, col)
  -- Neovim API uses 0-based line indexing!
  local char_tbl = vim.api.nvim_buf_get_text(0, row - 1, col - 1, row - 1, col, {})
  local char = char_tbl[1] or ""

  if char == "" then
    return ""
  end

  -- Now get codepoint using Vim function
  local cp = vim.fn.char2nr(char)
  if cp and cp > 0 then
    return string.format("U+%04X", cp)
  else
    return ""
  end
end

return M

