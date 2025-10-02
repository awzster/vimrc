-- ~/.config/nvim/init.lua

-- 1) PATH под nvm (ищем последний Node в ~/.nvm/versions/node/*/bin)
local home = os.getenv("HOME")
local handle = io.popen('bash -lc "ls -d ' .. home .. '/.nvm/versions/node/*/bin 2>/dev/null | sort -V | tail -n1"')
local nvm_bin = handle and handle:read("*l") or nil
if handle then handle:close() end
if nvm_bin and #nvm_bin > 0 then
  vim.env.PATH = nvm_bin .. ":" .. (vim.env.PATH or "")
end

-- Кастомный компонент: "[bufnr] filename"
local filename_with_bufnr = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
  if filename == "" then filename = "[No Name]" end
  return string.format("[%d] %s", bufnr, filename)
end

local char_code = function()
  -- local col = vim.fn.col(".")        -- текущая колонка (1-based)
  -- local line = vim.fn.getline(".")   -- текущая строка
  -- if col <= #line then
  --   local char = line:sub(col, col)
  --   local code = string.byte(char)
  --   return string.format("U+%04X", code)
  -- else
  --   return "U+0020"
  -- end
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))       -- 1-based
  local line = vim.api.nvim_get_current_line()
  -- Индекс байта на позицию курсора (0-based → 1-based)
  local byteidx = vim.str_byteindex(line, col - 1) + 1
  local cp = utf8.codepoint(line, byteidx)
  if cp then
    return string.format("U+%04X", cp)
  end
  return ""
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
  --{ "othree/xml.vim" },
  --{ "othree/html5.vim" },
  --{ "pangloss/vim-javascript" },
  { "osyo-manga/vim-anzu" },
  { "skywind3000/asyncrun.vim" },
  { "kshenoy/vim-signature" },
  --{ "liuchengxu/vista.vim" },
  --{ "brooth/far.vim" },

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "sainnhe/everforest", lazy = false, priority = 1000 },
  { "sainnhe/gruvbox-material", lazy = false, priority = 1000 },
  { "tanvirtin/monokai.nvim", lazy = false, priority = 1000 },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'catppuccin',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = { filename_with_bufnr },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location', char_code },
        },
        tabline = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            {
              'buffers',
              mode = 2,
              max_length = 140,
              show_buffer_close_icons = false,
              show_filename_only = true,
              fmt = function(name, context)
                local n = context and context.bufnr or 0
                if name == "" then name = "[No Name]" end
                return string.format("[%d %s]", n, vim.fn.fnamemodify(name, ":t"))
              end,
            }
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'tabs' },
        },
        extensions = { 'quickfix', 'nvim-tree', 'aerial' }
      })
    end
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<F12>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          prompt_prefix = "🔍 ",
          selection_caret = "➤ ",
          path_display = { "truncate" },
        },
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
      vim.keymap.set("n", "<leader>o", function()
        require("telescope.builtin").lsp_document_symbols()
      end, { desc = "Document Symbols" })
    end,
  },

  { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 7000 },
          { name = "luasnip", priority = 500 },
          { name = "buffer", priority = 1000, option = {
            -- вернём список всех открытых буферов
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
            keyword_length = 3,  -- как обсуждали, чтобы не было шума
          },
        },
          { name = "path", priority = 100 },
        }),
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            else
              cmp.complete()
            end
          end),
          ["<C-n>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_next_item()
            else
              cmp.complete()
            end
          end),
          ["<Down>"] = cmp.mapping.select_next_item(),
          ["<Up>"] = cmp.mapping.select_prev_item(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        window = {
          completion = cmp.config.window.bordered(),       -- список кандидатов
          documentation = cmp.config.window.bordered(),    -- окно документации справа
        },
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "eslint_d" },
          javascriptreact = { "eslint_d" },
          typescript = { "eslint_d" },
          typescriptreact = { "eslint_d" },
          json = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
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
    end,
  },

  -- Плагины LSP (без конфигурации здесь — конфиг ниже в "LSP core")
  { "williamboman/mason.nvim" },
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason-lspconfig.nvim", dependencies = { "mason.nvim", "nvim-lspconfig" } },
})  -- ← ЗАКРЫВАЮЩАЯ СКОБКА ТАБЛИЦЫ

----------------------------------------------------------------------
-- LSP core: mason + mason-lspconfig + lspconfig + cmp capabilities --
----------------------------------------------------------------------

-- 1) Возможности автодополнения от nvim-cmp (важно подключить один раз)
local cmp_caps = require("cmp_nvim_lsp").default_capabilities()

-- 2) Единый on_attach для всех LSP
local function on_attach(client, bufnr)
  if client.name == "ts_ls" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end
  map("n", "gd", vim.lsp.buf.definition, "LSP: Go to definition")
  map("n", "gr", vim.lsp.buf.references, "LSP: References")
  map("n", "K",  vim.lsp.buf.hover, "LSP: Hover")
  map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename")
  map("n", "<leader>ca", vim.lsp.buf.code_action, "LSP: Code action")
end

-- 3) Инициализация mason + mason-lspconfig
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "eslint", "html", "cssls", "ts_ls" },
  handlers = {
    function(server)
      require("lspconfig")[server].setup({
        capabilities = cmp_caps,
        on_attach = on_attach,
      })
    end,
    ["eslint"] = function()
      require("lspconfig").eslint.setup({
        capabilities = cmp_caps,
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })
    end,
    ["ts_ls"] = function()
      require("lspconfig").ts_ls.setup({
        capabilities = cmp_caps,
        on_attach = on_attach,
        settings = {
          javascript = { suggest = { completeFunctionCalls = true } },
          typescript = { suggest = { completeFunctionCalls = true } },
        },
      })
    end,
  },
})

require("nvim-treesitter.configs").setup({
  ensure_installed = { "javascript", "typescript", "tsx", "html", "css", "json", "lua" },
  highlight = { enable = true },
  incremental_selection = { enable = true },
  matchup = { enable = true },
})

-- Инициализация плагина и стартовое состояние
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

-- 4. ПОДКЛЮЧЕНИЕ ВАШИХ .VIM-ФАЙЛОВ (ВНЕ ТАБЛИЦЫ!)
vim.cmd("source ~/.config/nvim/src/functions.vim")
vim.cmd("source ~/.config/nvim/src/keymaps.vim")
vim.cmd("source ~/.config/nvim/src/plugin-config.vim")

-- Навигация стрелками в popup-меню командной строки
vim.cmd([[
  cnoremap <expr> <Down> wildmenumode() ? "\<C-n>" : "\<Down>"
  cnoremap <expr> <Up>   wildmenumode() ? "\<C-p>" : "\<Up>"
]])

vim.o.completeopt = "menu,menuone,noselect"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8"
vim.keymap.set("c", "<S-Insert>", "<C-r>+")

-- Переключение на N-й буфер в списке (1–9) по <Leader> + цифра
for i = 1, 9 do
  vim.keymap.set("n", "<Leader>" .. i, function()
    local bufs = vim.fn.getbufinfo({ buflisted = 1 })
    if bufs[i] then
      vim.cmd("buffer " .. bufs[i].bufnr)
    end
  end, { desc = "Switch to buffer #" .. i })
end

-- Toggle LSP diagnostics
local diagnostics_enabled = true
local function toggle_diagnostics()
  diagnostics_enabled = not diagnostics_enabled
  if diagnostics_enabled then
    vim.diagnostic.show()
    vim.notify("Diagnostics: ON", vim.log.levels.INFO, { title = "LSP" })
  else
    vim.diagnostic.hide()
    vim.notify("Diagnostics: OFF", vim.log.levels.WARN, { title = "LSP" })
  end
end
--vim.keymap.set("n", "<Leader>f", toggle_diagnostics, { desc = "Toggle diagnostics" })

-- Маппинг
vim.cmd("colorscheme gruvbox-material")

-- Только для GUI (nvim-qt и др.)
if vim.fn.has("gui_running") == 1 then
  vim.opt.guifont = "FiraCode Nerd Font Mono:h17"
end

-- Настроить, что именно сохранять: курсор, свёртки, локальные опции
vim.opt.viewoptions = { "cursor", "folds" }

-- Сохраняем «вид» при выходе из окна
vim.api.nvim_create_autocmd("BufWinLeave", {
  callback = function(args)
    local buf = args.buf
    if vim.bo[buf].buftype ~= "" then return end
    pcall(vim.cmd, "silent! mkview")
  end,
})

-- Восстанавливаем «вид» при входе в окно (с фолбэком на метку '"')
vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function(args)
    local buf = args.buf
    if vim.bo[buf].buftype ~= "" then return end
    if not pcall(vim.cmd, "silent loadview") then
      local mark = vim.api.nvim_buf_get_mark(buf, '"')
      local lnum, col = mark[1], mark[2]
      local last = vim.api.nvim_buf_line_count(buf)
      if lnum > 0 and lnum <= last then
        pcall(vim.api.nvim_win_set_cursor, 0, { lnum, col })
      end
    end
  end,
})

