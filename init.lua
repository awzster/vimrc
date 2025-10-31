-- ~/.config/nvim/init.lua

-- 0) базовые модули
require("config.utils")              -- nvm PATH, helpers

-- 1) lazy + плагины
require("config.plugins")            -- объявление плагинов

-- 2) конфигурации по плагинам/подсистемам
require("config.ui")                 -- lualine / nvim-tree / telescope
require("config.cmp")                -- nvim-cmp
require("config.lsp")                -- mason / lspconfig / eslint, ts_ls
require("config.treesitter")         -- treesitter базовые модули
require("config.autopairs_autotag")  -- autopairs + autotag
require("config.conform")            -- форматирование eslint_d / prettier
require("config.diagnostics")        -- lsp_lines и переключатели
require("config.persistence")        -- mkview/loadview + lastpos
require("config.filetypes")          -- xsl → xml

-- 3) .vim-подключения (как у тебя было)
vim.cmd("source ~/.config/nvim/src/functions.vim")
vim.cmd("source ~/.config/nvim/src/keymaps.vim")
vim.cmd("source ~/.config/nvim/src/plugin-config.vim")

-- 4) общее
--vim.o.completeopt = "menu,menuone,noselect"
vim.opt.fileencoding = "utf-8"
vim.opt.encoding = 'utf-8'

vim.keymap.set("c", "<S-Insert>", "<C-r>+")

vim.cmd([[
  filetype plugin indent on
  syntax enable
]])
--vim.cmd("filetype plugin indent on")

-- Навигация стрелками в wildmenu
vim.cmd([[
  cnoremap <expr> <Down> wildmenumode() ? "\<C-n>" : "\<Down>"
  cnoremap <expr> <Up>   wildmenumode() ? "\<C-p>" : "\<Up>"
]])

-- Тема
vim.cmd("colorscheme gruvbox-material")

-- GUI
if vim.fn.has("gui_running") == 1 then
  vim.opt.guifont = "FiraCode Nerd Font Mono:h17"
end

