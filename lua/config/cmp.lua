-- lua/config/cmp.lua
local cmp = require("cmp")
local luasnip = require("luasnip")
local compare = require("cmp.config.compare")

local kind_icons = {
  Text="", Method="󰆧", Function="󰊕", Constructor="", Field="󰇽", Variable="󰂡",
  Class="󰠱", Interface="", Module="", Property="󰜢", Unit="", Value="󰎠",
  Enum="", Keyword="󰌋", Snippet="", Color="󰏘", File="󰈙", Reference="󰈇",
  Folder="󰉋", EnumMember="", Constant="󰏿", Struct="󰙅", Event="", Operator="󰆕",
}

cmp.setup({
  snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  -- Автоматически показывать при вводе
  completion = {
    completeopt = "menu,menuone,noinsert",
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),

    -- Подтверждение выбора по Enter
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- ← это ключевая строка

    -- Tab используем ТОЛЬКО для прыжков по placeholder'ам (если список скрыт)
    ["<Tab>"] = function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
  }),

  sources = cmp.config.sources({
    { name = "luasnip",  priority = 1000 },
    { name = "buffer",   priority = 750,
      option = {
        keyword_length = 3,
        get_bufnrs = function() return vim.api.nvim_list_bufs() end,
      },
    },
    { name = "nvim_lsp", priority = 500 },
    { name = "path",     priority = 250 },
  }),
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind] or "", vim_item.kind)
      vim_item.menu = ({ nvim_lsp="[LSP]", luasnip="[Snip]", buffer="[Buf]", path="[Path]" })[entry.source.name]
      return vim_item
    end,
  },
  sorting = {
    comparators = {
      function(e1, e2)
        local row, col0 = unpack(vim.api.nvim_win_get_cursor(0))
        local line = vim.api.nvim_get_current_line()
        local before = (col0 > 1) and line:sub(1, col0 - 1) or ""
        local input = before:match("[%w_]+$") or ""
        if input == "" then return end
        local function score(label)
          local head = label:sub(1, #input)
          if head == input then return 4 end
          if head:lower() == input:lower() then return 3 end
          if label:find("[_%-/%.]" .. vim.pesc(input)) then return 2 end
          local letters = label:gsub("[^%a]", "")
          if #letters >= #input and letters:find(input, 2, true) == 2 then return 2 end
          if label:lower():find(input:lower(), 1, true) then return 1 end
          return 0
        end
        local l1 = e1.completion_item.label or ""
        local l2 = e2.completion_item.label or ""
        local s1, s2 = score(l1), score(l2)
        if s1 ~= s2 then return s1 > s2 end
      end,
      compare.exact, compare.score, compare.recently_used, compare.offset,
      compare.kind, compare.sort_text, compare.length, compare.order,
    },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = { ghost_text = true },
})

-- UX для popup
vim.o.completeopt = "menu,menuone,noselect"

