-- ~/.config/nvim/init.lua

-- 1. Настройка PATH
local nvm_bin = os.getenv("HOME") .. "/.nvm/versions/node/v24.1.0/bin"
vim.env.PATH = nvm_bin .. ":" .. (vim.env.PATH or "")

-- Кастомный компонент: "[bufnr] filename"
local filename_with_bufnr = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
  if filename == "" then filename = "[No Name]" end
  return string.format("[%d] %s", bufnr, filename)
end


-- 2. Установка lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "https://github.com/folke/lazy.nvim", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- 3. ЗАГРУЗКА ПЛАГИНОВ (таблица закрывается })
require("lazy").setup({
  { "folke/lazy.nvim", version = false },
  { "drmingdrmer/xptemplate" },
  { "tpope/vim-surround" },
  { "alvan/vim-closetag" },
  { "andymass/vim-matchup" },
  { "Raimondi/delimitMate" },
  { "othree/xml.vim" },
  { "othree/html5.vim" },
  { "pangloss/vim-javascript" },
  { "osyo-manga/vim-anzu" },
  { "skywind3000/asyncrun.vim" },
  { "kshenoy/vim-signature" },
  { "liuchengxu/vista.vim" },
  { "brooth/far.vim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({ flavour = "mocha" })
      vim.cmd("colorscheme catppuccin")
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'catppuccin', -- или 'tokyonight', 'kanagawa' и т.д.
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = { filename_with_bufnr },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        tabline = {
          lualine_a = { 'buffers' },
          lualine_z = { 'tabs' }
        },
        extensions = { 'quickfix', 'nvim-tree' }
      })
    end
  },

 
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" }, -- компактные ошибки под строкой

  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip" },
  --   config = function()
  --     local cmp = require("cmp")
  --     cmp.setup({
  --       snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
  --       sources = { { name = "nvim_lsp" } },
  --       mapping = cmp.mapping.preset.insert({
  --         ["<Down>"] = cmp.mapping.select_next_item(),
  --         ["<Up>"] = cmp.mapping.select_prev_item(),
  --         ["<CR>"] = cmp.mapping.confirm({ select = true }),
  --       }),
  --     })
  --   end,
  -- },

  {
	  "sainnhe/everforest",
	  lazy = false,
	  priority = 1000,
	  config = function()
		  vim.cmd("colorscheme everforest")
	  end,
  },
  {
	  "sainnhe/gruvbox-material",
	  lazy = false,
	  priority = 1000,
	  config = function()
		  vim.cmd("colorscheme gruvbox-material")
	  end,
  },
  {
	  "tanvirtin/monokai.nvim",
	  lazy = false,
	  priority = 1000,
	  config = function()
		  vim.cmd("colorscheme monokai")
	  end,
  },

  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000,
  -- config = function()
  --   require("catppuccin").setup({ flavour = "mocha" }) -- или "macchiato"
  --   vim.cmd("colorscheme catppuccin")
  --   end
  -- },
-- {
--   "tanvirtin/monokai.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd("colorscheme monokai")
--   end,
-- },

{
  "stevearc/conform.nvim",
  event = "VeryLazy",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        js = { "eslint_d" },
        jsx = { "eslint_d" },
        -- Опционально: добавьте другие языки
        -- typescript = { "eslint_d" },
        -- typescriptreact = { "eslint_d" },
        -- json = { "prettier" },
        -- html = { "prettier" },
        -- css = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = true,
      },
      -- Не нужно переопределять eslint_d — он встроен в conform
    })
  end,
},

{ "williamboman/mason.nvim" },
{ "neovim/nvim-lspconfig" },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim", "nvim-lspconfig" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "eslint", "html", "cssls", "ts_ls" },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
        },
      })
    end,
  },
})  -- ← ЗАКРЫВАЮЩАЯ СКОБКА ТАБЛИЦЫ

-- Показывать ошибки справа от кода
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
})
-- 4. ПОДКЛЮЧЕНИЕ ВАШИХ .VIM-ФАЙЛОВ (ВНЕ ТАБЛИЦЫ!)
vim.cmd("source ~/.config/nvim/src/functions.vim")
vim.cmd("source ~/.config/nvim/src/keymaps.vim")
vim.cmd("source ~/.config/nvim/src/plugin-config.vim")

-- Навигация стрелками в popup-меню командной строки
vim.cmd([[
  cnoremap <expr> <Down> wildmenumode() ? "\<C-n>" : "\<Down>"
  cnoremap <expr> <Up>   wildmenumode() ? "\<C-p>" : "\<Up>"
]])

vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8,ucs-bom,default,latin1"

vim.env.ESLINT_CONFIG = "/home/za/.eslint.config.cjs"
vim.keymap.set("c", "<S-Insert>", "<C-r>+")

-- Переключение на N-й буфер в списке (1–9) по <Leader> + цифра
for i = 1, 9 do
  vim.keymap.set("n", "<Leader>" .. i, function()
    -- Получаем список всех отображаемых буферов (listed = true)
    local bufs = vim.fn.getbufinfo({ buflisted = 1 })
    if bufs[i] then
      vim.cmd("buffer " .. bufs[i].bufnr)
    end
  end, { desc = "Switch to buffer #" .. i })
end

--
-- Автозакрытие скобок, кавычек и т.д.
-- vim.cmd([[let g:delimitMate_autoclose = 1]])
-- vim.cmd([[let g:delimitMate_matchpairs = "(:),[:],{:}"]])
-- vim.cmd([[let g:delimitMate_quotes = "\"'`"]])
