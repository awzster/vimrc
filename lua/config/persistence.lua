-- lua/config/persistence.lua
vim.opt.viewoptions = { "cursor", "folds" }

-- save view
vim.api.nvim_create_autocmd("BufWinLeave", {
  callback = function(args)
    if vim.bo[args.buf].buftype ~= "" then return end
    pcall(vim.cmd, "silent! mkview")
  end,
})

-- load view (fallback к последней позиции)
vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function(args)
    if vim.bo[args.buf].buftype ~= "" then return end
    if not pcall(vim.cmd, "silent loadview") then
      local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
      local lnum, col = mark[1], mark[2]
      local last = vim.api.nvim_buf_line_count(args.buf)
      if lnum > 0 and lnum <= last then
        pcall(vim.api.nvim_win_set_cursor, 0, { lnum, col })
      end
    end
  end,
})

