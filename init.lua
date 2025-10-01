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

local char_code = function()
  local col = vim.fn.col(".")        -- текущая колонка (1-based)
  local line = vim.fn.getline(".")   -- текущая строка
  if col <= #line then
    local char = line:sub(col, col)
    local code = string.byte(char)
    -- Можно отображать в десятичном (10) или шестнадцатеричном (0xA) виде
    return string.format("U+%04X", code)  -- например: U+0041
    -- Или: return tostring(code)        -- например: 65
  else
    -- На пустом месте (после конца строки)
    return "U+0020"  -- пробел, или можно ""
  end
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
  --{ "liuchengxu/vista.vim" },
  --{ "brooth/far.vim" },

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "sainnhe/everforest", lazy = false, priority = 1000 },
  { "sainnhe/gruvbox-material", lazy = false, priority = 1000 },
  { "tanvirtin/monokai.nvim", lazy = false, priority = 1000 },

{
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- для иконок (опционально, но рекомендуется)
  },
  opts = {
    -- Прикреплять aerial к каждому окну (а не глобально)
    attach_mode = "window",

    -- Вид панели: 'right', 'left', или 'float'
    layout = {
      default_direction = "right",
      max_width = 40,
      min_width = 20,
      width = 0.2, -- 20% ширины окна
    },

    -- Источники: LSP приоритетнее, fallback на Treesitter
    backends = { "lsp", "treesitter", "markdown" },

    -- Показывать направляющие для вложенности
    show_guides = true,
    guide_color = "Comment",

    -- Фильтрация: показывать только функции и классы (убери, если хочешь всё)
    -- filter_kind = { "Function", "Method", "Class", "Constructor" },

    -- Иконки (требуется nvim-web-devicons)
    icons = {
      ["Class"] = "",
      ["Constructor"] = "",
      ["Enum"] = "",
      ["Field"] = "",
      ["Function"] = "",
      ["Interface"] = "",
      ["Method"] = "",
      ["Namespace"] = "",
      ["Package"] = "",
      ["Property"] = "",
      ["Struct"] = "",
      ["Variable"] = "",
      ["Module"] = "",
    },

    -- Горячие клавиши внутри панели aerial
    keymaps = {
      ["?"] = "actions.show_help",
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.jump",
      ["<2-LeftMouse>"] = "actions.jump",
      ["p"] = "actions.scroll",
      ["["] = "actions.prev",
      ["]"] = "actions.next",
      ["{"] = "actions.prev_up",
      ["}"] = "actions.next_up",
      ["o"] = "actions.tree_toggle",
      ["O"] = "actions.tree_toggle_recursive",
      ["l"] = "actions.tree_open",
      ["h"] = "actions.tree_close",
      ["H"] = "actions.tree_close_recursive",
    },

    -- Не закрывать автоматически
    close_automatic_events = {},
  },
  keys = {
    -- Переключить панель aerial
    { "<leader>o", "<cmd>AerialToggle!<cr>", desc = "Toggle Aerial" },
    -- Навигация по символам БЕЗ открытия панели
    { "[s", "<cmd>AerialNavPrev<cr>", desc = "Prev symbol" },
    { "]s", "<cmd>AerialNavNext<cr>", desc = "Next symbol" },
    { "[S", "<cmd>AerialNavPrevUp<cr>", desc = "Prev root symbol" },
    { "]S", "<cmd>AerialNavNextUp<cr>", desc = "Next root symbol" },
  },
  -- Автоматически открывать aerial при открытии поддерживаемых файлов (опционально)
  -- config = function(_, opts)
  --   require("aerial").setup(opts)
  --   vim.api.nvim_create_autocmd("FileType", {
  --     pattern = { "lua", "python", "javascript", "typescript", "cpp", "rust" },
  --     callback = function()
  --       if not vim.b.aerial_open then
  --         vim.cmd("AerialOpen")
  --         vim.b.aerial_open = true
  --       end
  --     end,
  --   })
  -- end,
},

  -- {
  --   "stevearc/aerial.nvim",
  --   opts = {},
  --   config = function()
  --     require("aerial").setup({
  --       filter_kind = { "Function" },
  --       attach_mode = "global",     -- показывать outline во всех буферах
  --       layout = { min_width = 28 }, -- ширина панели
  --       show_guides = true,         -- визуальные отступы для вложенности
  --       filter_kind = false,        -- показывать все символы (функции, классы, переменные)
  --     })
  --     -- Открыть/закрыть по F9
  --     vim.keymap.set("n", "<F9>", "<cmd>AerialToggle<cr>", { desc = "Toggle outline" })
  --   end,
  --   -- Optional dependencies
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-tree/nvim-web-devicons"
  --   },
  -- },

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
          --lualine_z = { 'location' }
          lualine_z = { 'location', char_code },  -- ← добавили сюда
        },
        tabline = {
          lualine_a = {}, -- можно оставить пустым или добавить что-то слева
          lualine_b = {},
          lualine_c = {
            {
              'buffers',
              mode = 2, -- показывать все буферы (а не только видимые)
              max_length = 140, -- опционально: ограничить длину
              -- Кастомное форматирование каждого буфера:
              show_buffer_close_icons = false,
              show_filename_only = true,
              -- Главное — функция `format_buffer_name`:
              format_buffer_name = function(bufnr)
                local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
                if filename == "" then
                  filename = "[No Name]"
                end
                return string.format("[%d %s]", bufnr, filename)
              end,
            }
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'tabs' },
        }, 

    --    tabline = {
    --      lualine_a = { filename_with_bufnr },
    --      lualine_a = { 'buffers' },
    --      --lualine_z = { 'tabs' }
    --    },
        extensions = { 'quickfix', 'nvim-tree', 'aerial' }
      })
    end
  },
 
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- опционально, но рекомендуется
    },
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<F12>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- обязательная зависимость
      "nvim-tree/nvim-web-devicons", -- для иконок (опционально)
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          -- Путь к утилитам
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

      -- Горячие клавиши
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
    end,
  },
  { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" }, -- компактные ошибки под строкой

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
         { name = "nvim_lsp" },
         { name = "luasnip" },
         { name = "buffer" },  -- ← без option!
         { name = "path" },
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
             fallback() -- ведёт себя как обычный <Tab> (отступ)
           end
         end, { "i", "s" }),         --["<CR>"] = cmp.mapping.confirm({ select = true }),

       }),
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

      vim.lsp.config.ts_ls = {
        settings = {
          documentSymbols = { includeSourceFiles = true }
        }
      }
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

vim.keymap.set("n", "<Leader>f", toggle_diagnostics, { desc = "Toggle diagnostics" })

-- Маппинг
vim.cmd("colorscheme gruvbox-material")

-- Только для GUI (nvim-qt и др.)
if vim.fn.has("gui_running") == 1 then
  vim.opt.guifont = "FiraCode Nerd Font Mono:h17"
end

-- Сохраняем позицию ВСЕХ буферов при выходе из Neovim
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted then
        local cursor = vim.api.nvim_win_get_cursor(0)
        -- Но! Нужно найти окно, где этот буфер активен
        local win = nil
        for _, w in ipairs(vim.api.nvim_list_wins()) do
          if vim.api.nvim_win_get_buf(w) == bufnr then
            win = w
            break
          end
        end
        if win then
          local cursor = vim.api.nvim_win_get_cursor(win)
          pcall(vim.api.nvim_buf_set_mark, bufnr, '"', cursor[1], cursor[2] - 1, {})
        end
      end
    end
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    -- Ждём, пока буфер полностью загрузится
    vim.defer_fn(function()
      local line = vim.fn.line("'\"")
      if line > 1 and line <= vim.fn.line("$") then
        pcall(vim.cmd, "normal! g`\"")
        -- Опционально: отцентрировать курсор
        -- pcall(vim.cmd, "normal! zz")
      end
    end, 10) -- небольшая задержка в 10 мс
  end,
})
