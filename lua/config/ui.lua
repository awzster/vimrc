-- lua/config/ui.lua
local utils = require("config.utils")

-- lualine
require('lualine').setup({
  options = {
    theme = 'catppuccin',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = { utils.filename_with_bufnr },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location', utils.char_code },
  },
  tabline = {
    lualine_c = {
      {
        'buffers',
        mode = 2,
        max_length = 140,
        show_buffer_close_icons = false,
        show_filename_only = true,
        fmt = function(name, ctx)
          local n = ctx and ctx.bufnr or 0
          if name == "" then name = "[No Name]" end
          return string.format("[%d %s]", n, vim.fn.fnamemodify(name, ":t"))
        end,
      }
    },
    lualine_z = { 'tabs' },
  },
  extensions = { 'quickfix', 'nvim-tree', 'aerial' }
})

-- nvim-tree
require("nvim-tree").setup()
vim.keymap.set("n", "<F12>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- telescope
local telescope = require("telescope")
telescope.setup({
  defaults = {
    vimgrep_arguments = {
      "rg","--color=never","--no-heading","--with-filename",
      "--line-number","--column","--smart-case",
    },
    prompt_prefix = "🔍 ",
    selection_caret = "➤ ",
    path_display = { "truncate" },
  },
})
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Help" })
vim.keymap.set("n", "<leader>o", function() builtin.lsp_document_symbols() end, { desc = "Document Symbols" })

