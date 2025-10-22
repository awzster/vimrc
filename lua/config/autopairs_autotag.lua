-- lua/config/autopairs_autotag.lua
require("nvim-autopairs").setup({
  map_cr = false,  -- ← отключает автоматическое форматирование на Enter
  -- Опционально: оставить автопары в строках/комментах только если нужно
  check_ts = true,
  ts_config = {
    javascript = { "string", "template_string", "comment" },
    typescript = { "string", "template_string", "comment" },
    javascriptreact = { "string", "template_string", "comment" },
    typescriptreact = { "string", "template_string", "comment" },
  },
})
-- autotag через прямой setup (новый API)
require("nvim-ts-autotag").setup({
  filetypes = {
    "html", "xml", "xsl",
    "javascriptreact", "typescriptreact", "jsx", "tsx",
    "vue", "svelte", "rescript",
    "heex","eex","erb","astro","glimmer","handlebars","hbs",
  },
})

